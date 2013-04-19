//
//  APIManager.m
//  ShiftUp
//
//  Created by AceOfAllTheBass on 4/18/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "APIManager.h"
#import <CoreLocation/CoreLocation.h>
@implementation APIManager

-(APIManager*)initWithNewCoordinates:(CLLocationCoordinate2D)newCoordinates
{
    float newLatitude = newCoordinates.latitude;
    float newLongitude = newCoordinates.longitude;
    
    return self;
}

@end
