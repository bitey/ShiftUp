//
//  EventDetailsViewController.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/30/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "EventDetailsViewController.h"

@interface EventDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleOutlet;
@property (weak, nonatomic) IBOutlet UILabel *latitudeOutlet;
@property (weak, nonatomic) IBOutlet UILabel *longitudeOutlet;

@end

@implementation EventDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"segue string is %@", self.segueString);
    self.titleOutlet.text = self.title;
   
    NSNumber *lat = [NSNumber numberWithFloat:self.latitude];
    self.latitudeOutlet.text = [lat stringValue];
    
    NSNumber *longitude = [NSNumber numberWithFloat:self.longitude];
    self.longitudeOutlet.text = [longitude stringValue];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
