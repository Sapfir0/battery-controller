//
// AppDelegate.swift
// Apple Juice
// https://github.com/raphaelhanneken/apple-juice
//

import Cocoa
import AppKit
import IOBluetooth
import AVFoundation

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_: Notification) {
        UserPreferences.registerDefaults()

        print("Bluetooth devices:")

        guard let devices = IOBluetoothDevice.pairedDevices() else {
            print("No devices")
            return
        }
        for item in devices {
            if let device = item as? IOBluetoothDevice {
                if (device.isConnected()) {
                    print("Name: \(device.name)")
                    print("\(device.addressString)")
                    print(device.isHandsFreeDevice)
                }

            }
        }

    }

    func applicationWillTerminate(_: Notification) {
        // Insert code here to tear down your application
    }

    // Post messages to the user notification center.
    func userNotificationCenter(_: NSUserNotificationCenter,
                                shouldPresentNotification _: NSUserNotification) -> Bool
    {
        true
    }
}
