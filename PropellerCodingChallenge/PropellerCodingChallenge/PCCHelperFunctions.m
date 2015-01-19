//
//  PCCHelperFunctions.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCHelperFunctions.h"

@implementation PCCHelperFunctions

+(void)addFittingConstraintsBetweenView:(UIView*)view andSubview:(UIView*)subview {
    
    [subview setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0
                                                      constant:0.0]];
    
}


+(NSRange)rangeOfNumbersInArray:(NSArray*)array {
    
    NSNumber *lowest, *highest;
    lowest = [array firstObject];
    highest = [array firstObject];
    
    for (NSNumber *number in array) {
        
        if(number.unsignedIntegerValue > highest.unsignedIntegerValue) {
            
            highest = number;
            
        } else if(number.unsignedIntegerValue < lowest.unsignedIntegerValue) {
            
            lowest = number;
            
        }
        
    }
    
    return NSMakeRange(lowest.unsignedIntegerValue, highest.unsignedIntegerValue - lowest.unsignedIntegerValue);
}

+(NSString*)imageNameForRoundingPolicy:(PCCCornerRoundingPolicy)roundingPolicy imageName:(PCCTemplateImageName)imageName {
    
    return [NSString stringWithFormat:@"%@%@Round", [PCCHelperFunctions stringForTemplateImageName:imageName], [PCCHelperFunctions stringForRoundingPolicy:roundingPolicy]];
    
}

+(NSString*)saveLocationForImageWithRoundingPolicy:(PCCCornerRoundingPolicy)roundingPolicy imageName:(PCCTemplateImageName)imageName {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@", [PCCHelperFunctions imageNameForRoundingPolicy:roundingPolicy imageName:imageName]]];
    
}

+(NSString*)stringForRoundingPolicy:(PCCCornerRoundingPolicy)roundingPolicy {
    
    switch (roundingPolicy) {
        case PCCCornerRoundingPolicyAll:
            return @"All";
            break;
        case PCCCornerRoundingPolicyTop:
            return @"Top";
            break;
        case PCCCornerRoundingPolicyBottom:
            return @"Bottom";
            break;
            
        default:
            break;
    }
    
}

+(NSString*)stringForTemplateImageName:(PCCTemplateImageName)imageName {
    
    switch (imageName) {
        case PCCTemplateImageNameBackground:
            return @"background";
            break;
        case PCCTemplateImageNameBar:
            return @"bar";
            break;
        case PCCTemplateImageNameForeground:
            return @"foreground";
            break;
            
        default:
            break;
    }
    
}

@end
