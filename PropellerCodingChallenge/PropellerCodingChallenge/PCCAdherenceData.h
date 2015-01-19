//
//  PCCAdherenceData.h
//  PropellerCodingChallenge
//
//  Created by sharif ahmed on 1/18/15.
//  Copyright (c) 2015 Feef. All rights reserved.
//

#import "JSONModel.h"

@interface PCCAdherenceData : JSONModel

@property(nonatomic)NSDate *date;
@property(nonatomic)float user;
@property(nonatomic)float allUsers;
@property(nonatomic)float allMen;
@property(nonatomic)float allWomen;
@property(nonatomic)float age18;
@property(nonatomic)float age1925;
@property(nonatomic)float age2645;
@property(nonatomic)float age4665;
@property(nonatomic)float age65;

@end
