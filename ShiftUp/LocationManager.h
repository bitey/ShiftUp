//
//  LocationManager.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/15/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@protocol LocationManagerDelegate <NSObject>

@optional

-(void)hasCurrentCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate;

@end


@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) id <LocationManagerDelegate> delegate;
@property (strong, nonatomic) CLLocationManager *mrLocationManager;
@property (assign, nonatomic) CLLocationCoordinate2D mostRecentCoordinate;

-(LocationManager*)init;

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations;

-(void)updatePersonalCoordinates:(CLLocation*)newLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

@end
