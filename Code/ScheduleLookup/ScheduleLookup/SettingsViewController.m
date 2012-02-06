//
//  SettingsViewController.m
//  ScheduleLookup
//
//  Created by Mark Vitale on 2/1/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController
@synthesize  usernameTextField, passwordTextField;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



+ (NSString *)giveUsername
{
    return [keychain objectForKey:(__bridge_transfer id)kSecAttrAccount];
}
+ (NSString *)givePass 
{
    return [keychain objectForKey:(__bridge_transfer id)kSecValueData];
}

-(void)findAndResignFirstResponder{
	for (UIView *aView in [self.view subviews]){
		if ([aView isFirstResponder] ) {
			[aView resignFirstResponder];
		}
	}
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch *touch in touches){
		if (touch.view == self.view){
			[self findAndResignFirstResponder];
		}
	}
}

- (IBAction)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewWillAppear:(BOOL)animated
{
        [usernameTextField setText:[keychain objectForKey:(__bridge id)kSecAttrAccount]];
        
        [passwordTextField setText:[keychain objectForKey:(__bridge id)kSecValueData]];
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    // Store username to keychain 	
    if ([usernameTextField text])
        [keychain setObject:[usernameTextField text] forKey:(__bridge id)kSecAttrAccount];
    
    // Store password to keychain
    if ([passwordTextField text])
        [keychain setObject:[passwordTextField text] forKey:(__bridge id)kSecValueData];  
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"testID" accessGroup:nil];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
