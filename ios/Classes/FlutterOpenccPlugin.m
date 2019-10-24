#import "FlutterOpenccPlugin.h"
#import <flutter_open_chinese_convert/flutter_open_chinese_convert-Swift.h>

@implementation FlutterOpenccPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterOpenccPlugin registerWithRegistrar:registrar];
}
@end
