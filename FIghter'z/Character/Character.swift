//
//  Character.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Character { // class to create characters
  
    //---------------------------//
    //MARK: - Properties
    //---------------------------//
    
    var name = String()
    var life: Int
    var attack: Int
    var sword: Sword?
    var totalDamage: Int {
        if let sword = sword {
            let swordAndAttack = sword.damage + attack
            return swordAndAttack
        }
        return attack
    }
    
    //---------------------------//
    //MARK: - Init
    //---------------------------//
    
    init(life: Int, attack: Int, sword: Sword? = nil) {
        self.life = life
        self.attack = attack
        self.sword = sword
    }
    
}
