//
//  SubView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI

struct SubView<Content: View>: View {
    
    @ViewBuilder public var content: Content
    
    @AppStorage("language") private var language: Language = .chi
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("LightGray")
                .ignoresSafeArea(.all, edges: .horizontal)
                .ignoresSafeArea(.all, edges: .bottom)
            
            GeometryReader { geometry in
                ZStack (alignment: .topLeading) {
                    HStack {
                        Spacer()
                        content
                            .padding(.top, 10)
                        Spacer()
                    }
                    ButtonView(text: nil, image: "arrowshape.turn.up.backward.fill", action: { nil }, dismiss: self.dismiss)
                        .padding(.horizontal)
                        .padding(.top, 5)
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

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(content: {
            Text("Hello World!")
        })
    }
}
