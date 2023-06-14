//
//  UFOGameView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI
import EmgsModelFramework

struct UFOGameView: View {
    
    @ObservedObject public var viewModel: EmgsViewModel
    
    @State var emgData: Double = 30000
    
    @State var navStartGame: Bool = false
    
    @StateObject var sliderControlEmgRange: SliderControl = SliderControl(currentPosition: 0.01, min: 0.01, max: 1)
    @StateObject var sliderControlThresholdOne: SliderControl = SliderControl(currentPosition: 0.2, min: 0, max: 1)
    @StateObject var sliderControlThresholdTwo: SliderControl = SliderControl(currentPosition: 0.8, min: 0, max: 1)
    @StateObject var sliderControlDuration: SliderControl = SliderControl(currentPosition: 0, min: 0, max: 1)
    @StateObject var sliderControlTrigger: SliderControl = SliderControl(currentPosition: 0, min: 0, max: 1)
    @StateObject var sliderControlRelax: SliderControl = SliderControl(currentPosition: 0, min: 0, max: 1)
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ButtonView(text: "Start", image: nil, action: { navStartGame = true }, dismiss: nil)
                    .navigationDestination(isPresented: $navStartGame, destination: {
                        SubView { UFOGameView(viewModel: viewModel) }
                    })
                    .padding(.horizontal)
            }
            .frame(height: 25)
            Divider()
            ScrollView {
                VStack {
                    HStack {
                        Text("EMG Range")
                        Spacer()
                    }
                    VStack {
                        GeometryReader { geometry in
                            ZStack {
                                Rectangle()
                                Rectangle()
                                    .fill(.green)
                                    .scaleEffect(x: emgData / 65536, y: 1, anchor: .leading)
                                    .padding(2)
                                Rectangle()
                                    .foregroundColor(.yellow.opacity(0.8))
                                    .frame(width: 10)
                                    .offset(x: ( sliderControlThresholdOne.newPosition - 0.5 ) * geometry.size.width)
                                Rectangle()
                                    .foregroundColor(.blue.opacity(0.8))
                                    .frame(width: 10)
                                    .offset(x: ( sliderControlThresholdTwo.newPosition - 0.5 ) * geometry.size.width)
                                
                            }
                        }
                        .frame(height: 20.0)
                        HStack {
                            Text("0")
                            Spacer()
                            Text("\(emgData, specifier: "%.0f")")
                            Spacer()
                            Text("65,536")
                        }
                        .font(.callout)
                        HStack {
                            GeometryReader { geometry in
                                SliderRectangleView(length: geometry.size.width, step: 100, sliderControl: sliderControlEmgRange)
                            }
                            .frame(height: 20)
                            .padding(.leading, 20.0)
                            HStack {
                                Spacer()
                                Text("\(Int((sliderControlEmgRange.newPosition) * 100)).0")
                                    .padding(.leading, 20.0)
                            }
                            .frame(width: 80)
                        }
                    }
                    .padding()
                    .border(.gray, width: 2)
                    
                    HStack {
                        Text("Threshold")
                        Spacer()
                    }
                    VStack {

                        GeometryReader { geometry in
                            VStack {
                                SliderRectanglePlusView(length: geometry.size.width, sliderControlOne: sliderControlThresholdOne, sliderControlTwo: sliderControlThresholdTwo)
                            }
                        }
                        .frame(height: 20)
                        .padding(.horizontal, 20.0)
                        .padding(.bottom, 10.0)

                        HStack {
                            Text("Low \(sliderControlThresholdOne.newPosition * 100, specifier: "%.0f")%")
                            Spacer()
                            Text("High \(sliderControlThresholdTwo.newPosition * 100, specifier: "%.0f")%")
                        }
                        .padding(.horizontal, 40.0)
                    }
                    .padding()
                    .border(.gray, width: 2)
                    
                    HStack {
                        VStack {
                            Text("Duration")
                                .padding()
                            Text("Trigger Maintain")
                                .padding()
                            Text("Relax Maintain")
                                .padding()
                        }
                        .padding()
                        VStack {
                            GeometryReader { geometry in
                                SliderRectangleView(length: geometry.size.width, step: 29, sliderControl: sliderControlDuration)
                            }
                            .padding()
                            GeometryReader { geometry in
                                SliderRectangleView(length: geometry.size.width, step: 2, sliderControl: sliderControlTrigger)
                            }
                            .padding()
                            GeometryReader { geometry in
                                SliderRectangleView(length: geometry.size.width, step: 2, sliderControl: sliderControlRelax)
                            }
                            .padding()
                        }
                        .padding()
                        VStack {
                            Text("\(Int(sliderControlDuration.newPosition * 29 + 1))").padding()
                            Text("\(Int(sliderControlTrigger.newPosition * 2 + 1))").padding()
                            Text("\(Int(sliderControlRelax.newPosition * 2 + 1))").padding()
                        }
                        .frame(width: 80)
                        .padding()
                        VStack {
                            Text("Min").padding()
                            Text("Sec").padding()
                            Text("Sec").padding()
                        }
                        .padding()
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct UFOGameView_Previews: PreviewProvider {
    static var previews: some View {
        UFOGameView(viewModel: EmgsViewModel())
    }
}
