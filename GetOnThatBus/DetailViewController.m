//
//  DetailViewController.m
//  GetOnThatBus
//
//  Created by Shannon Beck on 1/20/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *routesLabel;
@property (strong, nonatomic) IBOutlet UILabel *altTransfersLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.busMan.name;
    self.addressLabel.text = self.busMan.address;
    self.altTransfersLabel.text = self.busMan.altRoute;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
