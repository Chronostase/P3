//
//  Wizard.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Wizard: Character { // class to create a wizard
    
    //---------------------------//
    //MARK: - Properties
    //---------------------------//
    
    var heal: Int // Contain Wizard's life
    var staff: HealingWeapon? // Can contain a weapon
    var totalHeal: Int { // Add weapon Int to heal
        if let weapons = staff {
            let weaponAndHeal = (self.heal + weapons.damage)
            
            return weaponAndHeal
        }
        return heal
    }
    
    //MARK: - Init
    
    init(heal: Int) {
        self.heal = heal
        super.init(life: 40, attack: 0)
    }
}
