//
//  PCCGlobals.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#ifndef PropellerCodingChallenge_PCCGlobals_h
#define PropellerCodingChallenge_PCCGlobals_h

#define PCC_CORNER_RADIUS 8

#define PCC_BACKGROUND_COLOR [UIColor colorWithRed:93.0/255.0 green:195.0/255.0 blue:204.0/255.0 alpha:1.0]
#define PCC_BAR_COLOR [UIColor colorWithRed:20.0/255.0 green:157.0/255.0 blue:185.0/255.0 alpha:1.0]
#define PCC_FOREGROUND_COLOR [UIColor whiteColor]

#define PCC_FONT_MEDIUM [UIFont fontWithName:@"Arvo" size:16.0]
#define PCC_FONT_HEAVY [UIFont fontWithName:@"Arvo-Bold" size:20.0]

#define PCC_BACKGROUND_STRING @"background"
#define PCC_FOREGROUND_STRING @"foreground"
#define PCC_BAR_STRING @"bar"

typedef enum {
    
    PCCCornerRoundingPolicyAll,
    PCCCornerRoundingPolicyTop,
    PCCCornerRoundingPolicyBottom
    
} PCCCornerRoundingPolicy;

typedef enum {
    
    PCCTemplateImageNameBackground,
    PCCTemplateImageNameForeground,
    PCCTemplateImageNameBar
    
} PCCTemplateImageName;

#endif
