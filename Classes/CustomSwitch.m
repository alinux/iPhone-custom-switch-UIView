//
//  CustomSwitch.m
//  
//  Created by Ali Nour on 3/10/10.
//  Copyright 2010 BadrIT. All rights reserved.
//

#import "CustomSwitch.h"

static int margin = 4;

@implementation CustomSwitch

@synthesize delegate, on;

+ (int)margin {
	return margin;
}

- (void)setOn:(BOOL)switchValue {
	if (on != switchValue) {
		on = switchValue;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.2];
		if (on) {
			CGRect tmpFrame;
			tmpFrame = onLabel.frame;
			tmpFrame.origin.x = 0;
			onLabel.frame = tmpFrame;
		
			tmpFrame = slider.frame;
			tmpFrame.origin.x = onLabel.frame.size.width - margin;
			slider.frame = tmpFrame;
		
			tmpFrame = offLabel.frame;
			tmpFrame.origin.x = slider.frame.origin.x + slider.frame.size.width - margin;
			offLabel.frame = tmpFrame;
		
		} else {
			CGRect tmpFrame = onLabel.frame;
			tmpFrame.origin.x = -tmpFrame.size.width + margin;
			onLabel.frame = tmpFrame;
		
			tmpFrame = slider.frame;
			tmpFrame.origin.x = 0;
			slider.frame = tmpFrame;
		
			tmpFrame = offLabel.frame;
			tmpFrame.origin.x = slider.frame.origin.x + slider.frame.size.width - margin;
			offLabel.frame = tmpFrame;
		
		}
		[delegate valueChanged:on];
		[UIView commitAnimations];
	}
}

- (id)initWithFrame:(CGRect)frame {
	return [self initWithFrame:frame onLabelText:@"YES" offLabelText:@"NO"];
}

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText {
	return [self initWithFrame:frame
				   onLabelText:onLabelText
				  offLabelText:offLabelText
		onLabelBackgroundColor:[UIColor greenColor]
	   offLabelBackgroundColor:[UIColor redColor]
			  onLabelTextColor:[UIColor whiteColor]
			 offLabelTextColor:[UIColor whiteColor]
				   sliderColor:[UIColor blackColor]];
}

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText
onLabelBackgroundColor:(UIColor *)onLabelBackgroundColor
offLabelBackgroundColor:(UIColor *)offLabelBackgroundColor
   onLabelTextColor:(UIColor *)onLabelTextColor
  offLabelTextColor:(UIColor *)offLabelTextColor
		sliderColor:(UIColor *)sliderColor {
	
	if (self = [super initWithFrame:frame]) {
		
		// Initialization code
		UIFont *font = [UIFont boldSystemFontOfSize:16];
		int labelWidth = 10 + MAX([onLabelText sizeWithFont:font].width, [offLabelText sizeWithFont:font].width);
		int height  = 27;
		
		slider = [[SwitchSlider alloc] initWithFrame:CGRectMake(0, 0, 30, height)];
		slider.color = sliderColor;
		
		onLabel = [[GlossyLabel alloc]
				   initWithFrame:CGRectMake(-labelWidth + margin, 0, labelWidth, height)];
		onLabel.backgroundColor = onLabelBackgroundColor;
		onLabel.textColor = onLabelTextColor;
		onLabel.font = font;
		onLabel.textAlignment = UITextAlignmentCenter;
		onLabel.text = onLabelText;
		[self addSubview:onLabel];
		
		offLabel = [[GlossyLabel alloc]
					initWithFrame:CGRectMake(slider.frame.size.width - margin, 0,
											 labelWidth, height)]; 
		offLabel.backgroundColor = offLabelBackgroundColor;
		offLabel.textColor = offLabelTextColor;
		offLabel.text = offLabelText;
		offLabel.textAlignment = UITextAlignmentCenter;
		offLabel.font = font;
		[self addSubview:offLabel];
		
		[self addSubview:slider];
		
		// Setup the view frame and attributes
		CGRect tmpFrame = self.frame;
		tmpFrame.size.width = labelWidth + slider.frame.size.width - margin;
		tmpFrame.size.height = height;
		self.frame = tmpFrame;
		self.clipsToBounds = YES;
		self.layer.cornerRadius = 2 * margin;
		
		tmpFrame.origin.x = 0;
		tmpFrame.origin.y = 0;
		
		// Subview to draw the border.
		SwitchBorder *border = [[SwitchBorder alloc] initWithFrame:tmpFrame withBorderWidth:2];
		[self addSubview:border];
		[border release];
		
    }
    return self;
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	// Does nothing, just to consume the event.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	self.on = !self.on;
}

- (void)setOnBackgroundColor:(UIColor *)color {
	onLabel.backgroundColor = color;
	[onLabel setNeedsDisplay];
}

- (void)setOffBackgroundColor:(UIColor *)color {
	offLabel.backgroundColor = color;
	[offLabel setNeedsDisplay];
}

- (void)setOnTextColor:(UIColor *)color {
	onLabel.textColor = color;
	[onLabel setNeedsDisplay];
}

- (void)setOffTextColor:(UIColor *)color {
	offLabel.textColor = color;
	[offLabel setNeedsDisplay];
}

- (void)setSliderColor:(UIColor *)color {
	slider.color = color;
	[slider setNeedsDisplay];
}


- (void)dealloc {
	
	self.delegate = nil;
	
	[slider release];
	[onLabel release];
	[offLabel release];
	[super dealloc];
}


@end
