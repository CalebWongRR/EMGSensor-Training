//
//  CounterCircleView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 13/6/2023.
//

import SwiftUI

struct CounterCircleView: View {
    
    let progress: Double
    
    let ringDiameter = 25.0
    
    private var rotationAngle: Angle {
        return Angle(degrees: (360.0 * progress))
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(.gray, lineWidth: ringDiameter / 10)
                Circle()
                    .fill(Color.white)
                    .frame(width: ringDiameter)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(.cyan, style: StrokeStyle(lineWidth: ringDiameter)
                    )
                    .rotationEffect(Angle(degrees: -90))
                    .scaleEffect(0.5)

            }
            .frame(width: ringDiameter, height: ringDiameter)
        }
    }
}

struct CounterCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CounterCircleView(progress: 0.7)
    }
}
