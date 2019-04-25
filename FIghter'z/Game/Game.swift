//
//  Game.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Game {
    var myTeam: [Character]
    var opponentTeam: [Character]
    
    init(myTeam: [Character], opponentTeam: [Character]) {
        self.myTeam = myTeam
        self.opponentTeam = opponentTeam
    }
}
