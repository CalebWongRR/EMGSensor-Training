//
//  SliderRectanglePlusView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 13/6/2023.
//

import SwiftUI

struct SliderRectanglePlusView: View {
    let length: Double
    let height: Double = 25
    
    @ObservedObject var sliderControlOne: SliderControl
    @ObservedObject var sliderControlTwo: SliderControl
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.gray)
                ZStack {
                    Circle()
                        .fill(.shadow(.inner(color: .accentColor, radius: 2)))
                        .foregroundColor(.white)
                        .gesture(
                            DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                                .onChanged() { value in
                                    let maxPositiveMovement: Double = sliderControlTwo.currentPosition - sliderControlOne.currentPosition
                                    if value.distanceX / length > maxPositiveMovement {
                                        sliderControlOne.movement = maxPositiveMovement
                                    } else {
                                        sliderControlOne.movement = value.distanceX / length
                                    }
                                }
                                .onEnded { value in
                                    sliderControlOne.stopMove()
                                }
                        )
                        .offset(x: -length / 2 + sliderControlOne.newPosition * length - height / 2)
                    Circle()
                        .fill(.shadow(.inner(color: .accentColor, radius: 2)))
                        .foregroundColor(.white)
                        .gesture(
                            DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                                .onChanged() { value in
                                    let maxNegativeMovement: Double = sliderControlOne.currentPosition - sliderControlTwo.currentPosition
                                    if value.distanceX / length < maxNegativeMovement {
                                        sliderControlTwo.movement = maxNegativeMovement
                                    } else {
                                        sliderControlTwo.movement = value.distanceX / length
                                    }
                                }
                                .onEnded { value in
                                    sliderControlTwo.stopMove()
                                }
                        )
                        .offset(x: -length / 2 + sliderControlTwo.newPosition * length + height / 2)
                    
                    Rectangle()
                        .fill(.shadow(.inner(color: .accentColor, radius: 2)))
                        .foregroundColor(.white)
                        .scaleEffect(x: sliderControlTwo.newPosition - sliderControlOne.newPosition, y: 1, anchor: .leading)
                        .offset(x: sliderControlOne.newPosition * length)
                        .gesture(
                            DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                                .onChanged() { value in
                                    let maxPositiveMovement: Double = 1 - sliderControlTwo.currentPosition
                                    let maxNegativeMovement: Double = -sliderControlOne.currentPosition
                                    if value.distanceX / length < maxNegativeMovement {
                                        sliderControlOne.movement = maxNegativeMovement
                                        sliderControlTwo.movement = maxNegativeMovement
                                    } else if value.distanceX / length > maxPositiveMovement {
                                        sliderControlOne.movement = maxPositiveMovement
                                        sliderControlTwo.movement = maxPositiveMovement
                                    } else {
                                        sliderControlOne.movement = value.distanceX / length
                                        sliderControlTwo.movement = value.distanceX / length
                                    }
                                }
                                .onEnded { value in
                                    sliderControlOne.stopMove()
                                    sliderControlTwo.stopMove()
                                }
                        )
                }
            }
            .frame(width: length, height: height)
        }
    }
}

struct SliderRectanglePlusView_Previews: PreviewProvider {
    static var previews: some View {
        SliderRectanglePlusView(length: 300.0, sliderControlOne: SliderControl(currentPosition: 0.3, min: 0, max: 1), sliderControlTwo: SliderControl(currentPosition: 0.7, min: 0, max: 1))
        
    }
}
