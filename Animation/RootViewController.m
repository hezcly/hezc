//
//  RootViewController.m
//  Animation
//
//  Created by hezc on 14-8-26.
//  Copyright (c) 2014年 hezc. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCALayer];
}

-(void)initCALayer
{
    //初始化
    CALayer *kkLayer = [[CALayer alloc] init];
    kkLayer.backgroundColor = [UIColor redColor].CGColor;
    kkLayer.frame = CGRectMake(10, 100, 50, 30);
    
    kkLayer.cornerRadius = 5;  //圆角处理
    [self.view.layer addSublayer:kkLayer];  //增加到UIView的layer上
    
    //移动kkLayer的position
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
    CGPoint toPoint = kkLayer.position;
    toPoint.x += 230;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    //以x轴进行旋转
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    
    //对kkLayer进行放大缩小
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleAnimation.duration = 3;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    //把上边的动画组合起来
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:animation,rotateAnimation,scaleAnimation, nil];
    group.repeatCount = NSNotFound;
    group.duration = 3;
    group.autoreverses = YES; //完成后反向完成
    //动画结束后，他会返回到自己的frame，如果不想到原来的frame我们需要设定
    group.fillMode = kCAFillModeForwards;
    
    //让动画开始
    [kkLayer addAnimation:group forKey:@"kkLayerMove"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
