//
//  LoginViewController.m
//  amaysim
//
//  Created by Arnel Perez on 24/12/2016.
//
//

#import "LoginViewController.h"
#import "SplashViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize txtPassword,txtUserName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    UIColor *color = [UIColor lightGrayColor];
    txtUserName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Mobile Number" attributes:@{NSForegroundColorAttributeName: color}];
    txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
}

-(void)dismissKeyboard {
    [txtUserName resignFirstResponder];
    [txtPassword resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    // read collection.json file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"collection" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    // put as dictionary
    NSMutableDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *included = [jsonData objectForKey:@"included"];

    for (int i=0; i < [included count]; i++) {
        NSMutableDictionary *includedDict = [included objectAtIndex:i];
        NSString *type = [includedDict objectForKey:@"type"];
        
        if ([type isEqualToString:@"services"]) {
            NSMutableDictionary *attributes = [includedDict objectForKey:@"attributes"];
            NSString *msn = [attributes objectForKey:@"msn"];
            
            if ([txtUserName.text isEqualToString:msn]) {
                SplashViewController *splashVC = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:[NSBundle mainBundle]];
                splashVC.jsonData = jsonData;
                [self.navigationController setNavigationBarHidden:YES];
                [self.navigationController pushViewController:splashVC animated:YES];
            }
            else{
                [self alertStatus:@"Mobile Number not found" :@"Invalid"];
            }
            break;
        }
    }
}


- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    [alertView performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
}

@end
