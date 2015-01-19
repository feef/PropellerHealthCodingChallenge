//
//  PCCImageView.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/17/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCCGlobals.h"

@interface PCCImageView : UIImageView

@property(nonatomic)PCCTemplateImageName imageType;
@property(nonatomic)PCCCornerRoundingPolicy cornerRoundingPolicy;

@end
