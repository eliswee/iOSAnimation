//
//  FZCollectionViewController.m
//  iOSAnimation
//
//  Created by may on 2020/7/10.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZCollectionViewController.h"
#import "FZCollectionViewController+delegates.h"

#import "FZCollectionLayout.h"
#import "FZCollectionFlowLayout.h"

#import <Masonry.h>
#import <YYCGUtilities.h>
#import "FZCollectionViewCell.h"
#import "clearCell.h"

@interface FZCollectionViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) FZCollectionLayout *layout;
@property (nonatomic, strong) FZCollectionFlowLayout *flowLayout;

@end

@implementation FZCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(@200);
    }];
}

- (void)setDataStrs:(NSArray *)dataStrs {
    _dataStrs = dataStrs;
}

#pragma mark - getters

- (UICollectionView *)collectionView {
    if (!_collectionView) {
//        UICollectionViewDiffableDataSource
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.layer.masksToBounds = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:FZCollectionViewCell.class forCellWithReuseIdentifier:@"fuck"];
        [_collectionView registerClass:clearCell.class forCellWithReuseIdentifier:@"clear"];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.pagingEnabled = YES;
    }
    return _collectionView;
}

- (FZCollectionLayout *)layout {
    if (!_layout) {
        _layout = [[FZCollectionLayout alloc] init];
    }
    return _layout;
}

- (FZCollectionFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[FZCollectionFlowLayout alloc] init];
        _flowLayout.itemCountPerRow = 4;
        _flowLayout.rowCount = 2;
        
        _flowLayout.minimumLineSpacing = 0.5f;
        _flowLayout.minimumInteritemSpacing = 0.5f;
        CGFloat squSize = (kScreenWidth - 1.5 ) / 4.f;
        _flowLayout.itemSize = CGSizeMake(squSize, 90);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _flowLayout;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
