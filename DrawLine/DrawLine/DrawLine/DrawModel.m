//
//  DrawModel.m
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "DrawModel.h"

@implementation DrawModel

+ (id)viewModelWithColor:(UIColor *)color Path:(UIBezierPath *)path Width:(CGFloat)width
{
    DrawModel *drawModel = [[DrawModel alloc] init];
    
    drawModel.color = color;
    drawModel.path = path;
    drawModel.width = width;
    
    return drawModel;
}

@end
