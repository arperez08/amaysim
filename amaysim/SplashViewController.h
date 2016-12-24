//
//  SplashViewController.h
//  amaysim
//
//  Created by Arnel Perez on 24/12/2016.
//
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController
{
    NSMutableDictionary *jsonData;
    IBOutlet UILabel *lblFullname;

}
@property (strong, nonatomic) NSMutableDictionary *jsonData;
@property (strong, nonatomic) IBOutlet UILabel *lblFullname;

@end
