//
//  ViewController.m
//  FFmpeg4iOS
//
//  Created by 罗锦荣 on 2019/3/26.
//  Copyright © 2019年 obarong. All rights reserved.
//

#import "ViewController.h"
#ifdef __cplusplus
extern "C" {
#endif
    
#include "libavutil/opt.h"
#include "libavcodec/avcodec.h"
#include "libavformat/avformat.h"
#include "libswscale/swscale.h"
#include "ffmpeg.h"
    
#ifdef __cplusplus
};
#endif
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    av_register_all();
    NSLog(@"version=%d\n", avcodec_version());
    
    //获取文件位置
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *vidPath = @"rtsp://184.72.239.149/vod/mp4://BigBuckBunny_175k.mov";
//    NSString *vidPath = [NSString stringWithFormat:@"%@/testfile.mpg", docPath];
    
//    NSString *outPath = [NSString stringWithFormat:@"%@/h264.mp4", docPath];
    NSString *outPath = [NSString stringWithFormat:@"%@/a.mp3", docPath];
    
//    NSString *cmd=[NSString stringWithFormat:@"ffmpeg -y -i %@ -c:v libx264 -t 5 %@", vidPath, outPath];
    NSString *cmd=[NSString stringWithFormat:@"ffmpeg -y -i %@ -vn -f mp3 -t 5 %@", vidPath, outPath];
    NSArray *array = [cmd componentsSeparatedByString:@" "];
    NSLog(@"array:%@",array);
    
    int argc = [array count];
    char *argv[argc];
    for (int i = 0; i < argc; i++) {
        argv[i] = [[array objectAtIndex:i] UTF8String];
    }
    jrRun(argc, argv);
    
}

@end
