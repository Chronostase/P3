//
//  Fighter.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Fighter: Character {
    init() {
        let sword = Sword(name: "Needle", damage: 10)
        super.init(name: "FooFighter", life: 100, attack: 3, sword: sword)
    }
}
