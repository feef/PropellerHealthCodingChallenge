//
//  PCCInsightCollectionViewCell.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCCInsight.h"
#import "PCCInsightDetailsView.h"
#import "PCCImageView.h"

@interface PCCInsightCollectionViewCell : UICollectionViewCell

+(CGFloat)cellHeightCondensed;
+(CGFloat)cellHeightExpandedForInsight:(PCCInsight*)insight constrainedToCellWidth:(float)cellWidth;
-(void)prepareDetailView;
-(void)populateWithInsight:(PCCInsight*)insight expanded:(BOOL)expanded;

@property(nonatomic)PCCInsight *insight;

@property(nonatomic,weak)id <PCCInsightDetailsViewDelegate>detailsViewDelegate;

@property(nonatomic,weak)IBOutlet NSLayoutConstraint *condensedCellViewHeightConstraint;
@property(nonatomic,weak)IBOutlet NSLayoutConstraint *headlineLabelHeightConstraint;
@property(nonatomic,weak)IBOutlet NSLayoutConstraint *headlineLabelTopConstraint;
@property(nonatomic,weak)IBOutlet UIImageView *insightIconImageView;
@property(nonatomic,weak)IBOutlet UIImageView *expandIconImageView;
@property(nonatomic,weak)IBOutlet PCCImageView *backgroundImageView;
@property(nonatomic,weak)IBOutlet UILabel *headlineLabel;
@property(nonatomic,weak)IBOutlet UILabel *messageLabel;
@property(nonatomic,weak)IBOutlet UIView *detailViewContainer;

@end
