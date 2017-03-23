//
//  HorizontalScrollView.m
//  HorizontalScroll
//
//  Created by fanxiaobin on 2017/3/22.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "HorizontalScrollView.h"
#import "ItemCell.h"

static CGFloat margin = 10.0, labelHeight = 25.0;


@interface HorizontalScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,copy) NSArray *dataArr;

@property (nonatomic) NSInteger column;


@end

@implementation HorizontalScrollView

-(instancetype)initWithFrame:(CGRect)frame dataArr:(NSArray *)dataArr column:(NSInteger)column{
    if (self = [super initWithFrame:frame]) {
        self.dataArr = dataArr;
        _column = column;
        if (column == 0) {
            _column = 3;
        }
        
        [self createHorizontalLayoutCollectionView];
    }
    return self;
}

+ (CGFloat)heightForViewWithColumn:(NSInteger)column{
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = (kWidth/column - 2*margin) + 2*margin + labelHeight;
    return height;
}

- (void)createHorizontalLayoutCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0.0;
    layout.minimumInteritemSpacing = 0.0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [HorizontalScrollView heightForViewWithColumn:_column];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, height*2) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //_collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.scrollsToTop = NO;
    [_collectionView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellWithReuseIdentifier:@"ItemCell"];
    
    [self addSubview:_collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.dataArr[indexPath.item];
    cell.titleLabel.font = [UIFont systemFontOfSize:14.0 * ([UIScreen mainScreen].bounds.size.width / 375.0)];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [HorizontalScrollView heightForViewWithColumn:_column];
    
    return CGSizeMake(kWidth/_column, height);
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectItemAtIndexPathBlock) {
        self.didSelectItemAtIndexPathBlock(indexPath);
    }
}


@end
