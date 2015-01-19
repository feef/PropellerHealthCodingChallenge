//
//  PCCImageView.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/17/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCImageView.h"
#import "PCCGlobals.h"
#import "PCCHelperFunctions.h"

#define INSET PCC_CORNER_RADIUS / 2

@implementation PCCImageView

-(void)setImageType:(PCCTemplateImageName)imageType {
    
    _imageType = imageType;
    [self updateImage];

    
}

-(void)setCornerRoundingPolicy:(PCCCornerRoundingPolicy)cornerRoundingPolicy {
    
    _cornerRoundingPolicy = cornerRoundingPolicy;
    [self updateImage];
    
}

-(void)updateImage {
    
    [self setImage:[[UIImage imageNamed:[PCCHelperFunctions imageNameForRoundingPolicy:self.cornerRoundingPolicy imageName:self.imageType]] resizableImageWithCapInsets:UIEdgeInsetsMake(INSET, INSET, INSET, INSET)]];
    
}

@end
