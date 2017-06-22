//
//  ResourceService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"
#import "Resource.h"
#import "Download.h"

typedef NS_ENUM(NSInteger,updateType) {
    deleteDown = 0,
    saveDown = 1
};

typedef NS_ENUM(NSInteger,resourceType) {
    text = 1,
    audio = 2
};

@interface ResourceService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)getDownResourceWithResourceTypeId:(resourceType)typeId
                                  Handler:(completionArrayHandler)handler;

- (void)updateDownWithDownloadResourceId:(NSInteger)resourceId
                              UpdateType:(updateType)type
                                 Handler:(completionHandler)handler;

- (void)getUserDownloadWithResourceTypeId:(resourceType)typeId
                                  Handler:(completionArrayHandler)handler;

@end
