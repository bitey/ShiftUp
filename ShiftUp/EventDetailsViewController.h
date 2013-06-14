//
//  EventDetailsViewController.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/30/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventDetailsViewController : UIViewController

@property (strong, nonatomic) NSString *segueString;
@property (strong, nonatomic) NSString *eventTitle;
@property (assign, nonatomic) float latitude;
@property (assign, nonatomic) float longitude;

@end
