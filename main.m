
#import <Cocoa/Cocoa.h>
#import <InputMethodKit/InputMethodKit.h>

//Each input method needs a unique connection name. 
//Note that periods and spaces are not allowed in the connection name.
const NSString* kConnectionName = @"Ridmik_Keyboard_Connection";

//let this be a global so our application controller delegate can access it easily
IMKServer*       server;

int main(int argc, char *argv[])
{
    
    NSString*       identifier;
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	//find the bundle identifier and then initialize the input method server
    identifier = [[NSBundle mainBundle] bundleIdentifier];
    server = [[IMKServer alloc] initWithName:(NSString*)kConnectionName bundleIdentifier:[[NSBundle mainBundle] bundleIdentifier]];
	
    //load the bundle explicitly because in this case the input method is a background only application 
	[NSBundle loadNibNamed:@"MainMenu" owner:[NSApplication sharedApplication]];
	
	//finally run everything
	[[NSApplication sharedApplication] run];
	
    [pool release];
    return 0;
}
