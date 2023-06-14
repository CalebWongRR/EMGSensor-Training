//
//  SliderControl.swift
//  EMGSensor-Training
//
//  Created by Rehab Robotics on 14/6/2023.
//

import Foundation

class SliderControl: ObservableObject {
    var currentPosition: Double
    var min: Double
    var max: Double
    @Published var _movement: Double
    var movement: Double {
        get {
            return _movement
        }
        set {
            let maxPositiveMovement: Double = max - currentPosition
            let maxNegativeMovement: Double = min - currentPosition
            
            if newValue < maxNegativeMovement {
                _movement = maxNegativeMovement
            } else if newValue > maxPositiveMovement {
                _movement = maxPositiveMovement
            } else {
                _movement = newValue
            }
        }
    }
    
    var newPosition: Double {
        return currentPosition + movement
    }
    
    init(currentPosition: Double, min: Double, max: Double) {
        self.currentPosition = currentPosition
        self.min = min
        self.max = max
        self._movement = 0
    }
    
    func stopMove(){
        currentPosition = newPosition
        movement = 0
    }
    
}
