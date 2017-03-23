//
//  HorizontalScrollView.h
//  HorizontalScroll
//
//  Created by fanxiaobin on 2017/3/22.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalScrollView : UIView

-(instancetype)initWithFrame:(CGRect)frame dataArr:(NSArray *)dataArr column:(NSInteger)column;

///单个item的高度
+ (CGFloat)heightForViewWithColumn:(NSInteger)column;


@property (nonatomic,copy) void (^didSelectItemAtIndexPathBlock) (NSIndexPath *);

@end
