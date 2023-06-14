//
//  AppNameView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI

struct AppNameView: View {
    var body: some View {
        VStack {
            Text("EMG Sensor Training")
            Text("v0.0.1")
                .font(.caption)
        }

    }
}

struct AppNameView_Previews: PreviewProvider {
    static var previews: some View {
        AppNameView()
    }
}
