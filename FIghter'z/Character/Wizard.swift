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
    
    var heal: Int
    var staf: HealingWeapon?
    var totalHeal: Int {
        if let weapons = staf,
            let heal = weapons.heal {
            let weaponAndHeal = (self.heal + heal)
            
            return weaponAndHeal
        }
        return heal
    }
    
    //---------------------------//
    //MARK: - Init
    //---------------------------//
    init(heal: Int) {
        self.heal = heal
        super.init(life: 80, attack: 0)
    }
}
