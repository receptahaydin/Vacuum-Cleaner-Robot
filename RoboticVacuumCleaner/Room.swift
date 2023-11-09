//
//  Room.swift
//  RoboticVacuumCleaner
//
//  Created by Recep Taha Aydın on 7.11.2023.
//

import Foundation

class Room {
    var id: Int
    var isClean: Bool
    
    init(id: Int, isClean: Bool) {
        self.id = id
        self.isClean = isClean
    }
}
