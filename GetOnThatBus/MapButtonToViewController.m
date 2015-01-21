//
//  MapButtonToViewController.m
//  GetOnThatBus
//
//  Created by Shannon Beck on 1/20/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import "MapButtonToViewController.h"
#import "BusStops.h"

@interface MapButtonToViewController ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *altRoutesLabel;
@property (strong, nonatomic) IBOutlet UILabel *routesLabel;
//@property BusStops *BusIt;

@end

@implementation MapButtonToViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = self.bussing.name;
    self.addressLabel.text = self.bussing.address;
    self.altRoutesLabel.text = self.bussing.altRoute;
    self.routesLabel.text = self.bussing.route;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
