//
//  BrushColorView.m
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "BrushColorView.h"

#define kButtonSpace 10

@interface BrushColorView ()

@property (nonatomic, copy) BrushColorBlock brushColorBlock;
@property (nonatomic, strong) NSArray *colorArray;

@end

@implementation BrushColorView

- (id)initWithFrame:(CGRect)frame brushColor:(BrushColorBlock)brushColor{
    
    _brushColorBlock = brushColor;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _colorArray = [NSArray array];
        NSArray *array = @[[UIColor darkGrayColor],
                           [UIColor redColor],
                           [UIColor greenColor],
                           [UIColor blueColor],
                           [UIColor yellowColor],
                           [UIColor orangeColor],
                           [UIColor purpleColor],
                           [UIColor brownColor],
                           [UIColor blackColor]];
        
        _colorArray = array;
        [self createColorButtons:array];
    }
    return self;
}

- (void)createColorButtons:(NSArray *)array
{
    NSInteger count = array.count;
    CGFloat buttonW = (self.bounds.size.width - (array.count+1)*kButtonSpace)/count;
    CGFloat buttonH = self.bounds.size.height;
    for (NSInteger i = 0; i<array.count; i++) {
        UIColor *color = array[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button addTarget:self action:@selector(tagButton:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = kButtonSpace + i * (buttonW +kButtonSpace);
        button.frame = CGRectMake(buttonX, 5, buttonW, buttonH-10);
        [button setBackgroundColor:color];
        [self addSubview:button];
    }
}

- (void)tagButton:(UIButton *)button
{
    [UIView animateWithDuration:0.5f animations:^{
        self.frame = CGRectMake(0, -self.bounds.size.height, 320, 44);
    }];
    _brushColorBlock(_colorArray[button.tag]);
    //    NSLog(@"%@",_colorArray[button.tag]);
}

@end
