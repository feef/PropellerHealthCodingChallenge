//
//  PCCInsight.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCInsight.h"
#import "NSArray+PCCRandomObject.h"
#import "PCCAdherenceData.h"

@implementation PCCInsight

-(instancetype)initWithHeadline:(NSString*)headline message:(NSString*)message imageName:(NSString*)imageName graphData:(PCCGraphData*)graphData {

    self = [super init];
    if(self) {
        
        _headline = headline;
        _message = message;
        _imageName = imageName;
        _graphData = graphData;
        
    }
    return self;
    
}

+(PCCInsight*)randomInsight {
    
    return [[PCCInsight fakeInsights] randomObject];
    
}

+(NSArray*)fakeInsights {
    
    static dispatch_once_t once;
    static NSArray *insights;
    dispatch_once(&once, ^{
        
        NSMutableArray *mInsights = [[NSMutableArray alloc] init];
        NSDate *lastDataDate = [PCCInsight lastDataDate];
        
        [mInsights addObject:[[PCCInsight alloc] initWithHeadline:@"Congrats!" message:@"Your adherence has increased from 40% to 52% over the last year." imageName:@"check" graphData:[[PCCGraphData alloc] initWithStartDate:[lastDataDate dateByAddingTimeInterval:-(365 * 24 * 60 * 60)] endDate:lastDataDate ofGraphsWithFields:@[@"user"]]]];
        [mInsights addObject:[[PCCInsight alloc] initWithHeadline:@"Gold Star!" message:@"Your adherence this week was 53% which is better than last week." imageName:@"star" graphData:[[PCCGraphData alloc] initWithStartDate:[lastDataDate dateByAddingTimeInterval:-(14 * 24 * 60 * 60)] endDate:lastDataDate ofGraphsWithFields:@[@"user"]]]];
        [mInsights addObject:[[PCCInsight alloc] initWithHeadline:@"You're a boss!" message:@"Over the last year your adherence has been much better than other users." imageName:@"chart" graphData:[[PCCGraphData alloc] initWithStartDate:[lastDataDate dateByAddingTimeInterval:-(365 * 24 * 60 * 60)] endDate:lastDataDate ofGraphsWithFields:@[@"user",@"allUsers"]]]];
        [mInsights addObject:[[PCCInsight alloc] initWithHeadline:@"You go girl!" message:@"Over the last week your adherence has been much better than other women." imageName:@"chart" graphData:[[PCCGraphData alloc] initWithStartDate:[lastDataDate dateByAddingTimeInterval:-(7 * 24 * 60 * 60)] endDate:lastDataDate ofGraphsWithFields:@[@"user",@"allWomen"]]]];
        [mInsights addObject:[[PCCInsight alloc] initWithHeadline:@"Good job dude!" message:@"Over the last month your adherence has been much better than other men." imageName:@"chart" graphData:[[PCCGraphData alloc] initWithStartDate:[lastDataDate dateByAddingTimeInterval:-(30 * 24 * 60 * 60)] endDate:lastDataDate ofGraphsWithFields:@[@"user",@"allMen"]]]];


        
        insights = [mInsights copy];
        
    });
    return insights;
    
    
}

+(NSDate*)lastDataDate {
    
    return [[[PCCGraphData adherenceDatas] lastObject] date];
    
}

@end
