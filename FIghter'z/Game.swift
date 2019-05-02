//
//  Game.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Game { // Setup and rules for the game
    
    //---------------------------//
    //MARK: - Properties
    //---------------------------//
    
    let playerA = Player()
    let playerB = Player()
    var infinity = true
    
    //---------------------------//
    //MARK: - Func
    //---------------------------//
    
    func launchSoft() {
        launch()
        setup()
    }
    
    //---------------------------//
    //MARK: - Private Func
    //---------------------------//
    
    
    private func setup() {
        presentation()
        playerA.createTeam()
        playerB.createTeam()
    }
    
    private func launch() {
        while infinity == true {
            printCharaInTeam(of: playerA)
            printCharaInTeam(of: playerB)
            infinity = false
        }
    }
    
    private func presentation() {
        print("Welcome to Fighter'z, all you need to do is to select three fighters and go to the fight !")
        selectCharacter()
    }
    
    private func selectCharacter() {
        print("""
Now you just have to add three characters in your team !
Which character do you want to add ?

    1 Fighter : A balanced fighter who start with a sword.

    2 Wizard : His main ability is an heal.

    3 Dwarf : A character who focused on attack with low life.

    4 Colossus : A kind of armed tank
""")
    }
    
    private func printCharaInTeam(of player: Player) {
        if player.team.count >= 3 {
            for characters in player.team {
                print(characters.name)
            }
        }
    }
}
