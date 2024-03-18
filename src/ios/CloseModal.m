/********* CloseModal.m Cordova Plugin Implementation *******/
#import <Cordova/CDV.h>
#import "CloseModal.h"

@implementation CloseModal

- (void)close:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    // 疎通用コード
    // NSString* echo = [command.arguments objectAtIndex:0];

    // if (echo != nil && [echo length] > 0) {
    //     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    // } else {
    //     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    // }

 
   NSString*  callbackId = command.callbackId;

   UIViewController *presentingViewController = self.viewController;
 
  // とりあえず、ファイルプレビュー(fileopen2)に限定
	if (presentingViewController.view.window != [UIApplication sharedApplication].keyWindow) {
		presentingViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
	}

    while (presentingViewController.presentedViewController != nil && ![presentingViewController.presentedViewController isBeingDismissed]) {
      presentingViewController = presentingViewController.presentedViewController;
    }
    // 閉じます
    if(presentingViewController != nil) {
      [presentingViewController dismissViewControllerAnimated:YES completion:nil];
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"modale is closed"];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
      return;
    }

   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"no modale is closed"];
   [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];


 }

@end
