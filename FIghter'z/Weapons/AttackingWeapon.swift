//
//  AttackingWeapon.swift
//  FIghter'z
//
//  Created by Thomas on 20/05/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation
class AttackingWeapon {
    var name: String?
    var damage: Int?
    
    func giveDamage() {
        var damageArray = [6,8,10,12,14]
        let index = Int.random(in: 0...4)
        damage = damageArray[index]
    }
    
    func giveName() {
        var nameArray = ["BF Razor","Ancient Sword","BroadSword of Azzinoth","Golem Gloves"]
        let index = Int.random(in: 0...3)
        name = nameArray[index]
    }
}
