//
//  ViewController.h
//  TestOpenTok
//
//  Created by Roberto Pérez Cubero on 1/28/13.
//  Copyright (c) 2013 Roberto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Opentok/Opentok.h>

@interface ViewController : UIViewController<OTPublisherDelegate, OTSessionDelegate, OTSubscriberDelegate>

@end
