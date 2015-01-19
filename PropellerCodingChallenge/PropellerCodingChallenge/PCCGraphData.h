//
//  PCCGraphData.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCCAxisData.h"

@interface PCCGraphData : NSObject

-(instancetype)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate ofGraphsWithFields:(NSArray*)fieldNames;

+(NSArray*)adherenceDatas;

@property(nonatomic)NSDictionary *dataSets;
@property(nonatomic)PCCAxisData *xAxisData;
@property(nonatomic)PCCAxisData *yAxisData;

@end
