//
//  ToolButton.m
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "ToolButton.h"

@implementation ToolButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setNeedsDisplay];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    if (_isSelectBtn) {
        CGRect btnRect = CGRectMake(0, self.bounds.size.height-2, self.bounds.size.width, 2);
        [[UIColor redColor]set];
        UIRectFill(btnRect);
    }
}
- (void)setIsSelectBtn:(BOOL)isSelectBtn
{
    _isSelectBtn = isSelectBtn;
    [self setNeedsDisplay];
}

@end
