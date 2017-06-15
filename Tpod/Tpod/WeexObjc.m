//
//  WeexObjc.m
//  Tpod
//
//  Created by 卢杨 on 17/3月/3.
//  Copyright © 2017年 卢杨. All rights reserved.
//

#import "WeexObjc.h"
#import "YYKit.h"

@implementation WeexObjc
- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)userInfo completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock
{
//    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        if (completedBlock) {
//            completedBlock(image, error, finished);
//        }
//    }];
     return (id<WXImageOperationProtocol>)[[YYWebImageManager sharedManager] requestImageWithURL:[NSURL URLWithString:url] options:0 progress:nil transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
         if (completedBlock) {
                     completedBlock(image, error, stage);
          }
     }];
}
@end
