#import "UIFont+SystemFontOverride.h"

@implementation UIFont (SystemFontOverride)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize {
  return [UIFont fontWithName:@"Roboto" size:fontSize];
}

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize {
  return [UIFont fontWithName:@"Roboto" size:fontSize];
}

#pragma clang diagnostic pop

@end

