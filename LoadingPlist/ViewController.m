//
//  ViewController.m
//  LoadingPlist
//
//  Created by Xiao Lu on 5/2/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSDictionary *courseDetails;
    NSArray *justCourseNames;
    
    NSDictionary *webCourseDetails;
    NSArray *webCourseNames;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"iOS Courses";
    }
    else {
        return @"Web Courses";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return courseDetails.count;
    }
    else {
        return webCourseDetails.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    UIImage *myImage = [UIImage imageNamed:@"DemoCellImage"];
    [cell.imageView setImage:myImage];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = justCourseNames[indexPath.row];
        cell.detailTextLabel.text = courseDetails[justCourseNames[indexPath.row]];
    }
    else {
        cell.textLabel.text = webCourseNames[indexPath.row];
        cell.detailTextLabel.text = webCourseDetails[webCourseNames[indexPath.row]];
    }
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"courses"
                                         withExtension:@"plist"];
    courseDetails = [NSDictionary dictionaryWithContentsOfURL:url];
    justCourseNames = courseDetails.allKeys;
    
    
    NSURL *urlWeb = [[NSBundle mainBundle] URLForResource:@"courses_web"
                                         withExtension:@"plist"];
    webCourseDetails = [NSDictionary dictionaryWithContentsOfURL:urlWeb];
    webCourseNames = webCourseDetails.allKeys;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
