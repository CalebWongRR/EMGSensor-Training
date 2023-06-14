//
//  CheckBoxView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 14/6/2023.
//

import SwiftUI

struct CheckBoxView: View {
    
    let isChecked: Bool
    
    var body: some View {
//        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(.shadow(.inner(color: .accentColor, radius: 1)))
                    .foregroundColor(.white)
                if isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 100)
//            .frame(width: geometry.size.height)
//        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(isChecked: true)
    }
}
