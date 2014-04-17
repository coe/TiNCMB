/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComNiftyCloudMbIosModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import <NCMB/NCMB.h>

@implementation ComNiftyCloudMbIosModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"b8348aee-6693-4a82-888b-50ab2ecedd87";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.nifty.cloud.mb.ios";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
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

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world 3";
}

-(id)example2:(id)args
{
	// example method
	return @"hello world 4";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(void)NCMBKey:(id)args
{
    NSLog(@"args %@", args);
    NSString *applicationKey = args[0];
    NSString *clientKey = args[1];
    ENSURE_TYPE(applicationKey, NSString);
    ENSURE_TYPE(clientKey, NSString);
    [NCMB setApplicationKey:applicationKey clientKey:clientKey];
    return;
}

-(id)postKey:(id)args
{
    NSLog(@"args %@", args);
    NSString *className = args[0];
    
    NCMBObject *obj = [NCMBObject objectWithClassName:className];
    NSError *saveError = nil;
    for (NSString *key in [args[1] allKeys]) {
        NSString *value = [args[1] objectForKey:key];
        [obj setObject:value forKey:key];
    }
    [obj save:&saveError];
    if (saveError == nil) {
        NSLog(@"[SAVE] Done");
        return YES;
    } else {
        NSLog(@"[SAVE-ERROR] %@", saveError);
        return NO;
    }
}
@end
