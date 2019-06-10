//
//  Extension.swift
//  FIghter'z
//
//  Created by Thomas on 15/05/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

extension Game { // Extension to stock all game print 
    
    func presentation() { // Print to present the game
        print("Welcome to Fighter'z, all you need to do is to select three fighters and go to the fight !")
        chooseCharacter(for: "your team")
    }
    
    func chooseCharacter(for team: String) { // Presentation of character to add in team
        print("""
            Now you just have to add three characters in \(team) !
            Which character do you want to add ?
            
            1 Fighter : A balanced fighter who start with a sword.
            
            2 Wizard : His main ability is an heal.
            
            3 Dwarf : A character who focused on attack with low life.
            
            4 Colossus : A kind of armed tank with an intense rage.
            """)
    }
    
    func printTeam(at index: Int) { // Presentation of Player 1 or player 2 team
        for character in playerInGame[index].team {
            print("""
                
                \(character.name): \(character.life) life and \(character.attack) attack
                
                """)
        }
    }
    
    func presentCharacterSelection(of player: Player, for string: String) { // Present character selection
        var index = 1
        print("Please select a \(string)")
        for character in player.team {
            print("""
                \(index): \(character.name) with attack: \(character.attack) life: \(character.life)
                """)
            index += 1
        }
    }
    
    func teamInformations() { // Print information of each team
        print(" The fight will begin ! In your team you have :")
        printTeam(at: 0)
        
        print("In the ennemies team there is:")
        printTeam(at: 1)
    }
    
    func winOrLoose() { // Give the name of the winner
        if playerInGame[0].team.count > 0 {
            print("\(playerInGame[0].name) you are the Winner !")
        } else if playerInGame[1].team.count > 0 {
            print("\(playerInGame[1]) you are the Winner")
        }
    }
    
    func presentationStopOrRetry() { // Print a choice to retry or quit 
        print("""
Maybe would you retry ?

    1. Yes ! I want to fight again !

    2. No ! I want to get back to real life !
""")
    }
}
