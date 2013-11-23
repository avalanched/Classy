//
//  CASCatalogButtonsViewController.m
//  ClassyExample
//
//  Created by Andy Jacobs on 23/11/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "CASCatalogButtonsViewController.h"
#import <Classy/Classy.h>

@interface CASCustomButton : UIButton

@property (nonatomic,strong) UIColor *topBorderColor;

@end

@implementation CASCustomButton

- (void) setTopBorderColor:(UIColor *)topBorderColor
{
    _topBorderColor = topBorderColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextSetStrokeColorWithColor(context, [self.topBorderColor CGColor] );
    CGContextSetLineWidth(context, 5.0);
    CGContextStrokePath(context);
}

@end

@implementation CASCatalogButtonsViewController

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.title = @"Buttons";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor greenColor];
    
    float yOff = 80;
    NSUInteger i = 0;
    for( ; i < 7 ; i++ )
    {
        NSString *buttonStyle = [NSString stringWithFormat:@"button-%i", i];
        
        UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
        b.cas_styleClass = buttonStyle;
        [b setTitle:buttonStyle forState:UIControlStateNormal];
        b.frame = CGRectMake(10, yOff, self.view.bounds.size.width-20, 40);
        [self.view addSubview:b];
        yOff += CGRectGetHeight(b.frame) + 15;
    }
    
    
    NSString *buttonStyle = [NSString stringWithFormat:@"button-%i", i];
    
    UIButton *b = [CASCustomButton buttonWithType:UIButtonTypeCustom];
    b.cas_styleClass = buttonStyle;
    [b setTitle:buttonStyle forState:UIControlStateNormal];
    b.frame = CGRectMake(10, yOff, self.view.bounds.size.width-20, 40);
    [self.view addSubview:b];
    yOff += CGRectGetHeight(b.frame) + 15;
}

@end
