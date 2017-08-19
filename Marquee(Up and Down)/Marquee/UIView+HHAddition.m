//
//  UIView+HHAddition.m
//  Addition
//
//  Created by 花花 on 2017/1/17.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "UIView+HHAddition.h"

@implementation UIView (HHAddition)
-(void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    
}

-(CGSize)size{
    return self.frame.size;
    
}
- (CGFloat)top
{
    return self.frame.origin.y;
}


- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)left
{
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width  =width;
    self.frame = frame;
    
}
-(void)setHeight:(CGFloat)height{
    
    CGRect  frame = self.frame;
    frame.size.height = height;
    self.frame =frame;
    
    
}
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

-(void)setY:(CGFloat)y{
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(void)setCenterX:(CGFloat)centerX{
    if (isnan(centerX)) {
        centerX = 0;
    }
    CGPoint center = self.center;
    center.x = centerX;
    
    self.center  =center;
}
-(void)setCenterY:(CGFloat)centerY{
    
    CGPoint center = self.center;
    center.y = centerY;
    
    self.center  =center;
    
    
}
-(CGFloat)centerX{
    
    return self.center.x;
    
}
-(CGFloat)centerY{
    
    return self.center.y;
    
}

-(CGFloat)width{
    
    return self.frame.size.width;
    
}

-(CGFloat)height{
    
    return self.frame.size.height;
}
-(CGFloat)x{
    
    return self.frame.origin.x;
    
}
-(CGFloat)y{
    
    return self.frame.origin.y;
}



-(CGFloat)right{
    
    return CGRectGetMaxX(self.frame);
    
}

-(void)setRight:(CGFloat)right{
    
    self.x = right-self.width;
    
}

-(CGFloat)bottom{
    
    return CGRectGetMaxY(self.frame);
}
-(void)setBottom:(CGFloat)bottom{
    self.y = bottom- self.height;
    
    
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


/**判断一个空间是否是真正显示在主窗口 */
-(BOOL)isShowingOnKeyWindow{
    
    UIWindow *keyWindow =[UIApplication sharedApplication].keyWindow;
    
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    
    CGRect winBounds = keyWindow.bounds;
    
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
    
    
}
/**
 ** lineView:	   需要绘制成虚线的view
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+(instancetype)viewFromXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
}

//输出所有子控件
+ (UIView *)hh_foundViewInView:(UIView *)view clazzName:(NSString *)clazzName{
    
    // 递归出口
    if ([view isKindOfClass:NSClassFromString(clazzName)]) {
        return view;
    }
    // 遍历所有子视图
    for (UIView *subView in view.subviews) {
        UIView *foundView = [self hh_foundViewInView:subView clazzName:clazzName];
        if (foundView) {
            return foundView;
        }
    }
    return nil;
}

@end
