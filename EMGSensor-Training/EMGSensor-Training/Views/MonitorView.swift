//
//  MonitorView.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import SwiftUI
import EmgsModelFramework

struct MonitorView: View {
    
    @ObservedObject public var viewModel: EmgsViewModel
    
    @State var emgData: Double = 30000
    @StateObject var sliderControl = SliderControl(currentPosition: 0.01, min: 0.01, max: 1)
    
    var body: some View {
        VStack {
            VStack {
                Text("EMG Range")
                VStack {
                    ZStack {
                        Rectangle()
                        Rectangle()
                            .fill(.green)
                            .scaleEffect(x: emgData / 65536, y: 1, anchor: .leading)
                            .padding(2)
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
                            SliderRectangleView(length: geometry.size.width, step: 100, sliderControl: sliderControl)
                        }
                        .frame(height: 20)
                        .padding(.leading, 20.0)
                        HStack {
                            Spacer()
                            Text("\(Int((sliderControl.newPosition) * 100)).0")
                                .padding(.leading, 20.0)
                        }
                        .frame(width: 80)
                    }
                }
                .padding()
                .border(.gray, width: 2)
            }
            VStack {
                HStack {
                    Text("Period Average")
                    Spacer()
                    ButtonView(text: "Cal. Avg", image: nil, action: {print("show cal. avg")}, dismiss: nil)
                    CounterCircleView(progress: 0.8)
                    ButtonView(text: "Clear", image: nil, action: {print("show cal. avg")}, dismiss: nil)
                }
                Divider()
                ScrollView {
                    HStack {
                        Text("2023-Jun-13 10:14:49")
                        Spacer()
                        Text("347")
                        Spacer()
                    }
                    .padding(1)
                    HStack {
                        Text("2023-Jun-13 10:14:49")
                        Spacer()
                        Text("347")
                        Spacer()
                    }
                    .padding(1)
                    HStack {
                        Text("2023-Jun-13 10:14:49")
                        Spacer()
                        Text("347")
                        Spacer()
                    }
                    .padding(1)
                }
            }
        }
//        .background(Color("LightGray"))
    }
}

struct MonitorView_Previews: PreviewProvider {
    static var previews: some View {
        MonitorView(viewModel: EmgsViewModel())
    }
}
