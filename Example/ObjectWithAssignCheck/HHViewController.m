//
//  HHViewController.m
//  ObjectWithAssignCheck
//
//  Created by 8047768 on 02/16/2022.
//  Copyright (c) 2022 8047768. All rights reserved.
//

#import "HHViewController.h"
#import "ObjectWithAssignCheck.h"

@interface HHViewController ()

@property (nonatomic, assign) NSString *testStr;

@end

@implementation HHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [ObjectWithAssignCheck checkWithClassPrefixes:@[@"HH"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
