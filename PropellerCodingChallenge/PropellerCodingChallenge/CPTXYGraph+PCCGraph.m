//
//  CPTXYGraph+PCCGraph.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "CPTXYGraph+PCCGraph.h"
#import "PCCGraphData.h"
#import <UIKit/UIKit.h>

@implementation CPTXYGraph (PCCGraph)

-(instancetype)initWithFrame:(CGRect)frame insight:(PCCInsight*)insight {

    self = [super initWithFrame:frame];
    if(self) {
     
        float inset = 50;
        UIEdgeInsets graphPadding = UIEdgeInsetsMake(inset / 4, inset, inset / 1.2, inset/4);
        
        self.paddingLeft = graphPadding.left;
        self.paddingTop = graphPadding.top;
        self.paddingRight = graphPadding.right;
        self.paddingBottom = graphPadding.bottom;
        
        PCCAxisData *xAxisData = insight.graphData.xAxisData;
        PCCAxisData *yAxisData = insight.graphData.yAxisData;
        
        CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace*)self.defaultPlotSpace;
        plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromUnsignedInteger(xAxisData.range.location) length:CPTDecimalFromUnsignedInteger(xAxisData.range.length - 1)];
        plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromUnsignedInteger(yAxisData.range.location) length:CPTDecimalFromUnsignedInteger(yAxisData.range.length - 1)];
        
        CPTMutableLineStyle *majorGridLineStyle = [CPTMutableLineStyle lineStyle];
        majorGridLineStyle.lineWidth = 0.75;
        majorGridLineStyle.lineColor = [[CPTColor colorWithGenericGray:CPTFloat(0.2)] colorWithAlphaComponent:CPTFloat(0.75)];
        
        CPTMutableLineStyle *minorGridLineStyle = [CPTMutableLineStyle lineStyle];
        minorGridLineStyle.lineWidth = 0.25;
        minorGridLineStyle.lineColor = [[CPTColor whiteColor] colorWithAlphaComponent:CPTFloat(0.4)];
        
        // Axes
        // Label x axis with a fixed interval policy
        CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.axisSet;
        CPTXYAxis *x = axisSet.xAxis;
        x.labelingPolicy = CPTAxisLabelingPolicyAutomatic;
        x.orthogonalCoordinateDecimal = CPTDecimalFromDouble(0.0);
        x.minorTicksPerInterval       = 4;
        x.preferredNumberOfMajorTicks = 5;
        x.majorGridLineStyle          = majorGridLineStyle;
        x.minorGridLineStyle          = minorGridLineStyle;
        x.labelOffset                 = 0.0;
        
        x.title         = xAxisData.title;
        x.titleOffset = 20.0;
        x.titleLocation = CPTDecimalFromDouble((double)(xAxisData.range.length - 1) / 2.0);
        x.delegate = self;
        
        // Label y axis with a fixed interval policy
        CPTXYAxis *y = axisSet.yAxis;
        y.orthogonalCoordinateDecimal = CPTDecimalFromDouble(0.0);
        y.minorTicksPerInterval       = 4;
        y.majorIntervalLength         = CPTDecimalFromInt(25);
        y.majorGridLineStyle          = majorGridLineStyle;
        y.minorGridLineStyle          = minorGridLineStyle;
        y.labelOffset                 = 0.0;
        
        y.title         = yAxisData.title;
        y.titleOffset   = 30.0;
        y.titleLocation = CPTDecimalFromDouble((double)yAxisData.range.length / 2.0);
        y.delegate = self;
        
        self.plotAreaFrame.masksToBorder = NO;
        
        // Set axes
        self.axisSet.axes = @[x, y];
        
    }
    
    return self;
    
}

-(void)updateLegend {
    
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.axisSet;
    CPTXYAxis *x = axisSet.xAxis;
    
    // Add legend
    self.legend                 = [CPTLegend legendWithGraph:self];
    self.legend.numberOfRows    = 1;
    self.legend.textStyle       = x.titleTextStyle;
    self.legend.fill            = [CPTFill fillWithColor:[CPTColor darkGrayColor]];
    self.legend.borderLineStyle = x.axisLineStyle;
    self.legend.cornerRadius    = 5.0;
    self.legendAnchor           = CPTRectAnchorBottom;
    self.legendDisplacement     = CGPointMake( 0.0, 20 * CPTFloat(2.0) );
    
}


-(BOOL)axis:(CPTAxis *)axis shouldUpdateAxisLabelsAtLocations:(NSSet *)locations
{
    static CPTTextStyle *positiveStyle  = nil;
    static CPTTextStyle *negativeStyle  = nil;
    static dispatch_once_t positiveOnce = 0;
    static dispatch_once_t negativeOnce = 0;
    
    NSFormatter *formatter = axis.labelFormatter;
    CGFloat labelOffset    = axis.labelOffset;
    NSDecimalNumber *zero  = [NSDecimalNumber zero];
    
    NSMutableSet *newLabels = [NSMutableSet set];
    
    for ( NSDecimalNumber *tickLocation in locations ) {
        CPTTextStyle *theLabelTextStyle;
        
        if ( [tickLocation isGreaterThanOrEqualTo:zero] ) {
            dispatch_once(&positiveOnce, ^{
                CPTMutableTextStyle *newStyle = [axis.labelTextStyle mutableCopy];
                newStyle.color = [CPTColor blackColor];
                positiveStyle = newStyle;
            });
            
            theLabelTextStyle = positiveStyle;
        }
        else {
            dispatch_once(&negativeOnce, ^{
                CPTMutableTextStyle *newStyle = [axis.labelTextStyle mutableCopy];
                newStyle.color = [CPTColor blackColor];
                negativeStyle = newStyle;
            });
            
            theLabelTextStyle = negativeStyle;
        }
        
        NSString *labelString       = [formatter stringForObjectValue:tickLocation];
        CPTTextLayer *newLabelLayer = [[CPTTextLayer alloc] initWithText:labelString style:theLabelTextStyle];
        
        CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithContentLayer:newLabelLayer];
        newLabel.tickLocation = tickLocation.decimalValue;
        newLabel.offset       = labelOffset;
        
        [newLabels addObject:newLabel];
    }
    
    axis.axisLabels = newLabels;
    
    return NO;
}


@end
