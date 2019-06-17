//
//  Chest.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

final class Chest { // class to create a lootbox
    private var attackingLootBox = AttackingWeapon() // Contain attacking Weapon
    private var healingLootBox = HealingWeapon() // Contain Healing Weapon
    
    
    func giveAttackingWeapon(to character: Character) { // Give weapon only to other character
        character.weapon = attackingLootBox
    }
    
    func giveAHealingWeapon(to character: Wizard) { // Give a weapon only to Wizard
        character.staff = healingLootBox
    }
}
