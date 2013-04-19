//
//  APIManager.m
//  ShiftUp
//
//  Created by AceOfAllTheBass on 4/18/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//


//
//TODO
//fix the active toggle - convert from true (sql) to YES (Obj-c)
//
//
//


#import "APIManager.h"
#import "Event.h"
@implementation APIManager

-(APIManager*)initWithNewCoordinates:(CLLocationCoordinate2D)newCoordinates
{
//    float newLatitude = newCoordinates.latitude;
//    float newLongitude = newCoordinates.longitude;
    
    return self;
}

-(void)connectToAFGEAndTellDelegates
{
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:
                                              [NSURL URLWithString:@"http://dev.afge.org/webserv/afgeEventsToJSON.cfc?method=serializeToJSON&returnformat=JSON&apiKey=839dj29w4c"]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler: ^void(NSURLResponse *webResponse, NSData *webData, NSError *theirError)
                                             {
                                                 NSDictionary *jsonDictionary = [[NSDictionary alloc]init];
                                                 NSArray *eventResults = [[NSArray alloc]init];
                                                 NSMutableArray *allNearbyEvents = [[NSMutableArray alloc]init];

                                                 if (theirError)
                                                 {
                                                     NSLog(@"%@", theirError);
                                                 }
                                                 NSError *jsonError;
                                                 id jsonObject = [NSJSONSerialization JSONObjectWithData:webData
                                                                                                 options:NSJSONReadingAllowFragments
                                                                                                   error:&jsonError];
                                                 if (jsonError)
                                                 {
                                                     NSLog(@"%@", jsonError);
                                                 }
                                                 
                                                 jsonDictionary = (NSDictionary*)jsonObject;
                                                 eventResults = [jsonDictionary objectForKey:@"DATA"];
                                                 int eventResultsCount = eventResults.count;
                                                 
                                                 for (int i = 0; i < eventResultsCount; i++)
                                                 {
                                                    Event *currentEvent = [[Event alloc]init];
                                                    currentEvent.title = [[eventResults objectAtIndex:i] objectAtIndex:0];
                                                    currentEvent.subtitle = [[eventResults objectAtIndex:i] objectAtIndex:1];
                                                    currentEvent.description = [[eventResults objectAtIndex:i] objectAtIndex:2];
                                                    currentEvent.urlString = [[eventResults objectAtIndex:i] objectAtIndex:3];
                                                    currentEvent.latitude = [(NSNumber*)[[eventResults objectAtIndex:i] objectAtIndex:4] floatValue];
                                                    currentEvent.longitude = [(NSNumber*)[[eventResults objectAtIndex:i] objectAtIndex:5] floatValue];
                                                    currentEvent.startDate = [[eventResults objectAtIndex:i] objectAtIndex:6];
                                                    currentEvent.endDate = [[eventResults objectAtIndex:i] objectAtIndex:7];
                                                    //currentEvent.active = [eventResults objectAtIndex:i];
                                                    [allNearbyEvents addObject:currentEvent];
                                                    NSLog(@"current events: %@", allNearbyEvents);
                                                 }
                                             }];
}

@end
