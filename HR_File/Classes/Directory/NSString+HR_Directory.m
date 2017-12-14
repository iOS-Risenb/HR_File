

#import "NSString+HR_Directory.h"

@implementation NSString (HR_Directory)

- (NSArray <NSString *>*)HR_SubdirectoriesRecursive:(BOOL)recursive absolute:(BOOL)absolute {
    NSMutableArray *marr = [NSMutableArray array];
    NSArray *subArray = [[NSFileManager defaultManager] subpathsAtPath:self];
    [subArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL isDir;
        [[NSFileManager defaultManager] fileExistsAtPath:[self stringByAppendingPathComponent:obj] isDirectory:&isDir];
        if (isDir) {
            if (recursive) {
                NSString *dir = obj;
                if (absolute) {
                    dir = [self stringByAppendingPathComponent:dir];
                }
                [marr addObject:dir];
            } else {
                BOOL isRecursiveDir = [obj componentsSeparatedByString:@"/"].count > 1;
                if (!isRecursiveDir) {
                    NSString *dir = obj;
                    if (absolute) {
                        dir = [self stringByAppendingPathComponent:dir];
                    }
                    [marr addObject:dir];
                }
            }
        }
    }];
    return marr;
}

@end
