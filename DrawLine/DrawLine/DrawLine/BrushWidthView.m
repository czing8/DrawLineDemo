//
//  BrushWIdthView.m
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "BrushWidthView.h"

#define kButtonSpace 10

@interface BrushWidthView ()

@property (nonatomic, copy) BrushWidthBlock brushWidthBlock;
@property (nonatomic, strong) NSArray *lineArray;

@end

@implementation BrushWidthView

- (id)initWithFrame:(CGRect)frame brushWidth:(BrushWidthBlock)brushWidth{
    _brushWidthBlock = brushWidth;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        NSArray *array = @[[NSNumber numberWithFloat:3],
                           [NSNumber numberWithFloat:8],
                           [NSNumber numberWithFloat:15],
                           [NSNumber numberWithFloat:20],
                           [NSNumber numberWithFloat:27],
                           [NSNumber numberWithFloat:32],
                           [NSNumber numberWithFloat:39],
                           [NSNumber numberWithFloat:44],
                           [NSNumber numberWithFloat:50],];
        _lineArray = array;
        [self createButtons:array];
    }
    return self;
}

- (void)createButtons:(NSArray *)array
{
    NSInteger count = array.count;
    CGFloat buttonW = (self.bounds.size.width - (array.count+1)*kButtonSpace)/count;
    CGFloat buttonH = self.bounds.size.height;
    for (NSInteger i = 0; i<array.count; i++) {
        NSString *text = [array[i]stringValue];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button addTarget:self action:@selector(tagButton:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = kButtonSpace + i * (buttonW +kButtonSpace);
        button.frame = CGRectMake(buttonX, 5, buttonW, buttonH-10);
        [button setTitle:text forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

- (void)tagButton:(UIButton *)button
{
    [UIView animateWithDuration:0.5f animations:^{
        self.frame = CGRectMake(0, -self.bounds.size.height, 320, 44);
    }];
    _brushWidthBlock([_lineArray[button.tag]floatValue]);
}


@end
