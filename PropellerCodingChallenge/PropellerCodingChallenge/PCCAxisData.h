//
//  PCCAxisData.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCCAxisData : NSObject

-(instancetype)initWithTitle:(NSString*)title range:(NSRange)range;

@property(nonatomic)NSString *title;
@property(nonatomic)NSRange range;

@end
