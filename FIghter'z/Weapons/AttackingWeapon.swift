//
//  attackingWeapon.swift
//  FIghter'z
//
//  Created by Thomas on 22/05/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class AttackingWeapon: Weapon {
    
    var nameArray = ["BF Razor","Ancient Sword","BroadSword of Azzinoth","Golem Gloves"]
    
    override init() {
        super.init()
        name = nameArray.randomElement()
    }
}
