//
//  SwitchSlider.m
//
//  Created by Ali Nour on 3/17/10.
//  Copyright 2010 BadrIT. All rights reserved.
//

#import "SwitchSlider.h"
#import "CustomSwitch.h"
#import <QuartzCore/CAGradientLayer.h>

//static int borderWidth = 2;

@implementation SwitchSlider

@synthesize color;

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame color:[UIColor clearColor]];
}

- (id)initWithFrame:(CGRect)frame color:(UIColor*)sliderColor {
	if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];
		self.color = color;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	// Drawing gray rounded rectangle with glossy effect
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// Define clipping area
	CGPathRef path = CGPathCreateMutable();
	CGFloat width = rect.size.width;
	CGFloat height = rect.size.height;
	CGFloat radius = 2*[CustomSwitch margin];

	// Don't worry from these warnings :)
	CGPathMoveToPoint(path, NULL, 0, floor(height/2));
	
	CGPathAddArcToPoint(path, NULL, 0, 0, floor(width/2), 0, radius);
	CGPathAddArcToPoint(path, NULL, width, 0, width, floor(height/2), radius);
	CGPathAddArcToPoint(path, NULL, width, height, floor(width/2), height, radius);
	CGPathAddArcToPoint(path, NULL, 0, height, 0, floor(height/2), radius);

	CGContextAddPath(context, path);
	CGContextClip(context);
	
	[self.color setFill];
	CGContextAddPath(context, path);
	CGContextFillPath(context);
	
	// Draw glossy effect
	CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 1.0, 0.50,  // Start color
		1.0, 1.0, 1.0, 0.06 }; // End color
	
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
	
    CGRect currentBounds = self.bounds;
    CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
    CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
    CGContextDrawLinearGradient(context, glossGradient, topCenter, midCenter, 0);
	
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);
    CFRelease(path);
}


- (void)dealloc {
    [super dealloc];
}


@end
