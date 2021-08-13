//
//  ViewController.m
//  DuplicateConfigurationTest
//
//  Created by Jayehuang on 2021/8/12.
//

#import "ViewController.h"

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
    
}
-(NSString*) getLocalAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
- (IBAction)getData:(UIButton *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%ld",[[userDefaults objectForKey:@"isON"]integerValue]);
    NSLog(@"%@",[userDefaults objectForKey:@"config"]);
    NSLog(@"%@",[userDefaults objectForKey:@"version"]);
    NSLog(@"%@",[userDefaults objectForKey:@"nametext"]);
    NSLog(@"%@",[userDefaults objectForKey:@"passwordText"]);
    NSLog(@"%@",[userDefaults objectForKey:@"slider"]);
    
    self.settingsInfoLabel.text = [NSString stringWithFormat:@"isON:%ld\nconfig:%@\nversion:%@\nnametext:%@\npasswordText:%@\nslider:%@",[[userDefaults objectForKey:@"isON"]integerValue],[userDefaults objectForKey:@"config"],[userDefaults objectForKey:@"version"],[userDefaults objectForKey:@"nametext"],[userDefaults objectForKey:@"passwordText"],[userDefaults objectForKey:@"slider"]];
    
    if (![userDefaults objectForKey:@"config"]) {
         [userDefaults setObject:@"开发环境" forKey:@"config"];
    }
    /*运行应用后直接直接通过上面的代码获取信息，你会得到null；原因是：
     root.plist实际上只是一个静态文件用来在设置里显示；只有当你对它进行修改，
     它才会往NSUserDefaults里添加。修改配置后，NSUserDefaults的优先级高于root.plist文件。
     */
    ///也可设值 , 首次打开app没有值可以设一下
    [userDefaults setObject:@"2.0.0" forKey:@"version"];
}

@end
