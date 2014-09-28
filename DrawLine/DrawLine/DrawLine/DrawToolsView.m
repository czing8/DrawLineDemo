//
//  DrawToolsView.m
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "DrawToolsView.h"
#import "ToolButton.h"

#define kButtonSpace 10
#define kSCREEN_SIZE  [UIScreen mainScreen].bounds.size

@interface DrawToolsView (){
    BrushColorBlock _brushColorBlock;
    BrushWidthBlock _brushWidthBlock;
}
@property (weak, nonatomic) ToolButton *selectBtn;
@property (weak, nonatomic) BrushColorView *colorView;
@property (weak, nonatomic) BrushWidthView *lineWidthView;

@end

@implementation DrawToolsView

- (id)initWithFrame:(CGRect)frame brushColor:(BrushColorBlock)brushColor brushColor:(BrushWidthBlock)brushWidth{
    _brushColorBlock = brushColor;
    _brushWidthBlock = brushWidth;
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        NSArray *BtnArray = @[@"颜色",@"线宽"];
        [self createButton:BtnArray];
    }
    return self;
}
- (void)createButton:(NSArray *)array
{
    CGFloat btnWidth = (self.bounds.size.width-kButtonSpace*array.count+1)/array.count;
    for (NSInteger i = 0; i<array.count; i++) {
        ToolButton *button = [ToolButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kButtonSpace + i*(kButtonSpace + btnWidth), 5, btnWidth, self.bounds.size.height-10);
        button.tag = 1001+i;
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

- (void)clickAction:(ToolButton *)sender
{
    if (_selectBtn != nil && _selectBtn != sender) {
        if (_colorView.frame.origin.y > 0.0f || _lineWidthView.frame.origin.y > 0.0f) {
            return;
        }
        _selectBtn.isSelectBtn = NO;
    }
    sender.isSelectBtn = YES;
    _selectBtn = sender;
    switch (sender.tag) {
        case 1001:
        {
            if (_colorView == nil) {
                BrushColorView *colorview =[[BrushColorView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_SIZE.width, 44) brushColor:^(UIColor *color) {
                    _brushColorBlock(color);
                }];
                [self.superview addSubview:colorview];
                _colorView = colorview;
            }
            CGFloat colorViewY = CGRectGetMaxY(self.frame);
            if (_colorView.frame.origin.y>0.0f) {
                colorViewY = -CGRectGetMaxY(self.frame);
            }else{
                colorViewY = CGRectGetMaxY(self.frame);
            }
            if (_lineWidthView.frame.origin.y>0.0f) {
                colorViewY = -CGRectGetMaxY(self.frame);
            }
            [UIView animateWithDuration:0.5f animations:^{
                _colorView.frame = CGRectMake(0, colorViewY, kSCREEN_SIZE.width, 44);
            }];
        }
            break;
        case 1002:
        {
            if (_lineWidthView == nil) {
                
                BrushWidthView * lineWidthView = [[BrushWidthView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_SIZE.width, 44) brushWidth:^(float width) {
                    _brushWidthBlock(width);
                }];
                
                [self.superview addSubview:lineWidthView];
                _lineWidthView = lineWidthView;
            }
            CGFloat lineWidViewY = CGRectGetMaxY(self.frame);
            if (_lineWidthView.frame.origin.y>0.0f) {
                lineWidViewY = -CGRectGetMaxY(self.frame);
            }else{
                lineWidViewY = CGRectGetMaxY(self.frame);
            }
            if (_colorView.frame.origin.y>0.0f) {
                lineWidViewY = -CGRectGetMaxY(self.frame);
            }
            
            [UIView animateWithDuration:0.5f animations:^{
                _lineWidthView.frame = CGRectMake(0, lineWidViewY, kSCREEN_SIZE.width, 44);
                NSLog(@"%@", NSStringFromCGRect( _lineWidthView.frame));
            }];
            
        }
            break;
        default:
            break;
    }
}
@end
