//
//  ModeView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI
import EmgsModelFramework

struct ModeView: View {
    
    @ObservedObject public var viewModel: EmgsViewModel
    
    @State public var navMonitor: Bool = false
    @State public var navUFOGame: Bool = false
    @State public var navHandTraining: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            ButtonFixedView(text: "Monitor", image: nil, action: { navMonitor = true }, dismiss: nil)
                .navigationDestination(isPresented: $navMonitor, destination: {
                    SubView { MonitorView(viewModel: viewModel) }
                })
            ButtonFixedView(text: "UFO Game", image: nil, action: { navUFOGame = true }, dismiss: nil)
                .navigationDestination(isPresented: $navUFOGame, destination: {
                    SubView { UFOGameView(viewModel: viewModel) }
                })
            ButtonFixedView(text: "HandTraining", image: nil, action: { navHandTraining = true }, dismiss: nil)
                .navigationDestination(isPresented: $navHandTraining, destination: {
                    SubView { HandTrainingView(viewModel: viewModel) }
                })
            Spacer()
        }
    }
}

struct ModeView_Previews: PreviewProvider {
    static var previews: some View {
        ModeView(viewModel: EmgsViewModel())
    }
}
