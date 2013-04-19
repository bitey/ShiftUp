//
//  APIManager.h
//  ShiftUp
//
//  Created by AceOfAllTheBass on 4/18/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIManagerDelegate <NSObject>

@optional

-(void)hasReceivedNearbyEvents;

@end

@interface APIManager : NSObject

@end
