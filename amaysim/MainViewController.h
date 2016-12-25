//
//  MainViewController.h
//  amaysim
//
//  Created by Arnel Perez on 24/12/2016.
//
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    NSMutableDictionary *jsonData;
    IBOutlet UILabel *lblFullname;
    IBOutlet UILabel *lblNumber;
    IBOutlet UILabel *lblProductName;
    IBOutlet UILabel *lblExpiry;
    IBOutlet UILabel *lblPrice;
    IBOutlet UILabel *lblUsage;
    IBOutlet UIProgressView *progressBar;
    IBOutlet UIView *viewProgressHolder;



}
@property (strong, nonatomic) NSMutableDictionary *jsonData;
@property (strong, nonatomic) IBOutlet UILabel *lblFullname;
@property (strong, nonatomic) IBOutlet UILabel *lblNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblProductName;
@property (strong, nonatomic) IBOutlet UILabel *lblExpiry;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblUsage;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;

@property (strong, nonatomic) IBOutlet UIView *viewProgressHolder;


- (IBAction)btnLogout:(id)sender;



@end
