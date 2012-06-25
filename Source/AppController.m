//
//  AppController.m
//

#import "AppController.h"
#import "AppPrefsWindowController.h"

@implementation AppController

+ (void)initialize{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"YES", @"openAtStartup",
                                 @"YES", @"fade",
                                 @"YES", @"shiftSlowsAnimation",
                                 nil];
    [defaults registerDefaults:appDefaults];
}

- (void)awakeFromNib{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults addObserver:self
               forKeyPath:@"fade"
                  options:NSKeyValueObservingOptionOld
                  context:NULL];
    [defaults addObserver:self
               forKeyPath:@"shiftSlowsAnimation"
                  options:NSKeyValueObservingOptionOld
                  context:NULL];
	if([[NSUserDefaults standardUserDefaults] boolForKey:@"openAtStartup"]){
		[self openPreferences:self];
    }
}

- (void)dealloc{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObserver:self forKeyPath:@"fade"];
    [defaults removeObserver:self forKeyPath:@"shiftSlowsAnimation"];
}

- (IBAction)openPreferences:(id)sender{
	[[AppPrefsWindowController sharedPrefsWindowController] showWindow:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
	[[AppPrefsWindowController sharedPrefsWindowController] setCrossFade:[[NSUserDefaults standardUserDefaults] boolForKey:@"fade"]];
	[[AppPrefsWindowController sharedPrefsWindowController] setShiftSlowsAnimation:[[NSUserDefaults standardUserDefaults] boolForKey:@"shiftSlowsAnimation"]];
}

@end
