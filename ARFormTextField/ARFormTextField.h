//
//  ARFormTextField.h
//  FormTextField
//
//  Created by Alejandro Rupérez on 27/01/14.
//  Copyright (c) 2014 Alejandro Rupérez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ARFormTextField;

typedef void(^ARFormTextFieldDoneBlock)(ARFormTextField* formTextField);

@interface ARFormTextField : UITextField

@property (weak, nonatomic) IBOutlet UITextField *nextTextField;

@property (copy, nonatomic) ARFormTextFieldDoneBlock doneBlock;

- (void)setDoneBlock:(ARFormTextFieldDoneBlock)doneBlock;

- (void)performAction;

@end
