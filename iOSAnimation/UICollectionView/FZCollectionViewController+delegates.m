//
//  FZCollectionViewController+delegates.m
//  iOSAnimation
//
//  Created by may on 2020/7/10.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZCollectionViewController+delegates.h"
#import "FZCollectionViewCell.h"

@implementation FZCollectionViewController (delegates)

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if (indexPath.item >= self.dataStrs.count) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"clear" forIndexPath:indexPath];
    }
    else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fuck" forIndexPath:indexPath];
        [(FZCollectionViewCell *)cell setData:self.dataStrs[indexPath.item]];
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataStrs.count + (8 - self.dataStrs.count % 8);
}

@end


