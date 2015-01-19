//
//  PCCInsightCollectionViewCell.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCInsightCollectionViewCell.h"
#import "PCCHelperFunctions.h"
#import "PCCGlobals.h"

#define CONDENSED_CELL_HEIGHT 64

@interface PCCInsightCollectionViewCell ()

@property(nonatomic)PCCInsightDetailsView *detailsView;
@property(nonatomic)float headlineStartHeight;

@end

@implementation PCCInsightCollectionViewCell

-(void)awakeFromNib {
    
    [super awakeFromNib];
    self.condensedCellViewHeightConstraint.constant = CONDENSED_CELL_HEIGHT;
    self.headlineStartHeight = self.headlineLabelHeightConstraint.constant;
    [self.headlineLabel setFont:PCC_FONT_HEAVY];
    [self.messageLabel setFont:PCC_FONT_MEDIUM];
    [self.backgroundImageView setImageType:PCCTemplateImageNameBar];
    [self.expandIconImageView setTransform:CGAffineTransformMakeRotation(M_PI)];
    
}

-(void)prepareDetailView {
    
    if(!self.detailsView.superview) {
        
        [self.detailViewContainer addSubview:self.detailsView];
        [self.detailsView setFrame:self.detailViewContainer.bounds];
        [PCCHelperFunctions addFittingConstraintsBetweenView:self.detailViewContainer andSubview:self.detailsView];
        [self.detailsView setDelegate:self.detailsViewDelegate];
        
    }
    
    [self.detailsView setInsight:self.insight];
    
}

-(void)adjustToShowDetail:(BOOL)show {
    
    float targetAlpha = 1.0;
    float targetHeight = self.headlineStartHeight;
    float targetRotation = M_PI;

    if(show) {
        
        targetAlpha = 0.0;
        targetHeight = [PCCInsightCollectionViewCell cellHeightCondensed] - self.headlineLabelTopConstraint.constant * 2;
        targetRotation = 0.0;
        
    }
    
    if(targetHeight != self.headlineLabelHeightConstraint.constant) {
     
        self.messageLabel.alpha = targetAlpha;
        self.headlineLabelHeightConstraint.constant = targetHeight;
        [self.expandIconImageView setTransform:CGAffineTransformMakeRotation(targetRotation)];
        
    }
    
}

-(void)populateWithInsight:(PCCInsight*)insight expanded:(BOOL)expanded {
    
    self.insight = insight;
    self.headlineLabel.text = insight.headline;
    self.messageLabel.text = insight.message;
    [self.insightIconImageView setImage:[UIImage imageNamed:insight.imageName]];
    
    if(expanded) {
        
        [self prepareDetailView];
        
    }
    
    [self adjustToShowDetail:expanded];
    
}

+(CGFloat)cellHeightCondensed {
    
    return CONDENSED_CELL_HEIGHT;
    
}

+(CGFloat)cellHeightExpandedForInsight:(PCCInsight*)insight constrainedToCellWidth:(float)cellWidth {
    
    return [PCCInsightCollectionViewCell cellHeightCondensed] + [PCCInsightDetailsView detailsViewHeightForInsight:insight constrainedToWidth:cellWidth];
    
}

-(PCCInsightDetailsView *)detailsView {
    
    if(!_detailsView) {
        
        _detailsView = [PCCInsightDetailsView newFromNib];
        
    }
    return _detailsView;
    
}

-(void)setDetailsViewDelegate:(id<PCCInsightDetailsViewDelegate>)detailsViewDelegate {
    
    _detailsViewDelegate = detailsViewDelegate;
    [_detailsView setDelegate:detailsViewDelegate];
    
}

@end
