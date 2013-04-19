//
//  Event.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/19/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *urlString;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (assign, nonatomic) float latitude;
@property (assign, nonatomic) float longitude;
@property (strong, nonatomic) NSString *startDate;
@property (strong, nonatomic) NSString *endDate;
@property (assign, nonatomic) BOOL *active;

@end
