//
//  PCCInsightDetailsView.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTXYGraph+PCCGraph.h"
#import "PCCInsight.h"
#import "PCCImageView.h"

@protocol PCCInsightDetailsViewDelegate <NSObject>

-(void)pressedGraphWithImage:(UIImage*)image;

@end

@interface PCCInsightDetailsView : UIView

+(instancetype)newFromNib;
+(CGFloat)detailsViewHeightForInsight:(PCCInsight*)insight constrainedToWidth:(CGFloat)width;

@property(nonatomic)PCCInsight *insight;
@property(nonatomic,weak)id <PCCInsightDetailsViewDelegate>delegate;

@property(nonatomic,weak)IBOutlet PCCImageView *backgroundImageView;
@property(nonatomic,weak)IBOutlet CPTGraphHostingView *graphHostingView;
@property(nonatomic,weak)IBOutlet UILabel *insightDetailsLabel;
@property(nonatomic,weak)IBOutlet NSLayoutConstraint *insightDetailsLabelTopConstraint;
@property(nonatomic,weak)IBOutlet NSLayoutConstraint *insightDetailsLabelBottomConstraint;
@property(nonatomic,weak)IBOutlet NSLayoutConstraint *chartViewBottomConstraint;
@property(nonatomic,weak)IBOutlet NSLayoutConstraint *chartViewHeightConstraint;



@end
