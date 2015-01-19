//
//  PCCInsightDetailsView.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCInsightDetailsView.h"
#import "PCCGlobals.h"
#import "PCCHelperFunctions.h"
#import "CPTScatterPlot+PCCScatterPlot.h"

#define CHART_VIEW_HEIGHT 160
#define INTER_ITEM_SPACES 8

@interface PCCInsightDetailsView () <CPTAxisDelegate, CPTScatterPlotDataSource, CPTScatterPlotDelegate>

@end

@implementation PCCInsightDetailsView

+(instancetype)newFromNib {
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    
}

-(void)awakeFromNib {
    
    //Setup subviews as desired in here
    self.chartViewHeightConstraint.constant = CHART_VIEW_HEIGHT;
    self.chartViewBottomConstraint.constant = INTER_ITEM_SPACES;
    self.insightDetailsLabelBottomConstraint.constant = INTER_ITEM_SPACES;
    self.insightDetailsLabelTopConstraint.constant = INTER_ITEM_SPACES;
    self.insightDetailsLabel.font = PCC_FONT_MEDIUM;
    [self.backgroundImageView setCornerRoundingPolicy:PCCCornerRoundingPolicyBottom];
    [self.backgroundImageView setImageType:PCCTemplateImageNameBackground];
    [self.graphHostingView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressedGraph)]];
    
}

-(void)setInsight:(PCCInsight *)insight {
    
    if(![_insight isEqual:insight]) {
     
        _insight = insight;
        
        //Populate subviews here
        [self.insightDetailsLabel setText:insight.message];
        [self updateGraphView];
        
    }
    
}

-(void)updateGraphView {
    
    [self.graphHostingView setHostedGraph:nil];
    CPTXYGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.graphHostingView.bounds insight:self.insight];
    [self.graphHostingView setHostedGraph:graph];
    
    for (NSString *key in self.insight.graphData.dataSets.allKeys) {
     
        CPTScatterPlot *scatterPlot = [CPTScatterPlot plotWithFrame:self.graphHostingView.bounds fieldTitle:key];
        scatterPlot.delegate = self;
        scatterPlot.dataSource = self;
        [graph addPlot:scatterPlot toPlotSpace:graph.defaultPlotSpace];
        
    }
    
    [graph updateLegend];
    
}

+(CGFloat)detailsViewHeightForInsight:(PCCInsight*)insight constrainedToWidth:(CGFloat)width {
    
    return CHART_VIEW_HEIGHT + INTER_ITEM_SPACES * 4 + [insight.message boundingRectWithSize:CGSizeMake(width - INTER_ITEM_SPACES * 2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : PCC_FONT_MEDIUM} context:NULL].size.height;
    
}


-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    
    return self.insight.graphData.xAxisData.range.length;
    
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx {
    
    // This method is actually called twice per point in the plot, one for the X and one for the Y value
    if(fieldEnum == CPTScatterPlotFieldX)
    {
        return [NSNumber numberWithUnsignedInteger:idx];
        
    } else {
        
        return [NSNumber numberWithFloat:[[[self.insight.graphData.dataSets objectForKey:plot.identifier] objectAtIndex:idx] floatValue]];
    }
    
}

-(void)pressedGraph {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(pressedGraphWithImage:)]) {
        
        UIGraphicsBeginImageContext(self.graphHostingView.bounds.size);
        [[self.graphHostingView layer] renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [self.delegate pressedGraphWithImage:image];
        
    }
    
}

@end
