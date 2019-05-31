//
//  StringExtension.swift
//  FIghter'z
//
//  Created by Thomas on 31/05/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

extension String {
    
    func isAvailable(for name: String, in player: Player) -> Bool {
        for character in player.team {
            if character.name == name {
                print("Someone already have a character with this name choose another one.")
                return false
            }
        }
        return true
    }
    
}
