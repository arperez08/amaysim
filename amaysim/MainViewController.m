//
//  MainViewController.m
//  amaysim
//
//  Created by Arnel Perez on 24/12/2016.
//
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "LDProgressView.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize jsonData,lblFullname,lblNumber,lblProductName,lblExpiry,lblPrice,lblUsage,progressBar,viewProgressHolder;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSMutableDictionary *dictData = [jsonData objectForKey:@"data"];
    NSMutableDictionary *attributes = [dictData objectForKey:@"attributes"];
    NSString *title = [attributes objectForKey:@"title"];
    NSString *fname = [attributes objectForKey:@"first-name"];
    NSString *lname = [attributes objectForKey:@"last-name"];
    lblFullname.text = [NSString stringWithFormat:@"%@ %@ %@",title,fname,lname];
    
    NSMutableArray *included = [jsonData objectForKey:@"included"];
    
    for (int i=0; i < [included count]; i++) {
        NSMutableDictionary *includedDict = [included objectAtIndex:i];
        NSString *type = [includedDict objectForKey:@"type"];
        NSMutableDictionary *attributes = [includedDict objectForKey:@"attributes"];
        
        if ([type isEqualToString:@"services"]) {
            NSString *msn = [attributes objectForKey:@"msn"];
            lblNumber.text = msn;
        }
        
        if ([type isEqualToString:@"subscriptions"]) {
            NSString *productBalance = [attributes objectForKey:@"included-data-balance"];
            NSString *autoRenew = [attributes objectForKey:@"auto-renewal"];
            //NSString *primarySubscription = [attributes objectForKey:@"primary-subscription"];
            NSString *expiry = [attributes objectForKey:@"expiry-date"];
            
            if ([autoRenew  isEqual: @"true"]) {
                lblExpiry.text = [NSString stringWithFormat:@"Plan Renew on: %@",expiry];
            }
            else{
                lblExpiry.text = [NSString stringWithFormat:@"Expiry date: %@",expiry];
            }
            lblUsage.text = [NSString stringWithFormat:@"Current Usage: %@",productBalance];
            
            float progressMeasure = ([productBalance floatValue] / 70000.00);
            progressBar.progress = progressMeasure;
            
            CGRect screenBounds = [[UIScreen mainScreen] bounds];
            LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.size.width -screenBounds.size.width/15, 30)];
            
            progressView.color = [self colorFromHexString:@"#FF8F05"];
            progressView.showText = @NO;
            progressView.progress = progressMeasure;
            progressView.borderRadius = @20;
            progressView.animate = @NO;
            progressView.showBackgroundInnerShadow = @NO;
            progressView.showStroke = @NO;
            //progressView.showBackground = @NO;
            progressView.background = [UIColor lightGrayColor];
            progressView.type = LDProgressSolid;
            [viewProgressHolder addSubview:progressView];
            
        }
        if ([type isEqualToString:@"products"]) {
            NSString *productName = [attributes objectForKey:@"name"];
            NSString *productPrice = [attributes objectForKey:@"price"];
            lblProductName.text = productName;
            lblPrice.text = [NSString stringWithFormat:@"This month's charges: %@", productPrice];
        }
    }
}


- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnLogout:(id)sender {
    LoginViewController *logoutVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController pushViewController:logoutVC animated:YES];
}
@end
