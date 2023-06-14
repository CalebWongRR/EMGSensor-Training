//
//  ConnectionView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI
import EmgsModelFramework

struct ConnectionView: View {
    
    @ObservedObject public var viewModel: EmgsViewModel
    
    @AppStorage("language") private var language: Language = .chi
    
    @State public var navMode: Bool = false
    
    var body: some View {
        ZStack {
            Color("LightGray")
                .ignoresSafeArea(.all, edges: .horizontal)
                .ignoresSafeArea(.all, edges: .bottom)
            GeometryReader { geometry in
                
                VStack {
                    HStack {
                        ButtonView(text: "Scan", image: nil, action: { print("Scanning") }, dismiss: nil)
                            .padding(.horizontal)
                        Spacer()
                        Text("Scanning")
                            .padding(.horizontal)
                    }
                    .padding(.top, 5)
                    .frame(height: 35)
                    Divider()
                    ScrollView(showsIndicators: true) {
                        VStack {
                            EmgsView(viewModel: viewModel, mac: "AA:AA")
                            EmgsView(viewModel: viewModel, mac: "AA:AA")
                            EmgsView(viewModel: viewModel, mac: "AA:AA")
                            EmgsView(viewModel: viewModel, mac: "AA:AA")
                            EmgsView(viewModel: viewModel, mac: "AA:AA")
                        }
                        .padding(.horizontal)
                    }
                    ButtonView(text: "Start", image: nil, action: { navMode = true }, dismiss: nil)
                        .navigationDestination(isPresented: $navMode, destination: {
                            SubView { ModeView(viewModel: viewModel) }
                        })
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Image("RRLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width / 3.5)
                    }
                    ToolbarItem(placement: .principal) {
                        AppNameView()
                    }
                    ToolbarItem(placement: .automatic) {
                        HStack {
                            Picker("Language", selection: $language) {
                                ForEach(Language.allCases){
                                    Text($0.rawValue).tag($0)
                                }
                            }
                            Image(systemName: "chevron.down")
                            Spacer()
                        }
                        .padding(1.0)
                        .border(.gray, width: 2.0)
                    }
                    
                }
            }
        }
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView(viewModel: EmgsViewModel())
    }
}
