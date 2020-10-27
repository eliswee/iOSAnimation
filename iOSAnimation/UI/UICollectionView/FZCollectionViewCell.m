//
//  FZCollectionViewCell.m
//  iOSAnimation
//
//  Created by may on 2020/7/28.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZCollectionViewCell.h"

@interface FZCollectionViewCell()

@property (nonatomic, strong) UILabel *labb;

@end

@implementation FZCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.labb];
        self.labb.center = self.contentView.center;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self.contentView addSubview:self.labb];
        self.labb.center = self.contentView.center;
    }
    return self;
}

- (void)setData:(NSString *)data {
    [self.labb setText:data];
    [self.labb sizeToFit];
    self.contentView.backgroundColor = [UIColor grayColor];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (UILabel *)labb {
    if (!_labb) {
        _labb = [[UILabel alloc] init];
        _labb.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_labb];
        _labb.textColor = [UIColor blackColor];
        _labb.center = self.contentView.center;
    }
    return _labb;
}

@end
