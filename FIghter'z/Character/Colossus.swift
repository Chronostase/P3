//
//  Colossus.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Colossus: Character { // class to create a colossus
    
    //---------------------------//
    //MARK: - Init
    //---------------------------//
    
    init() {
        super.init(life: 20, attack: 80)
    }
    
    func passiveSkillBerzerk() { // Passive skill to increase damage when low on life
        if life <= 40 {
            attack = 80
            
            print("Your attack reise to 14")
        } else if life <= 80 {
            attack = 10
            
            print("Your attack reise to 10")
        } else {
            attack = 6
            
            print("You dont get any buf")
        }
    }
    
    func colossusSlashIsAvailable() -> Bool { // Check if special capacity is available
        if life <= 40 {
            return true
        }
        return false
    }
    
    func colossusSlash(to player: Player) { // Special attack that deal damage to all opponnent
        if colossusSlashIsAvailable() == true {
            for character in player.team {
                character.life -= totalDamage
            }
            print("You used ColossusSlash")
        }
    }
}
