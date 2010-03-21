//
//  CustomSwitch.h
//  todo
//
//  Created by Ali Nour on 3/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CAGradientLayer.h>
#import "GlossyLabel.h"
#import "SwitchSlider.h"
#import "SwitchBorder.h"


@protocol CustomSwitchDelegate

- (void)valueChanged:(BOOL)switchValue;

@end

@interface CustomSwitch : UIView {
	GlossyLabel *onLabel;
	GlossyLabel *offLabel;
	BOOL on;
	SwitchSlider *slider;
	id<CustomSwitchDelegate> delegate;
}

@property (nonatomic, retain) id<CustomSwitchDelegate> delegate;
@property BOOL on;

+ (int)margin;

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText;

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText
onLabelBackgroundColor:(UIColor *)onLabelBackgroundColor
offLabelBackgroundColor:(UIColor *)offLabelBackgroundColor
onLabelTextColor:(UIColor *)onLabelTextColor
offLabelTextColor:(UIColor *)offLabelTextColor
		sliderColor:(UIColor *)sliderColor;

- (void)setOnBackgroundColor:(UIColor *)color;
- (void)setOffBackgroundColor:(UIColor *)color;
- (void)setOnTextColor:(UIColor *)color;
- (void)setOffTextColor:(UIColor *)color;
- (void)setSliderColor:(UIColor *)color;

@end
