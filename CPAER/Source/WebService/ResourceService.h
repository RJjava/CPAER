//
//  ResourceService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseHttpClient.h"
#import "Resource.h"
#import "Download.h"

typedef NS_ENUM(NSInteger,updateType) {
    deleteDown = 0,
    saveDown = 1
};

typedef NS_ENUM(NSInteger,resourceType) {
    text = 1,
    video = 2
};

@interface ResourceService : BaseHttpClient

+ (instancetype)sharedService;

- (void)getDownResourceWithResourceTypeId:(resourceType)typeId
                                  Handler:(completionInfiniteArrayHandler)handler;

- (void)updateDownWithDownloadResourceId:(NSInteger)resourceId
                              UpdateType:(updateType)type
                                 Handler:(completionHandler)handler;

- (void)getUserDownloadWithResourceTypeId:(resourceType)typeId
                                  Handler:(completionInfiniteArrayHandler)handler;

@end
