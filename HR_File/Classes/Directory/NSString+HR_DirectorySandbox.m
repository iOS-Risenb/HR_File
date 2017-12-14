
#import "NSString+HR_DirectorySandbox.h"

@implementation NSString (HR_DirectorySandbox)

+ (NSString *)HR_SandboxHome {
    return NSHomeDirectory();
}

+ (NSString *)HR_SandboxDocument {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (NSString *)HR_SandboxLibrary {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (NSString *)HR_SandboxLibraryPreference {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingFormat:@"/Preference"];
}

+ (NSString *)HR_SandboxLibraryCache {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)HR_SandboxTmp {
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}


@end
