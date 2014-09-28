//
//  BrushColorView.h
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BrushColorBlock)(UIColor * color);

@interface BrushColorView : UIView

- (id)initWithFrame:(CGRect)frame brushColor:(BrushColorBlock)brushColor;

@end
