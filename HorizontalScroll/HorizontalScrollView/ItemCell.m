//
//  ItemCell.m
//  HorizontalScroll
//
//  Created by fanxiaobin on 2017/3/22.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "ItemCell.h"
#import "HorizontalScrollView.h"
#import "UIImageView+CornnerRadius.h"

@implementation ItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSInteger column = 5;
    CGFloat width = [UIScreen mainScreen].bounds.size.width / column - 20;
//    self.icon.clipsToBounds = YES;
//    self.icon.layer.cornerRadius = width / 2.0;
    
    [self.icon cornerRadiusForShareLayerWithImageViewWidth:width];

    
}

@end
