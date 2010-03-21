//
//  SwitchBorder.m
//  todo
//
//  Created by Ali Nour on 3/17/10.
//  Copyright 2010 BadrIT. All rights reserved.
//

#import "SwitchBorder.h"

@implementation SwitchBorder

@synthesize width;

- (id)initWithFrame:(CGRect)frame withBorderWidth:(int)borderWidth{
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		self.width = borderWidth;
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	[[UIColor darkGrayColor] setStroke];
	CGContextSetLineWidth(context, width);
	
	// Draw edges
	CGFloat w = rect.size.width;
	CGFloat h = rect.size.height;
	CGFloat radius = 2 * [CustomSwitch margin];
	
	
	CGContextMoveToPoint(context, radius, 0);
	CGContextAddArcToPoint(context, w, 0, w, floor(h/2), radius);
	CGContextAddArcToPoint(context, w, h, floor(w/2), h, radius);
	CGContextAddArcToPoint(context, 0, h, 0, floor(h/2), radius);
	CGContextAddArcToPoint(context, 0, 0, floor(w/2), 0, radius);
	CGContextStrokePath(context); //Drawing rounded rectangle
}

- (void)dealloc {
    [super dealloc];
}


@end
