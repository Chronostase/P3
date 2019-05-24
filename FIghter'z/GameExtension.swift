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
    
    func chooseCharacter(for team: String) {
        print("""
            Now you just have to add three characters in \(team) !
            Which character do you want to add ?
            
            1 Fighter : A balanced fighter who start with a sword.
            
            2 Wizard : His main ability is an heal.
            
            3 Dwarf : A character who focused on attack with low life.
            
            4 Colossus : A kind of armed tank
            """)
    }
    
    func printTeam(at index: Int) {
        for character in playerInGame[index].team {
            print("""
                
                \(character.name): \(character.life) life and \(character.attack) attack
                
                """)
        }
    }
    
    func presentCharacterSelection(of player: Player, for string: String) {
        var index = 1
        print("Please select a \(string)")
        for character in player.team {
            print("""
                \(index): \(character.name)
                """)
            index += 1
        }
    }
    
    func teamInformations() {
        print(" The fight will begin ! In you team you have :")
        printTeam(at: 0)
        
        print("In the ennemies team there is:")
        printTeam(at: 1)
    }
    
    func fightInterface() {
        //FIXME: Changer le système de notation
        if let character = attackingPlayer.selectedCharacter as? Wizard{
            print("""
                What do you want to do with \(character.name) ?
                
                2. Heal !
                """)
        } else if let selectedCharacter = attackingPlayer.selectedCharacter as? Colossus {
            if selectedCharacter.life <= 40 {
                
                print("""
                What do you want to do with \(selectedCharacter.name) ?
                
                3. ColossusSlash !
                """)
                
            } else {
                print("""
                What do you want to do with \(selectedCharacter.name) ?
                
                3. Attack Colossus !
                """)
            }
            
        } else {
            
         if let selectedCharacter = attackingPlayer.selectedCharacter {
                
                print("""
                    What do you want to do with \(selectedCharacter.name) ?
                    
                    1. Attack !
                    """)
            }
        }
    }
    
    func presentationStopOrRetry() {
        print("""
You loose your fight ! Maybe would you retry ?

    1. Yes ! I want to fight again !

    2. No ! I want to get back to real life !
""")
    }
}
