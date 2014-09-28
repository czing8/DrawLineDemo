//
//  BrushWIdthView.h
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BrushWidthBlock)(float width);

@interface BrushWidthView : UIView

- (id)initWithFrame:(CGRect)frame brushWidth:(BrushWidthBlock)brushWidth;

@end
