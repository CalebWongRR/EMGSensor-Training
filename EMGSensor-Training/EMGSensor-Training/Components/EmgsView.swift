//
//  EmgsView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI
import EmgsModelFramework

struct EmgsView: View {
    
    @ObservedObject public var viewModel: EmgsViewModel
    
    public let mac: String
    
    var body: some View {
        
//        if let device = viewModel.connectedDevices.first(where: {$0.mac == mac}){
            
            VStack {
                ZStack {
                    HStack {
                        Text("Emgs")
                        Spacer()
                        Image(systemName: "trash")
                    }
                    HStack {
                        Text("EE:68:12:34:56:78")
                            .padding(.horizontal, 20)
                        BatteryView(progress: 70)
                            .padding(.horizontal, 20)
                    }
                    
                }
                .padding(.bottom, 5)
                ZStack {
                    HStack {
                        ButtonView(text: "Connect", image: nil, action: { print("connecting") }, dismiss: nil)
                        ButtonView(text: "Streaming", image: nil, action: { print("connecting") }, dismiss: nil)
                        Spacer()
                    }
                    HStack{
                       Text("Device GG")
                    }
                }
            }
            .padding(10.0)
            .padding(.horizontal, 10.0)
            .background(Color("XLightGray"))
            .cornerRadius(10)
        }
//    }
}

struct EmgsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea(.all, edges: .horizontal)
                .ignoresSafeArea(.all, edges: .bottom)
            
            EmgsView(viewModel: EmgsViewModel(), mac: "AB:12")
        }
    }
}
