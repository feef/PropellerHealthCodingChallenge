//
//  PCCInsight.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/16/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCCGraphData.h"

@interface PCCInsight : NSObject

-(instancetype)initWithHeadline:(NSString*)headline message:(NSString*)message imageName:(NSString*)imageName graphData:(PCCGraphData*)graphData;

+(PCCInsight*)randomInsight;

@property(nonatomic)NSString *message;
@property(nonatomic)NSString *headline;
@property(nonatomic)NSString *imageName;
@property(nonatomic)PCCGraphData *graphData;

@end
