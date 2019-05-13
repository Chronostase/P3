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
        
        selectCharacterAndTarget(for: playerA, targetFrom: playerB)
        fight()
    }
    
    private func launch() {
        //FIXME: Make sur that i need this
        while infinity == true {
            infinity = false
        }
    }
    
    private func checkIfDead(player: Player) {
        for (index, character) in player.team.enumerated() {
            if character.life <= 0 {
                player.team.remove(at: index)
            }
        }
    }
    
    private func fight() {
        var index = 2
        while playerA.team.count >= 1 || playerB.team.count >= 1 {
            fightInterface()
            if (index + 1) % 2 == 1 {
                print("PLAYER A TURN")
                actionInFight(for: playerA)
                selectCharacterAndTarget(for: playerB, targetFrom: playerA)
                index += 1
            } else {
                print("PLAYER B TURN")
                actionInFight(for: playerB)
                index += 1
                selectCharacterAndTarget(for: playerA, targetFrom: playerB)
            }
        }
    }
    
//    private func fight() {
//        while playerA.team.count >= 1 || playerB.team.count >= 1 {
//            fightInterface()
//            guard let userChoice = readLine() else {
//
//                return print("An error as occured")
//            }
//            switch userChoice {
//            case "1":
//                if let selectedCharacter = playerA.selectedCharacter,
//                    let targetCharacter = playerA.selectedCharacter {
//                    targetCharacter.life -= selectedCharacter.totalDamage
//                    print("""
//                        You inflicted \(selectedCharacter.totalDamage) damage.
//                        And your target have \(targetCharacter.life) life left.
//                        """)
//                    checkIfDead(player: playerA)
//                    checkIfDead(player: playerB)
//                }
//                selectCharacterAndTarget()
//
//            case "2":
//                if let character = playerA.selectedCharacter as? Wizard {
//                    if let targetCharacter = playerA.targetCharacter {
//                        targetCharacter.life += character.heal
//                        print("""
//                            You heal \(character.heal) point of life.
//                            And your target have \(targetCharacter.life) life left.
//                            """)
//                    }
//                }
//                selectCharacterAndTarget()
//
//            default:
//                print("Please select a correct number")
//            }
//        }
//    }
    
    private func actionInFight(for player: Player) {
        guard let userChoice = readLine() else {
            
            return print("An error as occured")
        }
        switch userChoice {
        case "1":
            if let selectedCharacter = player.selectedCharacter,
                let targetCharacter = player.selectedCharacter {
                targetCharacter.life -= selectedCharacter.totalDamage
                print("""
                    You inflicted \(selectedCharacter.totalDamage) damage.
                    And your target have \(targetCharacter.life) life left.
                    """)
                checkIfDead(player: playerA)
                checkIfDead(player: playerB)
            }
            
        case "2":
            if let character = player.selectedCharacter as? Wizard {
                if let targetCharacter = player.targetCharacter {
                    targetCharacter.life += character.heal
                    print("""
                        You heal \(character.heal) point of life.
                        And your target have \(targetCharacter.life) life left.
                        """)
                }
            }
            
        default:
            print("Please select a correct number")
        }
    }
    
    private func fightInterface() {
        if let character = playerA.selectedCharacter as? Wizard{
                print("""
What do you want to do with \(character.name) ?

    2. Heal !
""")
            } else {
                print("""
What do you want to do with  ?

    1. Attack !
""")
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
            - \(player.team[index].name)  with \(player.team[index].life) life and \(player.team[index].attack) attack.
            
            """)
    }
    
    private func presentCharacterSelection(of player: Player, for string: String) {
        var index = 1
        print("Please select a \(string)")
        for character in player.team {
            print("""
\(index): \(character.name)
""")
            index += 1
        }
    }

    private func selectCharacterAndTarget(for player: Player, targetFrom: Player) {
        resetCharacterAndTarget(for: player)
        presentCharacterSelection(of: player, for: "Character to do an action :")
        player.selectACharater()
        presentCharacterSelection(of: targetFrom, for: "target :")
        player.selectTarget()
    }
    
    private func resetCharacterAndTarget(for player: Player) {
        player.selectedCharacter = nil
        player.targetCharacter = nil
    }
}
