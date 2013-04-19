//
//  LocationManager.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/15/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

-(id)init
{
    if(self = [super init])
    {
        self.mrLocationManager = [[CLLocationManager alloc]init];
        self.mrLocationManager.delegate = self;
        self.mrLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.mrLocationManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    [self updatePersonalCoordinates: (CLLocation*)[locations lastObject]];
}

-(void)updatePersonalCoordinates:(CLLocation*)newLocation
{
    self.mostRecentCoordinate = newLocation.coordinate;
    if ([newLocation.timestamp timeIntervalSinceDate:[NSDate date]]< 15)
    {
        [self.mrLocationManager stopUpdatingLocation];
        [self.mrLocationManager startMonitoringSignificantLocationChanges];
        [self.delegate createMapRegionAndSpanWithCoordinate:self.mostRecentCoordinate];
        NSLog(@"updating coordinate with latitude: %f and longitude: %f", self.mostRecentCoordinate.latitude, self.mostRecentCoordinate.longitude);

    }
    }

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    
}

@end
