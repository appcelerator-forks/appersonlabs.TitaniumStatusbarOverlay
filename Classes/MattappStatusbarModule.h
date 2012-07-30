/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"
#import "MTStatusBarOverlay.h"

@interface MattappStatusbarModule : TiModule <MTStatusBarOverlayDelegate>
{
    MTStatusBarOverlay *overlay;
    BOOL *overlayVisible;
}

@property (nonatomic) BOOL *overlayVisible;

@end
