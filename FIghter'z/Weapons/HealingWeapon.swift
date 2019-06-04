//
//  healingWeapon.swift
//  FIghter'z
//
//  Created by Thomas on 22/05/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class HealingWeapon: Weapon {
    
    var nameArray = ["Scepter of Great Wizard","Black Star","Vielpine","Stardust Scepter"]
    
    override init() {
        super.init()
        name = nameArray.randomElement()
    }

}
