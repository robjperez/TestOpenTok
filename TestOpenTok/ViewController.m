//
//  ViewController.m
//  TestOpenTok
//
//  Created by Roberto Pérez Cubero on 1/28/13.
//  Copyright (c) 2013 Roberto. All rights reserved.
//

#import "ViewController.h"

#define API_KEY @""
#define TOKEN @""
#define SESSION_ID @""

@interface ViewController ()

@end

@implementation ViewController {
    OTSession *_session;
    OTPublisher *_publisher;
    OTSubscriber *_subscriber;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _session = [[OTSession alloc] initWithSessionId:SESSION_ID delegate:self];
    [_session connectWithApiKey:API_KEY token:TOKEN];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sessionDidConnect:(OTSession *)session
{
    _publisher = [[OTPublisher alloc] initWithDelegate:self];
    [_session publish:_publisher];
}

- (void)session:(OTSession *)session didReceiveStream:(OTStream *)stream
{
    if (![stream.connection.connectionId isEqualToString:_session.connection.connectionId]) {
        _subscriber = [[OTSubscriber alloc] initWithStream:stream delegate:self];
    }
}

- (void)subscriberDidConnectToStream:(OTSubscriber *)subscriber
{
    subscriber.view.frame = CGRectMake(0, 0, 320, 480);
    [self.view addSubview:subscriber.view];
}

@end
