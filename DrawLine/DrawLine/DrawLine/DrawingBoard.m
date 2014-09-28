//
//  DrawingBoard.m
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "DrawingBoard.h"
#import "DrawToolsView.h"
#import "DrawModel.h"

@interface DrawingBoard ()

@property (assign, nonatomic) CGMutablePathRef path;
@property (strong, nonatomic) NSMutableArray *pathArray;
@property (assign, nonatomic) BOOL isHavePath;

@end

@implementation DrawingBoard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _lineWidth = 10.0f;
        _lineColor = [UIColor redColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawView:context];
}


- (void)drawView:(CGContextRef)context
{
    for (DrawModel *drawModel in _pathArray) {
        CGContextAddPath(context, drawModel.path.CGPath);
        [drawModel.color set];
        CGContextSetLineWidth(context, drawModel.width);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextDrawPath(context, kCGPathStroke);
    }
    if (_isHavePath) {
        CGContextAddPath(context, _path);
        [_lineColor set];
        CGContextSetLineWidth(context, _lineWidth);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextDrawPath(context, kCGPathStroke);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location =[touch locationInView:self];
    _path = CGPathCreateMutable();
    _isHavePath = YES;
    CGPathMoveToPoint(_path, NULL, location.x, location.y);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    CGPathAddLineToPoint(_path, NULL, location.x, location.y);
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:_path];
    DrawModel *drawModel = [DrawModel viewModelWithColor:_lineColor Path:path Width:_lineWidth];
    [_pathArray addObject:drawModel];
    
    CGPathRelease(_path);
    _isHavePath = NO;
}
@end
