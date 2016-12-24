//
//  LoginViewController.h
//  amaysim
//
//  Created by Arnel Perez on 24/12/2016.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    IBOutlet UITextField *txtUserName;
    IBOutlet UITextField *txtPassword;
}
@property (strong, nonatomic) IBOutlet UITextField *txtUserName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)btnLogin:(id)sender;


@end
