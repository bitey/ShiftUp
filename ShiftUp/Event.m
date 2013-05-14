//
//  Event.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/19/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "Event.h"

@implementation Event

-(id)initWithLatitude:(float)latitude
         andLongitude:(float)longitude
             andTitle:(NSString*)titleString
          andSubTitle:(NSString*)subtitleString
{
    if (self = [super init])
    {
        self.latitude = latitude;
        self.longitude = longitude;
        self.title = titleString;
        self.subtitle = subtitleString;
    }
    return self;
}



@end
