//
//  AppPrefsWindowController.h
//

#import <Cocoa/Cocoa.h>
#import "DBPrefsWindowController.h"

@interface AppPrefsWindowController : DBPrefsWindowController

@property (strong, nonatomic) IBOutlet NSView *generalPreferenceView;
@property (strong, nonatomic) IBOutlet NSView *colorsPreferenceView;
@property (strong, nonatomic) IBOutlet NSView *playbackPreferenceView;
@property (strong, nonatomic) IBOutlet NSView *updatesPreferenceView;
@property (strong, nonatomic) IBOutlet NSView *advancedPreferenceView;

@end
