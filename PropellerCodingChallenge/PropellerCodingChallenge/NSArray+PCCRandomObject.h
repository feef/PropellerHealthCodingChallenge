//
//  NSArray+PCCRandomObject.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/17/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (PCCRandomObject)

-(id)randomObject;
+(instancetype)arrayWithRandomFillOfNumbersWithMax:(int)max;

@end
