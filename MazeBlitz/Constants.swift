//
//  Constants.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-26.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import SpriteKit
enum Shape:Int,CaseIterable{
    case Triangle=1
    case Square=2
    case Pentagon=3
    case Hexagon=4
    case Heptagon=5
    case Octagon=6
    case Circle=100
    var description: String {
        return String(describing: self)
    }
    static func withLabel(_ label: String) -> Shape? {
        return self.allCases.first{ "\($0)" == label }
    }
    
    
   
    
    
    
    
}
func createShape(_ sides:Int)->SKShapeNode{
    return SKShapeNode()
    
    
    
}
