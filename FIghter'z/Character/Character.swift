//
//  Character.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Character {
    var name: String
    var life: Int
    var attack: Int
    var sword: Sword?
    var totalDamage: Int {
        guard let sword = sword else {
            
            return attack
        }
        let swordAndAttack = sword.damage + attack
        return swordAndAttack
    }
    
    init(name: String, life: Int, attack: Int, sword: Sword?) {
        self.name = name
        self.life = life
        self.attack = attack
        self.sword = sword
    }
    
}
