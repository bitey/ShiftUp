//
//  APIManager.h
//  ShiftUp
//
//  Created by AceOfAllTheBass on 4/18/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol APIManagerDelegate <NSObject>

@optional

-(void)hasReceivedNearbyEvents:(NSMutableArray*)nearbyEvents;

@end

@interface APIManager : NSObject

@property (strong, nonatomic) id <APIManagerDelegate> delegate;

-(APIManager*)initWithNewCoordinates:(CLLocationCoordinate2D)newCoordinates;

-(void)connectToAFGEAndTellDelegates;

@end
