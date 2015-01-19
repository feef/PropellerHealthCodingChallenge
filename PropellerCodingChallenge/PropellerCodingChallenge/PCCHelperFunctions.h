//
//  PCCHelperFunctions.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCCGlobals.h"

@interface PCCHelperFunctions : NSObject

+(void)addFittingConstraintsBetweenView:(UIView*)view andSubview:(UIView*)subview;
+(NSRange)rangeOfNumbersInArray:(NSArray*)array;
+(NSString*)imageNameForRoundingPolicy:(PCCCornerRoundingPolicy)roundingPolicy imageName:(PCCTemplateImageName)imageName;
+(NSString*)saveLocationForImageWithRoundingPolicy:(PCCCornerRoundingPolicy)roundingPolicy imageName:(PCCTemplateImageName)imageName;
+(NSString*)stringForRoundingPolicy:(PCCCornerRoundingPolicy)roundingPolicy;

@end
