//
//  PCCTemplateImageGenerator.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/17/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCTemplateImageGenerator.h"
#import <QuartzCore/QuartzCore.h>
#import "PCCGlobals.h"
#import "PCCHelperFunctions.h"

@implementation PCCTemplateImageGenerator

+(void)generateTemplateImageWithColor:(UIColor*)color fileName:(NSString*)fileName {
    
    [PCCTemplateImageGenerator generateTemplateImageWithColor:color fileName:fileName screenZoom:2];
    [PCCTemplateImageGenerator generateTemplateImageWithColor:color fileName:fileName screenZoom:3];

}

+(void)generateTemplateImageWithColor:(UIColor *)color fileName:(NSString *)fileName screenZoom:(int)zoom {
    
    [PCCTemplateImageGenerator generateTemplateImageWithColor:color fileName:fileName screenZoom:zoom cornerRoundingPolicy:PCCCornerRoundingPolicyAll];
    [PCCTemplateImageGenerator generateTemplateImageWithColor:color fileName:fileName screenZoom:zoom cornerRoundingPolicy:PCCCornerRoundingPolicyBottom];
    [PCCTemplateImageGenerator generateTemplateImageWithColor:color fileName:fileName screenZoom:zoom cornerRoundingPolicy:PCCCornerRoundingPolicyTop];

    
}

+(void)generateTemplateImageWithColor:(UIColor *)color fileName:(NSString *)fileName screenZoom:(int)zoom cornerRoundingPolicy:(PCCCornerRoundingPolicy)roundingPolicy {
    
    float side = 20 * zoom;
    float offset = 0;
    float offsetAmount = 10;
    if(roundingPolicy == PCCCornerRoundingPolicyBottom) {
        
        offset = -offsetAmount;
        
    } else if (roundingPolicy == PCCCornerRoundingPolicyTop) {
        
        offset = offsetAmount;
        
    }
    
    CGSize contextSize = CGSizeMake(side,side);
    UIView *superview = [[UIView alloc] initWithFrame:CGRectMake(0, MIN(offset,0), contextSize.width, contextSize.height + fabsf(offset))];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[PCCTemplateImageGenerator imageWithColor:color]];
    imageView.frame = superview.frame;
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = PCC_CORNER_RADIUS;
    [superview addSubview:imageView];
    
    UIGraphicsBeginImageContext(contextSize);
    [[superview layer] renderInContext:UIGraphicsGetCurrentContext()];
    [UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext()) writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@%@Round%@.png", fileName, [PCCHelperFunctions stringForRoundingPolicy:roundingPolicy], zoom == 2 ? @"@2x" : @"@3x"]] atomically:YES];
    UIGraphicsEndImageContext();
    
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
