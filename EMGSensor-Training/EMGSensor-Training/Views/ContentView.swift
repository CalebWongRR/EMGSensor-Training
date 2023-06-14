//
//  ContentView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI
import EmgsModelFramework

struct ContentView: View {
    
    @StateObject private var viewModel: EmgsViewModel = EmgsViewModel()
    
    @State private var isRedirect: Bool = false
    
    var body: some View {
        NavigationStack {

            VStack {
                Image("AppLogo")
                .navigationDestination(isPresented: $isRedirect, destination: {
//                    SubView { ConnectionView(viewModel: viewModel) }
                    ConnectionView(viewModel: viewModel)
                })
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    isRedirect = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
