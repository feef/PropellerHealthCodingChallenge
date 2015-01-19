//
//  CPTXYGraph+PCCGraph.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <CorePlot/CorePlot-CocoaTouch.h>
#import "PCCInsight.h"

@interface CPTXYGraph (PCCGraph)

-(instancetype)initWithFrame:(CGRect)frame insight:(PCCInsight*)insight;
-(void)updateLegend;

@end
