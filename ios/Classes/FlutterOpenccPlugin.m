#import "FlutterOpenccPlugin.h"
#import <flutter_opencc/flutter_opencc-Swift.h>

@implementation FlutterOpenccPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterOpenccPlugin registerWithRegistrar:registrar];
}
@end
