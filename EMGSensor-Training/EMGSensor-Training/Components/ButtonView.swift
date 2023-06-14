//
//  ButtonView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI

struct ButtonView: View {
    
    public let text: String?
    public let image: String?
    public let action: () -> Void?
    
    public let dismiss: DismissAction?
    
    var body: some View {
        Button {
            action()
            if let dismiss = dismiss {
                dismiss()
            }
        } label: {
            if let image = image {
                Image(systemName: image)
            }
            if let text = text {
                Text(text)
            }
        }
        .padding(.vertical, 5.0)
        .padding(.horizontal, 20.0)
        .background(Color("AccentColorAnti"))
        .padding(3.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea(.all, edges: .horizontal)
                .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                ButtonView(text: nil, image: "arrowshape.turn.up.backward.fill", action: { print("go back!") }, dismiss: nil)
                ButtonView(text: "Back", image: nil, action: { print("Hello World!") }, dismiss: nil)
                ButtonView(text: "Back", image: "arrowshape.turn.up.backward.fill", action: { print("go back!") }, dismiss: nil)
            }
        }
    }
}
