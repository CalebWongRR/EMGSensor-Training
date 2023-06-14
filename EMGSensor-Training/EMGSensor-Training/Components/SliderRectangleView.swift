//
//  SliderRectangleView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 13/6/2023.
//

import SwiftUI

struct SliderRectangleView: View {
    
    let length: Double
    let step: Int
    
    @ObservedObject var sliderControl: SliderControl
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
            Rectangle()
                .fill(.shadow(.inner(color: .accentColor, radius: 1)))
                .foregroundColor(.white)
                .scaleEffect(x: sliderControl.newPosition, y: 1, anchor: .leading)
            Circle()
                .fill(.shadow(.inner(color: .accentColor, radius: 1)))
                .foregroundColor(.white)
                .scaleEffect(1.5)
                .gesture(
                    DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                        .onChanged() { value in
                            sliderControl.movement = round(value.distanceX / length * Double(step)) / Double(step)
                        }
                        .onEnded { value in
                            sliderControl.stopMove()
                        }
                )
                .offset(x: -length / 2 + sliderControl.newPosition * length)
        }
        .frame(width: length, height: 20)
    }
}

extension DragGesture.Value {
    var distanceX: CGFloat {
        return (self.location.x - self.startLocation.x)
    }
}

struct SliderRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        SliderRectangleView(length: 300.0, step: 3, sliderControl: SliderControl(currentPosition: 0.4, min: 0.01, max: 1))
    }
}
