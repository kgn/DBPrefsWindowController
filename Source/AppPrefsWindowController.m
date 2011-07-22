//
//  AppPrefsWindowController.m
//


#import "AppPrefsWindowController.h"


@implementation AppPrefsWindowController




- (void)setupToolbar
{
	[self addView:generalPreferenceView label:@"General"];
	[self addView:colorsPreferenceView label:@"Colors"];
	[self addView:playbackPreferenceView label:@"Playback"];
	[self addView:updatesPreferenceView label:@"Updates"];
	[self addView:advancedPreferenceView label:@"Advanced"];
	
		// Optional configuration settings.
	[self setCrossFade:[[NSUserDefaults standardUserDefaults] boolForKey:@"fade"]];
	[self setShiftSlowsAnimation:[[NSUserDefaults standardUserDefaults] boolForKey:@"shiftSlowsAnimation"]];
}




@end
