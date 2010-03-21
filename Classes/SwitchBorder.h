//
//  SwitchBorder.h
//  todo
//
//  Created by Ali Nour on 3/17/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSwitch.h"


@interface SwitchBorder : UIView {
	int width;
}

@property int width;

- (id)initWithFrame:(CGRect)frame withBorderWidth:(int)borderWidth;

@end
