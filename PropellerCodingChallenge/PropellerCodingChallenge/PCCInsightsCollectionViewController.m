//
//  PCCInsightsCollectionViewController.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#define CONTENT_INSET_HOR 6

#import "PCCInsightsCollectionViewController.h"
#import "PCCInsightCollectionViewCell.h"
#import <CHTCollectionViewWaterfallLayout/CHTCollectionViewWaterfallLayout.h>

@interface PCCInsightsCollectionViewController () <CHTCollectionViewDelegateWaterfallLayout, PCCInsightDetailsViewDelegate>

@property(nonatomic)CHTCollectionViewWaterfallLayout *insightsCollectionViewFlowLayout;
@property(nonatomic)NSMutableArray *selectedIndexes;
@property(nonatomic)float cellWidth;
@property(nonatomic)NSArray *insights;

@end

@implementation PCCInsightsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PCCInsightCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.collectionViewLayout = self.insightsCollectionViewFlowLayout;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.insights.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PCCInsightCollectionViewCell *cell = (PCCInsightCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PCCInsightCollectionViewCell *IPCcell = (PCCInsightCollectionViewCell*)cell;
    [IPCcell populateWithInsight:self.insights[indexPath.row] expanded:[self.selectedIndexes containsObject:indexPath]];
    [IPCcell setDetailsViewDelegate:self];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake([(CHTCollectionViewWaterfallLayout*)collectionViewLayout itemWidthInSectionAtIndex:indexPath.row], [self.selectedIndexes containsObject:indexPath] ? [PCCInsightCollectionViewCell cellHeightExpandedForInsight:self.insights[indexPath.row] constrainedToCellWidth:self.cellWidth] : [PCCInsightCollectionViewCell cellHeightCondensed]);
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(![self.selectedIndexes containsObject:indexPath]) {
        
        [self.selectedIndexes addObject:indexPath];
        
    } else {
        
        [self.selectedIndexes removeObject:indexPath];
        
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        [collectionView performBatchUpdates:^{
            [(PCCInsightCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath] populateWithInsight:self.insights[indexPath.row] expanded:[self.selectedIndexes containsObject:indexPath]];
        } completion:nil];
    }];
    
}

-(NSMutableArray*)selectedIndexes {
    
    if(!_selectedIndexes) {
        
        _selectedIndexes = [[NSMutableArray alloc] init];
        
    }
    return _selectedIndexes;
    
}

-(CHTCollectionViewWaterfallLayout *)insightsCollectionViewFlowLayout {
    
    if(!_insightsCollectionViewFlowLayout) {
        
        _insightsCollectionViewFlowLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        _insightsCollectionViewFlowLayout.columnCount = 1;
        float inset = CONTENT_INSET_HOR;
        _insightsCollectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(inset, inset, inset, inset);
        self.cellWidth = self.collectionView.bounds.size.width - CONTENT_INSET_HOR * 2;
        
    }
    return _insightsCollectionViewFlowLayout;
    
}

-(NSArray *)insights {
    
    if(!_insights) {
        
        NSMutableArray *insights = [[NSMutableArray alloc] init];
        int numInsights = arc4random()%10 + 20;
        for(int i = 0; i<numInsights; i++) {
        
            [insights addObject:[PCCInsight randomInsight]];
            
        }
        _insights = insights;
        
    }
    return _insights;
    
}

-(void)pressedGraphWithImage:(UIImage*)image {
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[image] applicationActivities:nil];
    
    [self presentViewController:activityViewController animated:YES completion:nil];
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
