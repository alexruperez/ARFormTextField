//
//  ARFormTextField.m
//  FormTextField
//
//  Created by Alejandro Rupérez on 27/01/14.
//  Copyright (c) 2014 Alejandro Rupérez. All rights reserved.
//

#import "ARFormTextField.h"

@interface ARFormTextField () <UITextFieldDelegate>

@property (weak, nonatomic) id<UITextFieldDelegate> formDelegate;

@end

@implementation ARFormTextField

@synthesize doneBlock = _doneBlock;

- (id)init
{
    self = [super init];
    if (self)
    {
        super.delegate = self;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self)
    {
        super.delegate = self;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        super.delegate = self;
    }
    return self;
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    self.formDelegate = delegate;
}

- (void)setDoneBlock:(ARFormTextFieldDoneBlock)doneBlock
{
    _doneBlock = [doneBlock copy];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([self.formDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)])
    {
        return [self.formDelegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([self.formDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)])
    {
        [self.formDelegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if ([self.formDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)])
    {
        return [self.formDelegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.formDelegate respondsToSelector:@selector(textFieldDidEndEditing:)])
    {
        [self.formDelegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([self.formDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)])
    {
        return [self.formDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if ([self.formDelegate respondsToSelector:@selector(textFieldShouldClear:)])
    {
        return [self.formDelegate textFieldShouldClear:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self performAction];
    if ([self.formDelegate respondsToSelector:@selector(textFieldShouldReturn:)])
    {
        return [self.formDelegate textFieldShouldReturn:textField];
    }
    return NO;
}

- (void)performAction
{
    if ((self.returnKeyType == UIReturnKeyNext) && self.nextTextField)
    {
        [self resignFirstResponder];
        [self.nextTextField becomeFirstResponder];
    }
    else if (self.doneBlock)
    {
        [self resignFirstResponder];
        self.doneBlock(self);
    }
}

@end
