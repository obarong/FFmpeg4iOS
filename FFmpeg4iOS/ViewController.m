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
    
//    av_register_all();
//    NSLog(@"version=%d\n", avcodec_version());
    
    //获取文件位置
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *string =@"ffmpeg -i rtsp://184.72.239.149/vod/mp4://BigBuckBunny_175k.mov -vcodec copy -t 5 ";
    NSString *vidPath = [NSString stringWithFormat:@"%@/testfile.mpg", docPath];
    NSString *outPath = [NSString stringWithFormat:@"%@/out.mp4", docPath];
    NSString *cmd=[NSString stringWithFormat:@"ffmpeg -y -i rtsp://184.72.239.149/vod/mp4://BigBuckBunny_175k.mov -c:v copy -t 5 %@", outPath];
//    NSString *cmd=[NSString stringWithFormat:@"ffmpeg -y -i %@ -c:v copy -t 5 %@", vidPath, outPath];
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
