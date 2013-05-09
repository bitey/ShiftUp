//
//  Annotation.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/14/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

-(id)initWithLatitude:(float)latitude
         andLongitude:(float)longitude
             andTitle:(NSString*)titleString
          andSubTitle:(NSString*)subtitleString
       andDescription:(NSString*)description

{
    if (self = [super init])
    {
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        self.title = titleString;
        self.subtitle = subtitleString;
        self.description = description;
    }
    return self;
}
@end
