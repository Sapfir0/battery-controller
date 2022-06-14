//
// MenuInfoView.swift
// Apple Juice
// https://github.com/raphaelhanneken/apple-juice
//

import SwiftUI

@available(OSX 11.0, *)
struct MenuInfoView: View {
    @StateObject private var model = MenuInfoViewModel()
    private var smallFontSize = CGFloat(12)

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .lastTextBaseline) {
                Text(model.powerSource)
                    .font(.system(size: 13, weight: .semibold))
                Text(model.remainingPercent)
                        .foregroundColor(.secondary)
                        .font(.system(size: 13, weight: .regular))
            }
            .padding(.bottom, 10)
            HStack(alignment: .top, spacing: 9) {
                Text("Power Source: \(model.powerSource)")
                    .font(.system(size: smallFontSize))
            }
            HStack(alignment: .top, spacing: 9) {
                Text("\(model.remainingTime) \(model.batteryService?.state == .chargedAndPlugged ? "" : "remaining")")
                        .font(.system(size: smallFontSize))
            }
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 15)
    }
}
