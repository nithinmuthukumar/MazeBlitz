//
//  Prey.swift
//  MazeBlitz
//
//  Created by nithin muthukumar on 2019-07-25.
//  Copyright © 2019 nithin muthukumar. All rights reserved.
//

import SpriteKit

protocol Prey:Entity {
    var worth:Int { get }

    func update(players:[Player])
}
