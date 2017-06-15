//
//  ViewController.m
//  Tpod
//
//  Created by 卢杨 on 17/3月/3.
//  Copyright © 2017年 卢杨. All rights reserved.
//

#import "ViewController.h"
#import <HomeKit/HomeKit.h>
@interface ViewController ()<UISearchBarDelegate,HMHomeManagerDelegate,HMAccessoryBrowserDelegate>
@property (nonatomic,strong) UIView *tagView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) HMHomeManager *homeManager;
@property HMAccessoryBrowser *accessoryBrowser;
@end

@implementation ViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建配件浏览器对象，并设置它的代理
    self.accessoryBrowser = [[HMAccessoryBrowser alloc] init];
    self.accessoryBrowser.delegate = self;
    // 3.开始搜寻配件
    [self.accessoryBrowser startSearchingForNewAccessories];
    //4.将找到的配件添加到你的收藏里
    
    
    self.homeManager = [[HMHomeManager alloc]init];
    self.homeManager.delegate = self;
    //通过 home manager 的 primaryHome 属性，可以得到 primary home
   // HMHome *home = self.homeManager.primaryHome;
    HMHome *home;
    for(home in self.homeManager.homes ){
        NSLog(@"====== %@",home);
    }
    
    HMRoom *room;
    for(room in home.rooms){
        NSLog(@"====== %@",room);
    }
    
    
    for(HMAccessory *accessory in room.accessories){
       
    }
     
    
    [self.homeManager addHomeWithName:@"My Home" completionHandler:^(HMHome * _Nullable home, NSError * _Nullable error) {
        if (error != nil) {
            // Failed to add a home
        } else {
            
            //写入代码以更新你应的程序的视图。为了获取 home manager 对象，请参阅Getting the Home Manager Object。
             self.tagView = [[UIView alloc]initWithFrame:CGRectMake(50, 70, 100, 100)];
             self.tagView.backgroundColor = [UIColor redColor];
             [self.view addSubview:self.tagView];
        }
    }];
    
    //在 Home 中增加一个 Room
    NSString *roomName = @"Living Room";
    [home addRoomWithName:roomName completionHandler:^(HMRoom
                                                       *room, NSError *error) {
        if (error != nil) {
            // Failed to add a room to a home
        } else {
            // Successfully added a room to a home
            
            self.tagView = [[UIView alloc]initWithFrame:CGRectMake(100, 170, 100, 100)];
            self.tagView.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:self.tagView];
        } }];
    
    
    
    
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 180 ,  44 )];
    searchBar.delegate = self;
    
    UITextField *textfield = [searchBar valueForKey:@"_searchField"];
    
    UIImage *image = [UIImage imageNamed: @"ico_search_two"];
    UIImageView *iView = [[UIImageView alloc] initWithImage:image];
    iView.frame = CGRectMake(0, 0, image.size.width , image.size.height);
    textfield.leftView = iView;
    textfield.frame = CGRectMake(15,  (55 - 35)/2,180, 35);
    
    [textfield setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textfield setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    textfield.font = [UIFont systemFontOfSize:15];
    
    textfield.layer.cornerRadius = 35/2;
    textfield.layer.borderWidth = 0.5;
    textfield.layer.masksToBounds = YES;
  
    
    
    //将搜索条放在一个UIView上
//    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(  0 , 0, 550 ,  70 )];
//    UIColor *color = self.navigationController.navigationBar.barTintColor;
//    [searchView setBackgroundColor:color];
//    
//    [searchView addSubview:searchBar];
    
    self.navigationItem.titleView = searchBar;
    
    //    右边的barButton
    UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,  47 ,  37 )];
    [rightBtn addTarget:self action:@selector(onClickToMsg) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"取消"  forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)accessoryBrowser:(HMAccessoryBrowser *)browser
     didFindNewAccessory:(HMAccessory *)accessory {
    // Update the UI per the new accessory; for example,
    NSLog(@"browserbrowserbrowser %@",browser);
    NSLog(@"accessoryaccessory %@",accessory);
}
//5.停止搜寻配件 如果一个视图控制器正在开始搜寻配件，那么可以通过重写 viewWillDisappear:方法来停止搜寻配件
- (void)viewWillDisappear:(BOOL)animated {
    [self.accessoryBrowser stopSearchingForNewAccessories];
}

- (void)onClickToMsg{
    NSLog(@"aaaaaa");
    [self.view endEditing:YES];

}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar endEditing:YES];
    
    
    
    [self serachResultWithKeyWord:searchBar.text];
    
}

#pragma mark - 历史记录保存到偏好设置
- (void)serachResultWithKeyWord:(NSString *)text {
    if ([text isEqualToString:@""]) {
        return;
    }
    
    //保存的时候判断是否已经存在，存在的话插入到最前面
}

 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
