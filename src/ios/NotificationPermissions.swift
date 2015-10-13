//
//  NotificationPermissions.swift
//  NotificationPermissions
//
//  Created by James Hunter on 14/09/2015.
//  Copyright (c) 2015 JADH. All rights reserved.
//

@objc(NotificationPermissions) class NotificationPermissions : CDVPlugin {
    func checkStatus(command: CDVInvokedUrlCommand) {
        let application = UIApplication.sharedApplication()
        var status: Bool

        if #available(iOS 8.0, *) {
            status = application.isRegisteredForRemoteNotifications()
        } else {
            let enabledNotifications = application.enabledRemoteNotificationTypes()
            status = notNone(enabledNotifications)
        }

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsBool: status)
        self.commandDelegate!.sendPluginResult(pluginResult, callbackId: command.callbackId)
    }
    
    private func notNone(enabledNotifications: UIRemoteNotificationType) -> Bool {
        return enabledNotifications != UIRemoteNotificationType.None &&
               enabledNotifications != UIRemoteNotificationType.NewsstandContentAvailability
    }
}