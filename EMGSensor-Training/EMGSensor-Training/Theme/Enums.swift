//
//  Enums.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 12/6/2023.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    case chi = "繁體中文"
    case eng = "English"

    var id: String { self.rawValue }
}
