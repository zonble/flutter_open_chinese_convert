package com.example.flutter_opencc

import android.content.Context
import com.zqc.opencc.android.lib.ChineseConverter
import com.zqc.opencc.android.lib.ConversionType
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterOpenccPlugin(var context: Context) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val context = registrar.activeContext()
            val channel = MethodChannel(registrar.messenger(), "flutter_opencc")
            channel.setMethodCallHandler(FlutterOpenccPlugin(context))
        }
    }

    fun type(option: String): ConversionType? {
        return when (option) {
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
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "convert" -> {
                val arguments = call.arguments
                if (arguments is Array<*>) {
                    val text = arguments[0] as String
                    val optionString = arguments[1] as String
                    val option = type(optionString)
                    option?.let {
                        val converted = ChineseConverter.convert(text, it, this.context)
                        result.success(converted)
                    } ?: result.error("Not supported", null, null)
                } else {
                    result.error("Not an array", null, null)
                }
            }
            else -> result.notImplemented()
        }
    }
}
