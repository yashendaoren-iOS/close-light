//
//  ViewController.m
//  关灯
//
//  Created by Silver on 15/11/1.
//  Copyright © 2015年 Silver. All rights reserved.
//

#import "ViewController.h"

#define lon   9 //一行9个
#define lat   11 //一列11个
#define kWidth [UIScreen mainScreen].bounds.size.width/lon //宽
#define kHeight  ([UIScreen mainScreen].bounds.size.height - 20)/lat //高

//随机产生 15 个黑色方块
#define num 15

//点击的是 i j tag
//上i1 j1 tag1
//下i2 j2 tag2
//左i3 j3 tag3
//右i4 j4 tag4

@interface ViewController (){

    BOOL _array[lon*lat];
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    //随机产生15个黑色方块
    for (int m = 0; m < num; m++) {
        int a = arc4random_uniform(lon * lat);
        _array[a] = YES;
    }
    
    //绘制 视图
    [self _initView];
}
- (void)_initView{

    for (int i = 0; i < lat; i++) {
        for (int j = 0; j < lon; j++) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(j * kWidth, i * kHeight + 20, kWidth - 0.5, kHeight - 0.5)];
            button.selected = _array[i * lon + j];
            if (!button.selected) {
                button.backgroundColor = [UIColor whiteColor];
            }else{
                button.backgroundColor = [UIColor blackColor];
            }

            button.tag = (i + 1) * 100 + j;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
    }
}
- (void)buttonAction:(UIButton *)button{
    
    //点击的button 变颜色
    button.selected = !button.selected;
    if (!button.selected) {
        button.backgroundColor = [UIColor whiteColor];
    }else{
        button.backgroundColor = [UIColor blackColor];
    }
    NSInteger tag = button.tag;
    NSInteger i = tag/100;
    NSInteger j = tag%100;
    _array[i * lon + j] = !_array[i * lon + j];
    
    
    //旁边的变颜色
    switch (tag) {
        case 100://左上角（点击的是左上角的第一个）       右 下（这两个变色）
        {
            //右边
            UIButton *rightBtn = (UIButton *)[self.view viewWithTag:tag + 1];
            rightBtn.selected = !rightBtn.selected;
            if (!rightBtn.selected) {
                rightBtn.backgroundColor = [UIColor whiteColor];
            }else{
                rightBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag4 = tag + 1;
            NSInteger i4 = tag4/100;
            NSInteger j4 = tag4%100;
            _array[i4 * lon + j4] = !_array[i4 * lon + j4];
            
            //下边
            UIButton *downBtn = (UIButton *)[self.view viewWithTag:tag + 100];
            downBtn.selected = !downBtn.selected;
            if (!downBtn.selected) {
                downBtn.backgroundColor = [UIColor whiteColor];
            }else{
                downBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag2 = tag + 100;
            NSInteger i2 = tag2/100;
            NSInteger j2 = tag2%100;
            _array[i2 * lon + j2] = !_array[i2 * lon + j2];
        }
            break;
        case 100 + lon - 1: //右上角     左 下
        {
            //左边
            UIButton *leftBtn = (UIButton *)[self.view viewWithTag:tag - 1];
            leftBtn.selected = !leftBtn.selected;
            if (!leftBtn.selected) {
                leftBtn.backgroundColor = [UIColor whiteColor];
            }else{
                leftBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag3 = tag - 1;
            NSInteger i3 = tag3/100;
            NSInteger j3 = tag3%100;
            _array[i3 * lon + j3] = !_array[i3 * lon + j3];
            
            //下边
            UIButton *downBtn = (UIButton *)[self.view viewWithTag:tag + 100];
            downBtn.selected = !downBtn.selected;
            if (!downBtn.selected) {
                downBtn.backgroundColor = [UIColor whiteColor];
            }else{
                downBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag2 = tag + 100;
            NSInteger i2 = tag2/100;
            NSInteger j2 = tag2%100;
            _array[i2 * lon + j2] = !_array[i2 * lon + j2];
            
        }
            break;
        case 100 * lat://左下角          右 上
        {
            //右边
            UIButton *rightBtn = (UIButton *)[self.view viewWithTag:tag + 1];
            rightBtn.selected = !rightBtn.selected;
            if (!rightBtn.selected) {
                rightBtn.backgroundColor = [UIColor whiteColor];
            }else{
                rightBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag4 = tag + 1;
            NSInteger i4 = tag4/100;
            NSInteger j4 = tag4%100;
            _array[i4 * lon + j4] = !_array[i4 * lon + j4];
            
            //上边
            UIButton *upBtn = (UIButton *)[self.view viewWithTag:tag - 100];
            upBtn.selected = !upBtn.selected;
            if (!upBtn.selected) {
                upBtn.backgroundColor = [UIColor whiteColor];
            }else{
                upBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag1 = tag - 100;
            NSInteger i1 = tag1/100;
            NSInteger j1 = tag1%100;
            _array[i1 * lon + j1] = !_array[i1 * lon + j1];
            
            
        }
            break;
        case 100 * lat + lon - 1://右下角        左 上
        {
            //左边
            UIButton *leftBtn = (UIButton *)[self.view viewWithTag:tag - 1];
            leftBtn.selected = !leftBtn.selected;
            if (!leftBtn.selected) {
                leftBtn.backgroundColor = [UIColor whiteColor];
            }else{
                leftBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag3 = tag - 1;
            NSInteger i3 = tag3/100;
            NSInteger j3 = tag3%100;
            _array[i3 * lon + j3] = !_array[i3 * lon + j3];

            
            //上边
            UIButton *upBtn = (UIButton *)[self.view viewWithTag:tag - 100];
            upBtn.selected = !upBtn.selected;
            if (!upBtn.selected) {
                upBtn.backgroundColor = [UIColor whiteColor];
            }else{
                upBtn.backgroundColor = [UIColor blackColor];
            }
            NSInteger tag1 = tag - 100;
            NSInteger i1 = tag1/100;
            NSInteger j1 = tag1%100;
            _array[i1 * lon + j1] = !_array[i1 * lon + j1];
            
        }
            break;
            
        default:
        {
        
            if (tag > 100 && tag < 100+lon) {//第一行        左 右 下
                
                //下边
                UIButton *downBtn = (UIButton *)[self.view viewWithTag:tag + 100];
                downBtn.selected = !downBtn.selected;
                if (!downBtn.selected) {
                    downBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    downBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag2 = tag + 100;
                NSInteger i2 = tag2/100;
                NSInteger j2 = tag2%100;
                _array[i2 * lon + j2] = !_array[i2 * lon + j2];
                
                //左边
                UIButton *leftBtn = (UIButton *)[self.view viewWithTag:tag - 1];
                leftBtn.selected = !leftBtn.selected;
                if (!leftBtn.selected) {
                    leftBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    leftBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag3 = tag - 1;
                NSInteger i3 = tag3/100;
                NSInteger j3 = tag3%100;
                _array[i3 * lon + j3] = !_array[i3 * lon + j3];
                
                //右边
                UIButton *rightBtn = (UIButton *)[self.view viewWithTag:tag + 1];
                rightBtn.selected = !rightBtn.selected;
                if (!rightBtn.selected) {
                    rightBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    rightBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag4 = tag + 1;
                NSInteger i4 = tag4/100;
                NSInteger j4 = tag4%100;
                _array[i4 * lon + j4] = !_array[i4 * lon + j4];
                
                
            }else if (tag%100 == 0){//第一列 上 下 右
                //上边
                UIButton *upBtn = (UIButton *)[self.view viewWithTag:tag - 100];
                upBtn.selected = !upBtn.selected;
                if (!upBtn.selected) {
                    upBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    upBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag1 = tag - 100;
                NSInteger i1 = tag1/100;
                NSInteger j1 = tag1%100;
                _array[i1 * lon + j1] = !_array[i1 * lon + j1];
                
                //下边
                UIButton *downBtn = (UIButton *)[self.view viewWithTag:tag + 100];
                downBtn.selected = !downBtn.selected;
                if (!downBtn.selected) {
                    downBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    downBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag2 = tag + 100;
                NSInteger i2 = tag2/100;
                NSInteger j2 = tag2%100;
                _array[i2 * lon + j2] = !_array[i2 * lon + j2];
                
                //右边
                UIButton *rightBtn = (UIButton *)[self.view viewWithTag:tag + 1];
                rightBtn.selected = !rightBtn.selected;
                if (!rightBtn.selected) {
                    rightBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    rightBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag4 = tag + 1;
                NSInteger i4 = tag4/100;
                NSInteger j4 = tag4%100;
                _array[i4 * lon + j4] = !_array[i4 * lon + j4];
            
            }else if (tag%100 == lon){//最后一列 上 下 左
                //上边
                UIButton *upBtn = (UIButton *)[self.view viewWithTag:tag - 100];
                upBtn.selected = !upBtn.selected;
                if (!upBtn.selected) {
                    upBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    upBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag1 = tag - 100;
                NSInteger i1 = tag1/100;
                NSInteger j1 = tag1%100;
                _array[i1 * lon + j1] = !_array[i1 * lon + j1];
                
                //下边
                UIButton *downBtn = (UIButton *)[self.view viewWithTag:tag + 100];
                downBtn.selected = !downBtn.selected;
                if (!downBtn.selected) {
                    downBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    downBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag2 = tag + 100;
                NSInteger i2 = tag2/100;
                NSInteger j2 = tag2%100;
                _array[i2 * lon + j2] = !_array[i2 * lon + j2];
                
                //左边
                UIButton *leftBtn = (UIButton *)[self.view viewWithTag:tag - 1];
                leftBtn.selected = !leftBtn.selected;
                if (!leftBtn.selected) {
                    leftBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    leftBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag3 = tag - 1;
                NSInteger i3 = tag3/100;
                NSInteger j3 = tag3%100;
                _array[i3 * lon + j3] = !_array[i3 * lon + j3];
            
            }else if (tag > 100*lat && tag < 100*lat + lon){//最后一行  左 右 上
                //上边
                UIButton *upBtn = (UIButton *)[self.view viewWithTag:tag - 100];
                upBtn.selected = !upBtn.selected;
                if (!upBtn.selected) {
                    upBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    upBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag1 = tag - 100;
                NSInteger i1 = tag1/100;
                NSInteger j1 = tag1%100;
                _array[i1 * lon + j1] = !_array[i1 * lon + j1];
                
                //左边
                UIButton *leftBtn = (UIButton *)[self.view viewWithTag:tag - 1];
                leftBtn.selected = !leftBtn.selected;
                if (!leftBtn.selected) {
                    leftBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    leftBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag3 = tag - 1;
                NSInteger i3 = tag3/100;
                NSInteger j3 = tag3%100;
                _array[i3 * lon + j3] = !_array[i3 * lon + j3];
                
                //右边
                UIButton *rightBtn = (UIButton *)[self.view viewWithTag:tag + 1];
                rightBtn.selected = !rightBtn.selected;
                if (!rightBtn.selected) {
                    rightBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    rightBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag4 = tag + 1;
                NSInteger i4 = tag4/100;
                NSInteger j4 = tag4%100;
                _array[i4 * lon + j4] = !_array[i4 * lon + j4];
            
            }else{//其他 上 下 左 右
            
                //上边
                UIButton *upBtn = (UIButton *)[self.view viewWithTag:tag - 100];
                upBtn.selected = !upBtn.selected;
                if (!upBtn.selected) {
                    upBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    upBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag1 = tag - 100;
                NSInteger i1 = tag1/100;
                NSInteger j1 = tag1%100;
                _array[i1 * lon + j1] = !_array[i1 * lon + j1];
                
                //下边
                UIButton *downBtn = (UIButton *)[self.view viewWithTag:tag + 100];
                downBtn.selected = !downBtn.selected;
                if (!downBtn.selected) {
                    downBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    downBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag2 = tag + 100;
                NSInteger i2 = tag2/100;
                NSInteger j2 = tag2%100;
                _array[i2 * lon + j2] = !_array[i2 * lon + j2];
                
                //左边
                UIButton *leftBtn = (UIButton *)[self.view viewWithTag:tag - 1];
                leftBtn.selected = !leftBtn.selected;
                if (!leftBtn.selected) {
                    leftBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    leftBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag3 = tag - 1;
                NSInteger i3 = tag3/100;
                NSInteger j3 = tag3%100;
                _array[i3 * lon + j3] = !_array[i3 * lon + j3];
                
                //右边
                UIButton *rightBtn = (UIButton *)[self.view viewWithTag:tag + 1];
                rightBtn.selected = !rightBtn.selected;
                if (!rightBtn.selected) {
                    rightBtn.backgroundColor = [UIColor whiteColor];
                }else{
                    rightBtn.backgroundColor = [UIColor blackColor];
                }
                NSInteger tag4 = tag + 1;
                NSInteger i4 = tag4/100;
                NSInteger j4 = tag4%100;
                _array[i4 * lon + j4] = !_array[i4 * lon + j4];

                
            }
        }
            break;
    }
    
    //全部变为黑色 表示通关
    for (int k = 0; k < lon * lat; k++) {
        if (_array[k]) {
            continue;
        }else{
            return;
        }
    }
    
    //提示通关
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:@"恭喜通关！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
