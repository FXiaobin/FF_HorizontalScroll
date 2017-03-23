//
//  ViewController.m
//  HorizontalScroll
//
//  Created by fanxiaobin on 2017/3/22.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "ViewController.h"

#import "HorizontalScrollView.h"

@interface ViewController ()

@property (nonatomic,copy) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArr = @[@"飞动手术",
                     @"东方时尚",
                     @"而为撒啊",
                     @"股份大幅度",
                     @"大声道",
                     @"司法第三方",
                     @"似懂非懂是",
                     @"胜多负少",
                     @"的飞洒啊",
                     @"猥琐点是",
                     @"分为非是",
                     @"人过三十",
                     @"访问爱上"];
    
    
    NSInteger column = 5;
    //单个item的高度
    CGFloat height = [HorizontalScrollView heightForViewWithColumn:column];
    
    HorizontalScrollView *horizontalView = [[HorizontalScrollView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, height * 2) dataArr:self.dataArr column:column];
    horizontalView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:horizontalView];
    
    horizontalView.didSelectItemAtIndexPathBlock = ^(NSIndexPath *indexPath){
        
        NSLog(@"--- index = %ld",indexPath.item);
    };
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
