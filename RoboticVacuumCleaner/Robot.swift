//
//  Robot.swift
//  RoboticVacuumCleaner
//
//  Created by Recep Taha Aydın on 8.11.2023.
//

import Foundation

class Robot {
    
    var isActive: Bool
    var roomList: [Room]
    
    init(roomList: [Room], isActive: Bool) {
        self.roomList = roomList
        self.isActive = isActive
    }
}
