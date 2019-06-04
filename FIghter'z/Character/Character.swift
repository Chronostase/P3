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
        if let weapons = weapon {
            let weaponAndAttack = (self.attack + weapons.damage )
            
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
