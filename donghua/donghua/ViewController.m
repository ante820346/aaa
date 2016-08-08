//
//  ViewController.m
//  donghua
//
//  Created by Developer on 16/8/4.
//  Copyright © 2016年 yujiancun. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,assign)CGRect exFrame;
@property (nonatomic,strong) UIView*d3view;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _arr =   @[@"放大出现",@"缩小消失",@"闪亮",@"左右摇",@"上下摇",@"心跳",@"摇摆",@"缩小",@"放大",@"掉落",@"翻转",@"翻页",@"推出",@"覆盖",@"揭开",@"3D立方",@"抽走",@"不停旋转",@"渐隐",@"渐现"];
    
    _d3view = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    _d3view.backgroundColor = [UIColor redColor];
    [self.view addSubview:_d3view];
    
    
    
    
    _exFrame = _d3view.frame;
}


//一共多少列
 -(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
 {
        return 1;
 }

//每列对应多少行
 -(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
 {
       //1.获取当前的列
//       NSArray *arayM= self.foods[component];
       //2.返回当前列对应的行数
       return self.arr.count;
 }


//每列每行对应显示的数据是什么
 -(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
     //1.获取当前的列
//        NSArray *arayM= self.foods[component];
    //2.获取当前列对应的行的数据
//         NSString *name=arayM[row];
     return _arr[row];
   }



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
 {
    
     
     _d3view.transform = CGAffineTransformIdentity;
     _d3view.size = CGSizeMake(_exFrame.size.width, _exFrame.size.height);
    
    
     [_d3view d3_setPoint:CGPointMake(_exFrame.origin.x, _exFrame.origin.y) completion: nil];
     
     _d3view.alpha = 1;
     
     
         //获取对应列，对应行的数据
     switch (row-2){
     case -2:
             [_d3view d3_scale:0.50];
//
//     case -1:
//             
//         _d3view.d3_scaleOut(0.8, siteType: .Center)
             break;
     case 0:  //闪亮
//         _d3view.d3_blink()
             [_d3view d3_blink];
             break;
     case 1:  //左右摇
             [_d3view d3_shake];
             break;
     case 2:  //上下摇
           [_d3view d3_bounce:10 duration:0.2 completion:^{
               NSLog(@"摇摆乐");
           }];
             
             break;
//
//     case 3:  //心跳
//         d3view.d3_heartbeat()
//         
//     case 4:  //摇摆
//         d3view.d3_swing()
//         
     case 5:  //缩小
             [_d3view d3_scale:0.01];
             break;
     case 6:  //放大
             [_d3view d3_scale:2.0];
//br
             break;
//     case 7:  //掉落
//         d3view.d3_drop()
//         
//     case 8:  //翻转
//         d3view.d3_flip()
//         
//     case 9:  //翻页
//         d3view.d3_pageing()
//         
//     case 10:
//         //后面的效果自己尝试，换参数而已
//         //                fade     //交叉淡化过渡(不支持过渡方向)
//         //                push     //新视图把旧视图推出去
//         //                moveIn   //新视图移到旧视图上面
//         //                reveal   //将旧视图移开,显示下面的新视图
//         //                cube     //立方体翻滚效果
//         //                oglFlip  //上下左右翻转效果
//         //                suckEffect   //收缩效果，如一块布被抽走(不支持过渡方向)
//         //                rippleEffect //滴水效果(不支持过渡方向)
//         //                pageCurl     //向上翻页效果
//         //                pageUnCurl   //向下翻页效果
//         //                cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向)
//         //            cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
//         
//         
//         //            subType:
//         //            kCATransitionFromRight
//         //            kCATransitionFromLeft
//         //            kCATransitionFromTop
//         //            kCATransitionFromBottom
//         
//         d3view.d3_Animation(kCATransitionPush, subType: kCATransitionFromRight, duration: 1.0)
//         
//     case 11:
//         d3view.d3_Animation(kCATransitionMoveIn, subType: kCATransitionFromRight, duration: 1.0)
//         
//     case 12:
//         d3view.d3_Animation(kCATransitionReveal, subType: kCATransitionFromRight, duration: 1.0)
//         
//     case 13:  //立方
//         d3view.d3_Animation("cube", subType: kCATransitionFromRight, duration: 1.0)
//         
//     case 14:
//         d3view.d3_Animation("suckEffect", subType: kCATransitionFromRight, duration: 1.0)
//         
//     case 15:  //不停旋转. 如果执行过掉落，这里可能有问题
//         d3view.d3_setRotate(-1, duration: 1, completion: nil)
//         
     case 16:  //渐隐
             [_d3view d3_fadeOut];
             break;
     case 17:  //渐现
             [_d3view d3_fadeIn];
//
             break;
     default:
         break;
     }
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
