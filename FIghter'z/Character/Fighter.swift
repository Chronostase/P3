//
//  Fighter.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Fighter: Character { // class to create a fighter
    
    //---------------------------//
    //MARK: - Init
    //---------------------------//
    
    init(sword: AttackingWeapon) {
        super.init(life: 40, attack: 13)
    }
}
