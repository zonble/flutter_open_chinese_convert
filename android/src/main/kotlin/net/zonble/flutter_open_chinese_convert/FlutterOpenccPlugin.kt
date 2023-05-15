package net.zonble.flutter_open_chinese_convert

import android.content.Context
import com.zqc.opencc.android.lib.ChineseConverter
import com.zqc.opencc.android.lib.ConversionType
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import kotlinx.coroutines.*
import kotlinx.coroutines.Dispatchers.IO

class FlutterOpenccPlugin(val context: Context) : FlutterPlugin {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val context = registrar.activeContext()
      val channel = MethodChannel(registrar.messenger(), "flutter_open_chinese_convert")
      channel.setMethodCallHandler(FlutterOpenccPlugin(context))
    }
  }

  private var job: Job? = null

  private fun typeOf(option: String): ConversionType? = when (option) {
    "s2t" -> ConversionType.S2T
    "t2s" -> ConversionType.T2S
    "s2hk" -> ConversionType.S2HK
    "hk2s" -> ConversionType.HK2S
    "s2tw" -> ConversionType.S2TW
    "tw2s" -> ConversionType.TW2S
    "s2twp" -> ConversionType.S2TWP
    "tw2sp" -> ConversionType.TW2SP
    "t2tw" -> ConversionType.T2TW
    "t2hk" -> ConversionType.T2HK
    else -> null
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "convert" -> {
        val arguments = call.arguments as? ArrayList<*>
        arguments?.also {
          val text = it[0] as String
          val typeString = it[1] as String
          val type = typeOf(typeString)
          val inBackground = it[2] as Boolean
          type?.let { option ->
            if (inBackground) {
              CoroutineScope(IO).launch {
                convert(text, type, result)
              }
            } else {
              val converted = ChineseConverter.convert(text, option, context)
              result.success(converted)
            }
          } ?: result.error("Not supported", null, null)
        }
      }
      else -> result.notImplemented()
    }
  }

  private suspend fun convert(text: String, option: ConversionType, result: Result) {
    withContext(IO) {
      val converted = ChineseConverter.convert(text, option, context)
      withContext(Dispatchers.Main) {
        result.success(converted)
      }
    }
  }

}
