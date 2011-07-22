//
//  AppController.m
//


#import "AppController.h"
#import "AppPrefsWindowController.h"


@implementation AppController




+ (void)initialize
{
		// This is just for the demo. It's not needed by DBPrefsWindowController.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
		@"YES", @"openAtStartup",
		@"YES", @"fade",
		@"YES", @"shiftSlowsAnimation",
		nil];
	
    [defaults registerDefaults:appDefaults];
}




- (void)awakeFromNib
	// This is just for the demo. It's not needed by DBPrefsWindowController.
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults addObserver:self
			   forKeyPath:@"fade" 
				  options:NSKeyValueObservingOptionOld
				  context:NULL];
    [defaults addObserver:self
			   forKeyPath:@"shiftSlowsAnimation" 
				  options:NSKeyValueObservingOptionOld
				  context:NULL];
	
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"openAtStartup"])
		[self openPreferences:self];
}




- (void)dealloc
	// This is just for the demo. It's not needed by DBPrefsWindowController.
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObserver:self
				  forKeyPath:@"fade"];
    [defaults removeObserver:self
				  forKeyPath:@"shiftSlowsAnimation"];
	[super dealloc];
}




- (IBAction)openPreferences:(id)sender
{
	[[AppPrefsWindowController sharedPrefsWindowController] showWindow:nil];
	(void)sender;
}




- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object 
                        change:(NSDictionary *)change
                       context:(void *)context
	// This is just for the demo. It's not needed by DBPrefsWindowController.
{
	[[AppPrefsWindowController sharedPrefsWindowController] setCrossFade:[[NSUserDefaults standardUserDefaults] boolForKey:@"fade"]];
	[[AppPrefsWindowController sharedPrefsWindowController] setShiftSlowsAnimation:[[NSUserDefaults standardUserDefaults] boolForKey:@"shiftSlowsAnimation"]];

	(void)keyPath;
	(void)object;
	(void)change;
	(void)context;
}




@end
