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
    
    var heal: Int = 5
    
    //---------------------------//
    //MARK: - Init
    //---------------------------//
    
    init() {
        super.init(life: 80, attack: 0, sword: nil)
    }
}
