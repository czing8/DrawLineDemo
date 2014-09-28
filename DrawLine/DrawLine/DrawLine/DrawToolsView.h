//
//  DrawToolsView.h
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BrushColorView.h"
#import "BrushWidthView.h"

@interface DrawToolsView : UIView

- (id)initWithFrame:(CGRect)frame brushColor:(BrushColorBlock)brushColor brushColor:(BrushWidthBlock)brushWidth;

@end
