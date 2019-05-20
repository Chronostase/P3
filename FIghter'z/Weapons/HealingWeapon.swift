//
//  HealingWeapon.swift
//  FIghter'z
//
//  Created by Thomas on 20/05/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation
class HealingWeapon {
    var name: String?
    var heal: Int?
    
    
    func giveName() {
        var nameArray = ["Scepter of Great Wizard","Black Star","Vielpine","Stardust Scepter"]
        let index = Int.random(in: 0...3)
        name = nameArray[index]
    }
    
    func giveHealAmount() {
        var healArray = [6,8,10,12,14]
        let index = Int.random(in: 0...4)
        heal = healArray[index]
    }
}
