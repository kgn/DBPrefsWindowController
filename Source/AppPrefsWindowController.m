//
//  AppPrefsWindowController.m
//

#import "AppPrefsWindowController.h"

@implementation AppPrefsWindowController

- (void)setupToolbar{
    [self addView:self.generalPreferenceView label:@"General"];
    [self addView:self.colorsPreferenceView label:@"Colors"];
    [self addView:self.playbackPreferenceView label:@"Playback"];
    [self addView:self.updatesPreferenceView label:@"Updates"];
    [self addFlexibleSpacer];
    [self addView:self.advancedPreferenceView label:@"Advanced"];

    // Optional configuration settings.
    [self setCrossFade:[[NSUserDefaults standardUserDefaults] boolForKey:@"fade"]];
    [self setShiftSlowsAnimation:[[NSUserDefaults standardUserDefaults] boolForKey:@"shiftSlowsAnimation"]];
}

@end
