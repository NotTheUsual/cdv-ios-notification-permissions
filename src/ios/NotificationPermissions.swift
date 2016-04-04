//
//  NotificationPermissions.swift
//  NotificationPermissions
//
//  Created by James Hunter on 14/09/2015.
//  Copyright (c) 2015 JADH. All rights reserved.
//

@objc(NotificationPermissions) class NotificationPermissions : CDVPlugin {
    func checkStatus(command: CDVInvokedUrlCommand) {
        commandDelegate!.runInBackground { [unowned self] in
            let application = UIApplication.sharedApplication()
            let isRegistered = application.isRegisteredForRemoteNotifications()
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsBool: isRegistered)
            self.commandDelegate!.sendPluginResult(pluginResult, callbackId: command.callbackId)
        }
    }
}
