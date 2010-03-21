//
//  background.m
//  todo
//
//  Created by Ali Nour on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GlossyLabel.h"
#import <math.h>


@implementation GlossyLabel

- (id)initWithFrame:(CGRect)frame {
	return [self initWithFrame:frame backgroundColor:[UIColor greenColor]];
}

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.backgroundColor = color;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	[super drawRect:rect];
	
	// Get the current graphics context.
	CGContextRef context = UIGraphicsGetCurrentContext();

	// Glossy effect
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 1.0, 0.50,  // Start color
		1.0, 1.0, 1.0, 0.06 }; // End color
	
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
	
    CGRect currentBounds = self.bounds;
    CGPoint buttomCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMaxY(currentBounds));
    CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
    CGContextDrawLinearGradient(context, glossGradient, buttomCenter, midCenter, 0);
	
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);
	
}


- (void)dealloc {
    [super dealloc];
}


@end
