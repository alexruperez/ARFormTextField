
# ARFormTextField


## Overview

UITextField subclass with doneBlock and nextTextField helpers for easier forms creation.

<img src="https://raw.github.com/alexruperez/ARFormTextField/master/ARFormTextField-1.png" alt="ARFormTextField" title="ARFormTextField" style="display:block; margin: 10px auto 30px auto; align:center">

<img src="https://raw.github.com/alexruperez/ARFormTextField/master/ARFormTextField-2.png" alt="ARFormTextField" title="ARFormTextField" style="display:block; margin: 10px auto 30px auto; align:center">

# Usage

## Installation

### Add the following files to your project:
* `ARFormTextField.m`
* `ARFormTextField.h`

## Quickstart Guide

Create an `ARFormTextField` instance exactly as as you would `UITextField`. You can do with either programmitcally or in Interface Builder. Programmatically, this looks like:

    ARFormTextField* formTextField = [[ARFormTextField alloc] initWithFrame:CGRectMake(0,0,100,30)];

You could set the next textfield or responder when the user click on "Next" return key:

	formTextField.nextTextField = anotherFormTextField; // Or in Interface Builder, it's an IBOutlet

Or if it's the last form textfield, you can set the return key click action in a block:

	[formTextField setDoneBlock:^(ARFormTextField *formTextField) {
		NSLog(@"Done!");
	}];

# Etc.

* Contributions are very welcome.
* Attribution is appreciated (let's spread the word!), but not mandatory.

## Use it? Love/hate it?

Tweet the author @alexruperez, and check out alexruperez's blog: http://alexruperez.com