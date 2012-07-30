/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "MattappStatusbarModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation MattappStatusbarModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"fe250909-701e-42de-b7e6-331a9ebbcd62";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"mattapp.statusbar";
}

#pragma mark Lifecycle

-(void)startup
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self loadingOverlay];}, YES);
	} else {
        [self loadingOverlay];
    }

	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
}

-(void)loadingOverlay
{
    overlay = [MTStatusBarOverlay sharedInstance];
    overlay.delegate = self;
    overlay.animation = MTStatusBarOverlayAnimationShrink;
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

// shows only the given message - no activity indicator
-(void)postMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postMessage:args];}, YES);
	}
    
    overlay.hidesActivity = YES;

    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        [overlay postMessage: [args objectAtIndex:0] duration:duration];
    } else {
        [overlay postMessage: [args objectAtIndex:0]];
    }
}

// clears the message queue and shows this message instantly
-(void)postImmediateMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postImmediateMessage:args];}, YES);
	}
    
    overlay.hidesActivity = YES;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        [overlay postImmediateMessage: [args objectAtIndex:0] duration:duration];
    } else {
        NSLog(@"[Error] postImmediateMessage requires a message AND a duration");
    }
}

// shows an activity indicator and the given message
-(void)postMessageInProgress:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postMessageInProgress:args];}, YES);
	}
        
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        [overlay postMessage: [args objectAtIndex:0] duration:duration];
    } else {
        [overlay postMessage: [args objectAtIndex:0]];
    }  
}

// clears the message queue and shows this message instantly
-(void)postImmediateMessageInProgress:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postImmediateMessageInProgress:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        [overlay postMessage: [args objectAtIndex:0] duration:duration];
    } else {
        [overlay postMessage: [args objectAtIndex:0]];
    }  
}

// shows a checkmark instead of the activity indicator and hides the status bar after the specified duration
-(void)postFinishMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postFinishMessage:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        [overlay postFinishMessage: [args objectAtIndex:0] duration:duration];
    } else {
        NSLog(@"[Error] postFinishMessage requires a message AND a duration");
    }    
}

// clears the message queue and shows this message instantly
-(void)postImmediateFinishMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postImmediateFinishMessage:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        
        [overlay postImmediateFinishMessage: [args objectAtIndex:0] duration:duration animated:YES];
    } else {
        NSLog(@"[Error] postImmediateFinishMessage requires a message AND a duration");
    }
}


// shows a error-sign instead of the activity indicator and hides the status bar after the specified duration
-(void)postErrorMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postErrorMessage:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        
        [overlay postErrorMessage: [args objectAtIndex:0] duration:duration];
    } else {
        NSLog(@"[Error] postErrorMessage requires a message AND a duration");
    }
}

// clears the message queue and shows this message instantly
-(void)postImmediateErrorMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postImmediateErrorMessage:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        
        [overlay postImmediateErrorMessage: [args objectAtIndex:0] duration:duration animated:YES];
    } else {
        NSLog(@"[Error] postImmediateErrorMessage requires a message AND a duration");
    }
}

-(void)hide:(id)arg
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self hide:arg];}, YES);
	}
    
    [overlay hideTemporary];
}

-(void)stop:(id)arg
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self stop:arg];}, YES);
	}
    
    [overlay hide];
}

-(void)show:(id)arg
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self show:arg];}, YES);
	}
    
    [overlay show];
}
@end
