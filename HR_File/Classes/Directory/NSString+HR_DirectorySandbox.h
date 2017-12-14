

#import <Foundation/Foundation.h>

@interface NSString (HR_DirectorySandbox)


+ (NSString *)HR_SandboxHome;

/**
 document : 适合存储重要数据。会被 itunes 备份。如缓存较大文件在此目录，可能审核被拒。
 */
+ (NSString *)HR_SandboxDocument;

/**
 library : 适合存储特定缓存数据，如下载的文件。不会被 itunes 备份。
 */
+ (NSString *)HR_SandboxLibrary;

/**
 library/preference : 适合存储程序配置信息等(NSUerdefault)。会被 itunes 备份。通常此目录为系统保留。
 */
+ (NSString *)HR_SandboxLibraryPreference;

/**
 library/cache : 适合存储垃圾缓存数据，清空缓存建议直接清空此目录即可，不会被 itunes 备份。
 */
+ (NSString *)HR_SandboxLibraryCache;

/**
 tmp : 适合存储临时文件（断点下载等临时文件）。不会被 itunes 备份，设备每次重新启动会清理这个目录下的全部内容。
 */
+ (NSString *)HR_SandboxTmp;

@end
