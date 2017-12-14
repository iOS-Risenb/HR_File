

#import <Foundation/Foundation.h>

@interface NSString (HR_Directory)

/**
 遍历子目录

 @param recursive 是否递归遍历（子目录的子目录等）
 @param absolute 是否返回绝对路径
 @return 子目录
 */
- (NSArray <NSString *>*)HR_SubdirectoriesRecursive:(BOOL)recursive absolute:(BOOL)absolute;

@end
