//
//  CPTScatterPlot+PCCScatterPlot.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "CPTScatterPlot+PCCScatterPlot.h"

@interface CPTScatterPlotStyle : NSObject

-(instancetype)initWithColor:(CPTColor*)color title:(NSString*)title;

@property(nonatomic)CPTColor *color;
@property(nonatomic)NSString *title;

@end

@implementation CPTScatterPlotStyle

-(instancetype)initWithColor:(CPTColor*)color title:(NSString*)title {
    
    self = [super init];
    if(self) {
        
        _color = color;
        _title = title;
        
    }
    return self;
    
}

@end

@implementation CPTScatterPlot (PCCScatterPlot)

+(CPTScatterPlot*)plotWithFrame:(CGRect)frame fieldTitle:(NSString*)field {

    CPTScatterPlot *plot = [[CPTScatterPlot alloc] initWithFrame:frame];
    
    CPTScatterPlotStyle *style = [[CPTScatterPlot styleDictionary] objectForKey:field];
    CPTMutableLineStyle *lineStyle = [plot.dataLineStyle mutableCopy];
    lineStyle.lineWidth = 2.0;
    lineStyle.lineColor = [style color];
    plot.dataLineStyle = lineStyle;
    
    plot.title = [style title];
    [plot setShowLabels:YES];
    
    plot.identifier = field;
    return plot;

}

+(NSDictionary*)styleDictionary {
    
    static dispatch_once_t once;
    static NSDictionary *styleDictionary;
    dispatch_once(&once, ^{
    
        styleDictionary = @{@"user":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor greenColor] title:@"You"],
                            @"allUsers":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor lightGrayColor] title:@"All Users"],
                            @"allMen":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor brownColor] title:@"All Men"],
                            @"allWomen":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor yellowColor] title:@"All Women"],
                            @"age18":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor blueColor] title:@"18 Year Olds"],
                            @"age1925":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor redColor] title:@"19-25 Year Olds"],
                            @"age2645":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor magentaColor] title:@"26-45 Year Olds"],
                            @"age4665":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor purpleColor] title:@"46-65 Year Olds"],
                            @"age65":[[CPTScatterPlotStyle alloc] initWithColor:[CPTColor blackColor] title:@"65 Year Olds"]};
                            
        
    });
    return styleDictionary;
    
}

@end
