//
//  Annotation.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/14/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Event.h"

@interface Annotation : NSObject <MKAnnotation>

@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) Event *event;

-(id)initWithLatitude:(float)latitude
         andLongitude:(float)longitude
             andTitle:(NSString*)titleString
          andSubTitle:(NSString*)subtitleString;
@end
