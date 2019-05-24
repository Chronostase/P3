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
        super.init(life: 120, attack: 2)
    }
    
    func checkColossusSlashAvailable() -> Bool {
        if life <= 40 {
            return true
        }
        return false
    }
    
    func passiveSkillBerzerk() {
        if life <= 40 {
            attack = 10
            
            print("Your attack reise to 10")
        } else if life <= 80 {
            attack = 6
            
            print("Your attack reise to 6")
        } else {
            attack = 2
            
            print("You dont get any buf")
        }
    }
    
    func colossusSlash(to player: Player) {
        if checkColossusSlashAvailable() == true {
            for character in player.team {
                character.life -= totalDamage
            }
            print("You used ColossusSlash")
        }
    }
}
