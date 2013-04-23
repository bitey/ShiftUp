//
//  GeocodingManager.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/23/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "GeocodingManager.h"

@implementation GeocodingManager

-(id)init
{
    if (self = [super init])
    {
        self.mrGeocoder = [[CLGeocoder alloc]init];
    }
    return self;
}

-(void)convertToPlacemarksFromString:(NSString*)addressString
{
    [self.mrGeocoder geocodeAddressString:addressString
                        completionHandler: ^(NSArray *placemarks, NSError *error)
     {
         for (CLPlacemark *aPlacemark in placemarks)
         {
             [self.delegate hasReceivedSearchCoordinates:aPlacemark];
         }
     }];
    
}

@end
