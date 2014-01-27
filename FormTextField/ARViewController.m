//
//  ARViewController.m
//  FormTextField
//
//  Created by Alejandro Rupérez on 27/01/14.
//  Copyright (c) 2014 Alejandro Rupérez. All rights reserved.
//

#import "ARViewController.h"
#import "ARFormTextField.h"

@interface ARViewController ()

@property (weak, nonatomic) IBOutlet ARFormTextField *doneFormTextField;

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.doneFormTextField setDoneBlock:^(ARFormTextField *formTextField) {
        [[[UIAlertView alloc] initWithTitle:@"Done!" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
}

@end
