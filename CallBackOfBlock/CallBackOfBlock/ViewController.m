//
//  ViewController.m
//  CallBackOfBlock
//
//  Created by ZhongMeng on 17/2/22.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end






/*
 Block实现iOS回调
 */
//
//关于回调函数的形象的比喻:
//你到一个商店买东西，刚好你要的东西没有货，于是你在店员那里留下了你的电话，过了几天店里有货了，店员就打了你的电话，然后你接到电话后就到店里去取了货。在这个例子里，你的电话号码就叫回调函数，你把电话留给店员就叫登记回调函数，店里后来有货了叫做触发了回调关联的事件，店员给你打电话叫做调用回调函数，你到店里去取货叫做响应回调事件


//正式的定义:
//callback(回调)就是一段「代码」，我们会通过某种途径，将这段「代码」和一个特定的事件(event)联系起来，当特定事件(event)发生后，这段「代码」被执行。

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    
    
    
    
    
    
}


//**实例1、数据更新触发回调
//在个人主页我们需要显示用户的昵称、头像、性别、签名，然后点击编辑按钮，跳转到编辑个人信息页面，编辑完个人信息之后，点击返回到主页的时候，我们需要根据用户设定的值来更新相应的信息。



/*
 //personalHomePage.m文件
 //**************************
 - (void)editPersonalInfo{
 EditPersonalInfoController *edit = [[SGEditPersonalInfoController alloc]init];
 
 __weak typeof(self)weakself = self;
 
 
 edit.updateUserInfoBlock = ^(NSString *userName, NSString *userSex, NSString *userSign ,UIImage *userImage)
 {
 weakself.userHeaderImageView.image = [userImage circleImage];//用户头像
 weakself.nickNameLabel.text = userName;//昵称
 weakself.signLabel.text = userSign;//签名
 weakself.sexImageView.image = ([userSex isEqualToString:@"女"]) ? [UIImage imageNamed:@"icon_female"] : [UIImage imageNamed:@"icon_male"];//性别
 
 }
 }
 
 */








/*
 
 EditPersonalInfoController.h文件
 ***********************************
 @interface EditPersonalInfoController :UITableViewController
 @property(nonatomic, copy)void(^updateUserInfoBlock)(NSString *userName, NSString *userSex, NSString *userSign ,UIImage *userImage) ;
 @end
 
 
 EditPersonalInfoController.m文件
 ***********************************
 - (void)personalInfoHadChanged{
 if (self.updateUserInfoBlock) {
 self.updateUserInfoBlock(self.userName, self.userSex, self.userSign, self.userImage);
 }
 }
 
 */






////**实例2、人为触发回调


//比如用户点击了某个按钮或者页面，我们需要做回调去处理一些逻辑。

//我们需要给该view添加一个Tap手势，当用户点击的时候我们就触发回调函数，让使用该viwe的控制器去重新加载数据。


/*
 
 NetworkErrorPromptView.h文件
 **********************************
 @interface NetworkErrorPromptView : UIView
 @property(copy,nonatomic)void(^reloadBlock)();//申明回调函数
 @end
 
 
 NetworkErrorPromptView.m文件
 **********************************
 @implementation NetworkErrorPromptView
 
 -(instancetype)initWithFrame:(CGRect)frame{
 if (self == [super initWithFrame:frame]) {
 self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
 [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reload)]];
 }
 return self;
 }
 
 -(void)reload{
 if (self.reloadBlock)
 {
 self.reloadBlock();//调用回调函数
 }
 }
 @end
 
 
 */





/*
 
 假设在一个UITableViewController里面使用了该view，使用懒加载初始化该view
 
 -(NetworkErrorPromptView*)errorView{
 if (!_errorView) {
 _errorView = [[SGNetworkErrorPromptView alloc]init];
 _errorView.frame = CGRectMake(0, 0, self.tableView.w, self.tableView.h);
 __weak typeof(self) weakself = self;
 _errorView.reloadBlock = ^{//登记回调函数，被触发就调用
 [weakself.tableView.mj_header beginRefreshing];
 };
 }
 return _errorView;
 }
 
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
