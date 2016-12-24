//
//  SplashViewController.m
//  amaysim
//
//  Created by Arnel Perez on 24/12/2016.
//
//

#import "SplashViewController.h"
#import "MainViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController
@synthesize jsonData,lblFullname;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSMutableDictionary *dictData = [jsonData objectForKey:@"data"];
    NSMutableDictionary *attributes = [dictData objectForKey:@"attributes"];
    NSString *title = [attributes objectForKey:@"title"];
    NSString *fname = [attributes objectForKey:@"first-name"];
    NSString *lname = [attributes objectForKey:@"last-name"];
    lblFullname.text = [NSString stringWithFormat:@"%@ %@ %@",title,fname,lname];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    double delayInSeconds = 2.0; //seconds to wait
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        MainViewController *mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:[NSBundle mainBundle]];
        mainVC.jsonData = jsonData;
        [self.navigationController setNavigationBarHidden:YES];
        [self.navigationController pushViewController:mainVC animated:YES];
        
    });
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

@end
