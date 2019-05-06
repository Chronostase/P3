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
        chooseCharacter(for: "ennemies team")
        playerB.createTeam()
        teamInformations()
        presentCharacterSelection(of: playerA, for: "Character to do an action :")
        playerA.selectACharater()
        presentCharacterSelection(of: playerB, for: "target :")
        playerA.selectTarget(from: playerB)
    }
    
    private func launch() {
        while infinity == true {
            infinity = false
        }
    }
    
    private func presentation() {
        print("Welcome to Fighter'z, all you need to do is to select three fighters and go to the fight !")
        chooseCharacter(for: "your team")
    }
    
    private func chooseCharacter(for team: String) {
        print("""
Now you just have to add three characters in \(team) !
Which character do you want to add ?

    1 Fighter : A balanced fighter who start with a sword.

    2 Wizard : His main ability is an heal.

    3 Dwarf : A character who focused on attack with low life.

    4 Colossus : A kind of armed tank
""")
    }
    
    private func teamInformations() {
        print(" The fight will begin ! In you team you have :")
        printTeam(playerA, at: 0)
        printTeam(playerA, at: 1)
        printTeam(playerA, at: 2)
        
        print("In the ennemies team there is:")
        printTeam(playerB, at: 0)
        printTeam(playerB, at: 1)
        printTeam(playerB, at: 2)
    }
    
    private func printTeam(_ player: Player, at index: Int) {
        print("""
            - \(player.team[index].name) with \(player.team[index].life) and \(player.team[index].attack)
            
            """)
    }
    
    private func presentCharacterSelection(of player: Player, for string: String) {
        print("""
            Choose a \(string) :
            1: \(player.team[0].name)
            2: \(player.team[1].name)
            3: \(player.team[2].name)
            """)
    }
}
