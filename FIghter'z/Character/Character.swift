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
    var weapon: AttackingWeapon?
    var totalDamage: Int {
        if let weapons = weapon,
            let damage = weapons.damage {
<<<<<<< HEAD
            let weaponAndAttack = (attack + damage)
=======
           let weaponAndAttack = (attack + damage)
>>>>>>> d51f8f21e4998fd8fc749ddb30d6dbc7bd25c6c9
            
            return weaponAndAttack
        }
        return attack
    }
    
    //---------------------------//
    //MARK: - Init
    //---------------------------//
    
    init(life: Int, attack: Int) {
        self.life = life
        self.attack = attack
    }
}
