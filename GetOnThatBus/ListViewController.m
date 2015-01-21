//
//  ListViewController.m
//  GetOnThatBus
//
//  Created by Shannon Beck on 1/20/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    BusStops *bus = [self.busses objectAtIndex:indexPath.row];

    cell.textLabel.text = bus.name;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.busses.count;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *dvc = segue.destinationViewController;

    NSIndexPath *path = [self.tableView indexPathForCell:sender];
    BusStops *thisBus = [self.busses objectAtIndex:path.row];
    dvc.busMan = thisBus;
}

@end
