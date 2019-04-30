//
//  Weapon.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Weapon { // class to create weapon
    
    //---------------------------//
    //Mark Properties
    //---------------------------//
    var name: String
    var damage: Int
    
    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }
}
