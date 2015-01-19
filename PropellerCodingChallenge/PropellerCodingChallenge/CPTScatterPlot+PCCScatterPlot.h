//
//  CPTScatterPlot+PCCScatterPlot.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <CorePlot/CorePlot-CocoaTouch.h>
#import "PCCGraphData.h"

@interface CPTScatterPlot (PCCScatterPlot)

+(CPTScatterPlot*)plotWithFrame:(CGRect)frame fieldTitle:(NSString*)field;

@end
