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

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *mrLocationManager;

-(LocationManager*)init;

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations;

-(void)updatePersonalCoordinates:(CLLocationCoordinate2D)newCoordinate;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

@end
