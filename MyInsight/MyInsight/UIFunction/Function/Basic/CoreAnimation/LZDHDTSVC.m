//
//  LZDHDTSVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/4/23.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "LZDHDTSVC.h"

@interface LZDHDTSVC ()

@end

@implementation LZDHDTSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"粒子动画多条";
}

- (IBAction)startAni:(UIButton *)sender {
    LZDHDTSDrawView *view = (LZDHDTSDrawView *)self.view;
    [view startAnim];
}

- (IBAction)reDraw:(UIButton *)sender {
    LZDHDTSDrawView *view = (LZDHDTSDrawView *)self.view;
    [view reDraw];
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

@interface LZDHDTSDrawView ()

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, weak) CALayer *dotLayer;

@property (nonatomic, weak) CAReplicatorLayer *repL;

@end

@implementation LZDHDTSDrawView

#pragma mark - 懒加载点层
- (CALayer *)dotLayer {
    if (_dotLayer == nil) {
        // 创建图层
        CALayer *layer = [CALayer layer];
        
        CGFloat wh = 10;
        layer.frame = CGRectMake(0, -1000, wh, wh);
        
        layer.cornerRadius = wh / 2;
        
        layer.backgroundColor = [UIColor blueColor].CGColor;
        [_repL addSublayer:layer];
        
        _dotLayer = layer;
    }
    return _dotLayer;
}

- (UIBezierPath *)path {
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
    }
    
    return _path;
}

#pragma mark - 开始点击调用
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 获取touch对象
    UITouch *touch = [touches anyObject];
    // 获取当前触摸点
    CGPoint curP = [touch locationInView:self];
    // 设置起点
    [self.path moveToPoint:curP];
}

static int _instansCount = 0;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // 获取touch对象
    UITouch *touch = [touches anyObject];
    // 获取当前触摸点
    CGPoint curP = [touch locationInView:self];
    // 添加线到某个点
    [_path addLineToPoint:curP];
    // 重绘
    [self setNeedsDisplay];
    
    _instansCount ++;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [_path stroke];
}

#pragma mark - 开始动画
- (void)startAnim {
    // 创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    
    anim.path = _path.CGPath;
    
    anim.duration = 3;
    
    anim.repeatCount = MAXFLOAT;
    
    [self.dotLayer addAnimation:anim forKey:nil];
    // 注意:如果复制的子层有动画，先添加动画，在复制
    // 复制子层
    _repL.instanceCount = _instansCount;
    
    // 延迟图层动画
    _repL.instanceDelay = 0.2;
}

#pragma mark - 加载完xib调用，创建复制层
- (void)awakeFromNib {
    [super awakeFromNib];
    // 创建复制层
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    
    repL.frame = self.bounds;
    
    [self.layer addSublayer:repL];
    
    _repL = repL;
}
#pragma mark - 重绘
- (void)reDraw {
    // 清空绘图信息
    _path = nil;
    [self setNeedsDisplay];
    
    // 把图层移除父控件，复制层也会移除。
    [_dotLayer removeFromSuperlayer];
    _dotLayer = nil;
    
    // 清空子层总数
    _instansCount = 0;
    
}

@end

