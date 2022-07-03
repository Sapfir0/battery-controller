//
// MenuInfoViewModel.swift
// Apple Juice
// https://github.com/raphaelhanneken/apple-juice
//

import Foundation

@available(OSX 11.0, *)
class MenuInfoViewModel: ObservableObject {
    @Published var powerSource = NSLocalizedString("Unknown", comment: "")
    @Published var remainingPercent = NSLocalizedString("Calculating", comment: "")
    @Published var remainingTime = NSLocalizedString("Unknown", comment: "")
    @Published var remainingPostfix = "remaining"

    @Published var batteryService: BatteryService?

    init() {
        do {
            batteryService = try BatteryService()
        } catch {
            batteryService = nil
        }

        update()

    NotificationCenter.default
            .addObserver(self,
                         selector: #selector(MenuInfoViewModel.powerSourceChanged(_:)),
                         name: NSNotification.Name(rawValue: powerSourceChangedNotification),
                         object: nil)
    }

    @objc public func powerSourceChanged(_: AnyObject) {
        update()
    }

    private func update() {
        guard let percentage = batteryService?.percentage,
              let timeRemaining = batteryService?.timeRemaining,
              let maxCapacity = batteryService?.capacity,
              let amperage = batteryService?.amperage,
              let powerSource = batteryService?.powerSource,
              let remainingPostfix = batteryService?.remainingPostfix
        else {
            return
        }

        self.remainingPostfix = remainingPostfix
        self.powerSource = powerSource.localizedDescription
        self.remainingPercent = percentage.formatted
        self.remainingTime = timeRemaining.formatted

    }
}
