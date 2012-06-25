DBPrefsWindowController
======

Originally created by [Dave Batton](http://www.mere-mortal-software.com/blog/details.php?d=2007-03-11).

Application preference windows aren’t difficult to create. Just create an NSWindowController, set up a toolbar, create a nib file with either a series of custom views, or with an NSTabView object. The problem is, just setting up the toolbar and view swapping mechanism takes a lot of code, and it’s basically the same for every application. Sounds like an excellent opportunity to create a new class.

![](https://github.com/kgn/DBPrefsWindowController/raw/master/prefswindow.png)

The goal of DBPrefsWindowController is to reduce the overhead of creating preference tabs to one line of code for each toolbar icon. This is achieved with an NSWindowController subclass named DBPrefsWindowController.

Using DBPrefsWindowController
------

If you’re comfortable with subclassing and working with Interface Builder, you’ll be able to figure out how to use it from the included example project. Basically you just subclass it and connect your .h file to a nib file of custom views. The nib file should be named *Preferences*. Then just call `-addView:label:` to specify which views to display and what labels to use:

    - (void)setupToolbar
    {
        [self addView:generalPreferenceView label:@"General"];
        [self addView:colorsPreferenceView label:@"Colors"];
        [self addView:playbackPreferenceView label:@"Playback"];
        [self addView:updatePreferenceView label:@"Update"];
        [self addView:advancedPreferenceView label:@"Advanced"];
    }

When setup this way, DBPrefsWindowController will look for image files with names that match the labels supplied here. If your application is localized, you can instead call `-addView:label:image:` to specify the images to use for the toolbar icons.

That’s really all there is to it. If you’ve already created a nib file with separate views for your preferences window, you can just use it instead of creating a new nib file. Either rename your nib file *Preferences*, or override the +nibName class method so it returns the name of your existing nib file.

Documentation
------

The DBPrefsWindowController class is designed to be subclassed for each application in which it is used. The subclass should be set as the File’s Owner for a nib file named “Preferences.” The subclass should have NSView instances which are IBOutlets connected to views in the nib file.

The nib file does not need to be connected to a window. If it is, it will be ignored and a new window will be created to display the preference views.

    + (DBPrefsWindowController *)sharedPrefsWindowController

This class method returns a shared instance of the DBPrefsWindowController class.

    + (NSString *)nibName

Override this class if you want to use a nib file named something other than *Preferences*.

    - (void)setupToolbar

Override this method with calls to `-addView:label:` or `-addView:label:image:` to populate the toolbar.

    - (void)addView:(NSView *)view label:(NSString *)label

Call this method as many times as needed from `-setupToolbar` to add new toolbar icons and custom views to the preferences window. An image with a name that matches the label should be available in the application bundle. It will be used as the toolbar icon.

    - (void)addView:(NSView *)view label:(NSString *)label image:(NSImage *)image

This method can be used instead of `-addView:label:` if the application is localized, or if you just want to use icons with names that differ from the toolbar button labels.

    - (IBAction)showWindow:(id)sender

Call this method to display the preferences window. For example: `[[AppPrefsWindowController sharedPrefsWindowController] showWindow:nil];`

    - (void)setCrossFade:(BOOL)fade`

Call this method to enable or disable the cross-fade effect when switching views. The default value is `YES`.

    - (void) setShiftSlowsAnimation:(BOOL)slow

Call this method to enable or disable the use of the shift key to slow down the animation when switching views. The default value is `YES`.

