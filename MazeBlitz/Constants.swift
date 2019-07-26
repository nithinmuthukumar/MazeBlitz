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
    case Triangle,Square,Pentagon,Hexagon,Heptagon,Octagon,Nonagon,Decagon,Hendecagon,Dodecagon,Circle
    var description: String {
        print(String(describing: self))
        return String(describing: self)
    }
    static func withLabel(_ label: String) -> Shape? {
        return self.allCases.first{ "\($0)" == label }
    }
    
    
   
    
    
    
    
}
func createShape(_ shape:Shape)->SKShapeNode{
    return SKShapeNode()
    
    
    
}
