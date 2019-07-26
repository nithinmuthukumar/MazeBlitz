//
//  AI.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-25.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import Foundation
import GameKit
protocol AI {
    var sightDistance:CGFloat {get}
    func update(_ prey:ArraySlice<Entity>,_ predator:ArraySlice<Entity>)
}
