//
//  UIView+HHAddition.h
//  Addition
//
//  Created by 花花 on 2017/1/17.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HHAddition)
/*在分类中声明@property,只会生成方法的声明,不会生成方法的实现和带有_下划线的成员变量*/
@property (nonatomic, assign) CGPoint origin;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property(nonatomic,assign)CGFloat right;
@property (nonatomic,assign) CGFloat left;
@property(nonatomic,assign)CGFloat bottom;
@property (nonatomic,assign) CGFloat top;

/**判断一个空间是否是真正显示在主窗口 */
-(BOOL)isShowingOnKeyWindow;


//xib加载
+(instancetype)viewFromXib;

// 查找子视图且不会保存
//view      要查找的视图
// clazzName 子控件类名
/// @return 找到的第一个子视图
+ (UIView *)hh_foundViewInView:(UIView *)view clazzName:(NSString *)clazzName;

/**
 ** lineView:	   需要绘制成虚线的view
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

@end
