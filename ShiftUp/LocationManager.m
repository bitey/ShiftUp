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
        [self.mrLocationManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    [self updatePersonalCoordinates: ((CLLocation*)[locations lastObject]).coordinate];
}

-(void)updatePersonalCoordinates:(CLLocationCoordinate2D)newCoordinate
{
    NSLog(@"updating coordinate with latitude: %f and longitude: %f", newCoordinate.latitude, newCoordinate.longitude);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    
}

@end
