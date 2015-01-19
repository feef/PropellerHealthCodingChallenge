//
//  PCCGraphData.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCGraphData.h"
#import "PCCAdherenceData.h"
#import "NSArray+PCCRandomObject.h"
#import "PCCHelperFunctions.h"

@implementation PCCGraphData

-(instancetype)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate ofGraphsWithFields:(NSArray*)fieldNames {

    self = [super init];
    if(self) {
               
        NSArray *adherenceDatas = [PCCGraphData adherenceDatas];
        NSIndexSet *validGraphDataIndexes = [adherenceDatas indexesOfObjectsPassingTest:^BOOL(PCCAdherenceData *adherenceData, NSUInteger idx, BOOL *stop) {
           
            //We can stop if the data we're looking at is beyond the given end date (assuming the data is ordered by date)
            *stop = [adherenceData.date timeIntervalSinceDate:endDate] > 0;
            
            //Check if adherence data is within the provided date window
            return [adherenceData.date timeIntervalSinceDate:startDate] >= 0 && [adherenceData.date timeIntervalSinceDate:endDate] <= 0;
            
        }];
        
        NSMutableDictionary *dataSets = [[NSMutableDictionary alloc] init];
        NSArray *jsonArr = [PCCGraphData jsonArr];
        int largestDataSetSize = 0;
        __block float lowest = FLT_MAX;
        __block float highest = -FLT_MAX;
        for (NSString *fieldName in fieldNames) {
            NSMutableArray *dataSet = [[NSMutableArray alloc] init];
            [validGraphDataIndexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                
                float val = [[jsonArr[idx] objectForKey:fieldName] floatValue] * 100;
                [dataSet addObject:@(val)];
                if(val < lowest) {
                    lowest = val;
                } else if(val > highest) {
                    highest = val;
                }
                
            }];
            [dataSets setObject:dataSet forKey:fieldName];
            
            int count = (int)dataSet.count;
            if(count > largestDataSetSize) {
                largestDataSetSize = count;
            }
        }
        
        _dataSets = [dataSets copy];
        _yAxisData = [[PCCAxisData alloc] initWithTitle:@"Adherence(%)" range:NSMakeRange(0, 100)];
        _xAxisData = [[PCCAxisData alloc] initWithTitle:@"Time(days)" range:NSMakeRange(0, largestDataSetSize)];
        
    }
    return self;
    
}


+(NSArray*)adherenceDatas {
    
    static dispatch_once_t once;
    static NSArray *adherenceDatas;
    dispatch_once(&once, ^{
        
        NSMutableArray *datas = [[NSMutableArray alloc] init];
        NSArray *jsonArr = [PCCGraphData jsonArr];
        for (NSDictionary *jsonDict in jsonArr) {
            
            NSError *err;
            PCCAdherenceData *data = [[PCCAdherenceData alloc] initWithDictionary:jsonDict error:&err];
            if(data && !err) {
                
                [datas addObject:data];
                
            }
            
        }
        adherenceDatas = [datas copy];
        
    });
    
    return adherenceDatas;
    
}

+(NSArray*)jsonArr {
    
    static dispatch_once_t once;
    static NSArray *jsonArr;
    dispatch_once(&once, ^{
        
        NSString* path = [[NSBundle mainBundle] pathForResource:@"AdherenceData" ofType:@"json"];
        NSString* content = [NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
        jsonArr = [NSJSONSerialization JSONObjectWithData: [content dataUsingEncoding:NSUTF8StringEncoding]
                                                           options: NSJSONReadingMutableContainers
                                                             error:NULL];
        
    });
    
    return jsonArr;
    
}

@end
