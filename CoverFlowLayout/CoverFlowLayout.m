//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by Victor Hong on 17/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout


-(void)prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.minimumLineSpacing = 0;
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.width / 3, self.collectionView.bounds.size.height / 2 );
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size = self.collectionView.bounds.size;
    
    // Modify the layout attributes as needed here
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        float distance = fabs(attribute.center.x - visibleRegion.origin.x - visibleRegion.size.width / 2);
        if (distance < self.itemSize.width / 2) {
            attribute.alpha = 1;
        } else {
            attribute.alpha = (self.itemSize.width / 2) / distance;
        }
        
        attribute.transform3D = CATransform3DMakeScale(1, 10, 2);
        attribute.transform3D = CATransform3DMakeRotation(distance / 3 * M_PI / 45, 0.25, 1.0, 0);
        
    }
    
    return attributes;
    
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
    
}

@end
