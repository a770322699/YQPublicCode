//
//  UITableViewCell+SubViewBgColor.h
//  maygolf
//
//  Created by maygolf on 16/7/19.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SubViewBgColor)

@property (nonatomic, assign) BOOL mg_keepBgColorWhenHilight;  // 作为uitableViewCell的子视图时，在cell高亮时是否保持原有背景色

@end

@interface UITableViewCell (SubViewBgColor)

@end
