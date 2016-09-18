//
//  NSObject+YQPosition.h
//  maygolf
//
//  Created by maygolf on 16/6/17.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import <Foundation/Foundation.h>

struct YQPosition {
    NSInteger x;
    NSInteger y;
};
typedef struct YQPosition YQPosition;

static inline YQPosition YQPositionMake(NSInteger x, NSInteger y)
{
    YQPosition position; position.x = x; position.y = y; return position;
}

@interface NSObject (YQPosition)

@property (nonatomic, assign) YQPosition yq_position;

@end
