//
//  ButtonFixedView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI

struct ButtonFixedView: View {
    
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
        .padding(.vertical, 8.0)
        .frame(minWidth: 200)
        .background(Color("AccentColorAnti"))
        .padding(5.0)
    }
}

struct ButtonFixedView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea(.all, edges: .horizontal)
                .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                ButtonFixedView(text: nil, image: "arrowshape.turn.up.backward.fill", action: { print("go back!") }, dismiss: nil)
                ButtonFixedView(text: "Back", image: nil, action: { print("Hello World!") }, dismiss: nil)
                ButtonFixedView(text: "Back", image: "arrowshape.turn.up.backward.fill", action: { print("go back!") }, dismiss: nil)
            }
        }
    }
}
