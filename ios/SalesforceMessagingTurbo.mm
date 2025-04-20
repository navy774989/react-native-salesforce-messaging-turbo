#import "SalesforceMessagingTurbo.h"
#import "SalesforceMessagingTurbo-Swift.h"
@implementation SalesforceMessagingTurbo{
  SalesforceMessagingTurboImpl *messagingInstance;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    messagingInstance = [SalesforceMessagingTurboImpl new];
  }
  return self;
}
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
(const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeSalesforceMessagingTurboSpecJSI>(params);
}

- (NSString * _Nullable)configureMessagingService:(NSString * _Nullable)serviceAPIUrl organizationId:(nonnull NSString *)organizationId developerName:(nonnull NSString *)developerName {
  return [messagingInstance configureMessagingServiceWithServiceAPIUrl:serviceAPIUrl organizationId:organizationId developerName:developerName ];
}

- (void)openChatPage {
  [messagingInstance openChatPage];
}

- (void)setPreChatData:(nonnull NSDictionary *)data {
  [messagingInstance setPreChatDataWithData:data];
}

+ (NSString *)moduleName {
  return  @"SalesforceMessaging";
}

@end
