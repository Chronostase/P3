//
//  Chest.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

final class Chest { // class to create a lootbox
    var attackingLootBox = AttackingWeapon()
    var healingLootBox = HealingWeapon()
    
    
    func giveAttackingWeapon(to character: Character) {
        character.weapon = attackingLootBox
    }
    
    func giveAHealingWeapon(to character: Wizard) {
        character.staff = healingLootBox
    }
}
