//
//  Extension.swift
//  FIghter'z
//
//  Created by Thomas on 15/05/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

extension Game {
    
    func presentation() {
        print("Welcome to Fighter'z, all you need to do is to select three fighters and go to the fight !")
        chooseCharacter(for: "your team")
    }
}
