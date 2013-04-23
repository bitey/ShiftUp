//
//  GeocodingManager.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/23/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol GeocodingManagerDelegate <NSObject>

@optional

-(void)hasReceivedSearchCoordinates:(CLPlacemark*)placemark;

@end


@interface GeocodingManager : NSObject

@property (strong, nonatomic) CLGeocoder *mrGeocoder;

@property (strong, nonatomic) id <GeocodingManagerDelegate> delegate;

-(void)convertToPlacemarksFromString:(NSString*)addressString;

@end
