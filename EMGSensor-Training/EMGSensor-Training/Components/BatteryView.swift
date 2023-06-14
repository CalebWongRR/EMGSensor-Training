//
//  BatteryView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 13/6/2023.
//

import SwiftUI

struct BatteryView: View {
    
    let progress: Double
    let fill: Color = .green
    let outline: Color = .black
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack {
            Image(systemName: "battery.0")
                .resizable()
                .scaledToFit()
                .font(.headline.weight(.ultraLight))
                .foregroundColor(outline)
                .background(
                    Rectangle()
                        .fill(fill)
                        .scaleEffect(x: progress / 100, y: 1, anchor: .leading)
                )
                .mask(
                    Image(systemName: "battery.100")
                        .resizable()
                        .font(.headline.weight(.ultraLight))
                        .scaledToFit()
                )
                .frame(width: 50)
            
            Text("\(Int(progress))%")
                .foregroundColor(.primary)
                .animation(nil)
                .opacity(opacity)

        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    self.opacity = 1
                }
            }
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView(progress: 70)
    }
}
