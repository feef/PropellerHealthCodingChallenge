//
//  NSArray+PCCRandomObject.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/17/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "NSArray+PCCRandomObject.h"

@implementation NSArray (PCCRandomObject)

-(id)randomObject {
    
    return self[arc4random() % self.count];
    
}

+(instancetype)arrayWithRandomFillOfNumbersWithMax:(int)max {
    
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    int numNumbers = arc4random() % 20 + 30;
    for(int i = 0; i<numNumbers; i++) {
        
        [numbers addObject:@(arc4random() % (max + 1))];
        
    }
    
    return numbers;
    
}

@end
