//
//  SwitchSlider.h
//
//  Created by Ali Nour on 3/17/10.
//  Copyright 2010 BadrIT. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SwitchSlider : UIView {
	UIColor *color;
}

@property (assign) UIColor * color;

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color;
@end
