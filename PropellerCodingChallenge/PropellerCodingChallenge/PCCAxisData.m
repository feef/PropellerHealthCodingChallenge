//
//  PCCAxisData.m
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "PCCAxisData.h"

@implementation PCCAxisData

-(instancetype)initWithTitle:(NSString*)title range:(NSRange)range {
    
    self = [super init];
    if(self) {
        
        _title = title;
        _range = range;
        
    }
    return self;
    
}

@end
