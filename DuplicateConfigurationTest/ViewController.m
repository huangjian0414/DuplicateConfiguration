//
//  ViewController.m
//  DuplicateConfigurationTest
//
//  Created by Jayehuang on 2021/8/12.
//

#import "ViewController.h"
#import "AxLocationTool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *settingsInfoLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",[self getLocalAppVersion]);
    
    NSLog(@"%d", hjconfig);
    NSLog(@"%d",haha);
    NSLog(@"%@",BaseUrl);
    
    switch (hjconfig) {
        case 1:
            NSLog(@"debug");
            break;
        case 2:
            NSLog(@"hjtest");
            break;
        case 3:
            NSLog(@"release");
            break;
        default:
            break;
    }
    
    [[AxLocationTool shareInstance]startLocationWithBlock:^(BOOL isSuccess, AxLocationModel * _Nonnull locationModel) {
        
    }];
    
    
}
-(NSString*) getLocalAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
- (IBAction)getData:(UIButton *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%ld",[[userDefaults objectForKey:@"isON"]integerValue]);
    NSLog(@"%@",[userDefaults objectForKey:@"rank"]);
    NSLog(@"%@",[userDefaults objectForKey:@"version"]);
    NSLog(@"%@",[userDefaults objectForKey:@"nametext"]);
    NSLog(@"%@",[userDefaults objectForKey:@"passwordText"]);
    NSLog(@"%@",[userDefaults objectForKey:@"slider"]);
    
    self.settingsInfoLabel.text = [NSString stringWithFormat:@"isON:%ld\nrank:%@\nversion:%@\nnametext:%@\npasswordText:%@\nslider:%@",[[userDefaults objectForKey:@"isON"]integerValue],[userDefaults objectForKey:@"rank"],[userDefaults objectForKey:@"version"],[userDefaults objectForKey:@"nametext"],[userDefaults objectForKey:@"passwordText"],[userDefaults objectForKey:@"slider"]];
    
    if (![userDefaults objectForKey:@"rank"]) {
         [userDefaults setObject:@"开发Value" forKey:@"rank"];
    }
    ///也可设值
    [userDefaults setObject:@"2.0.0" forKey:@"version"];
}

@end
