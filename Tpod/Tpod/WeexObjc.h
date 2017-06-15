//
//  WeexObjc.h
//  Tpod
//
//  Created by 卢杨 on 17/3月/3.
//  Copyright © 2017年 卢杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
@interface WeexObjc : NSObject<WXImgLoaderProtocol,WXModuleProtocol>
@property (strong, nonatomic) dispatch_queue_t ioQueue;
@end
