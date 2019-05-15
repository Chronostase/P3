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
    
    var playerInGame: [Player] = []
    var attackingPlayer = Player()
    var opponnentPlayer = Player()
    
    //---------------------------//
    //MARK: - Func
    //---------------------------//
    
    func launchSoft() {
        setup()
    }
    
    //---------------------------//
    //MARK: - Private Func
    //---------------------------//
    
    
    private func setup() {
        addPlayerInGame()
        presentation()
        attackingPlayer.createTeam()
        chooseCharacter(for: "ennemies team")
        opponnentPlayer.createTeam()
        teamInformations()
        selectCharacterAndTarget()
        fight()
    }
    
    private func checkIfDeadInTeam(of player: Player) {
        for (index, character) in player.team.enumerated() {
            if character.life <= 0 {
                player.team.remove(at: index)
            }
        }
    }
    
    private func fight() {
        while attackingPlayer.team.count != 0 || opponnentPlayer.team.count != 0 {
            fightInterface()
            actionInFight()
            swap(&attackingPlayer, &opponnentPlayer)
            selectCharacterAndTarget()
        }
    }
    
    private func actionInFight() {
        guard let userChoice = readLine() else {
            
            return print("An error as occured")
        }
        switch userChoice {
        case "1":
            if let selectedCharacter = attackingPlayer.selectedCharacter,
                let targetCharacter = attackingPlayer.targetCharacter {
                targetCharacter.life -= selectedCharacter.totalDamage
                print("""
                    You inflicted \(selectedCharacter.totalDamage) damage.
                    And your \(targetCharacter.name) have \(targetCharacter.life) life left.
                    """)
                checkIfDeadInTeam(of: attackingPlayer)
                checkIfDeadInTeam(of: opponnentPlayer)
            }
            
        case "2":
            if let character = attackingPlayer.selectedCharacter as? Wizard {
                if let targetCharacter = attackingPlayer.targetCharacter {
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
        //FIXME: Changer le système de notation
        if let character = attackingPlayer.selectedCharacter as? Wizard{
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
    
    private func teamInformations() {
        print(" The fight will begin ! In you team you have :")
        printTeam(at: 0)
        
        print("In the ennemies team there is:")
        printTeam(at: 1)
    }
    
    private func printTeam(at index: Int) {
        for character in playerInGame[index].team {
            print("""
                
                \(character.name): \(character.life) life and \(character.attack) attack
                
                """)
        }
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
    
    private func resetCharacterAndTarget() {
        for player in playerInGame {
            player.selectedCharacter = nil
            player.targetCharacter = nil
        }
    }
    
    private func addPlayerInGame() {
        playerInGame.append(attackingPlayer)
        playerInGame.append(opponnentPlayer)
    }

    private func selectCharacterAndTarget() {
        resetCharacterAndTarget()
        presentCharacterSelection(of: attackingPlayer, for: "Character to do an action :")
        attackingPlayer.selectACharater()
        if (attackingPlayer.selectedCharacter as? Wizard) != nil {
            presentCharacterSelection(of: attackingPlayer, for: "target")
            attackingPlayer.selectTargetinTeam(of: attackingPlayer)
        } else {
            presentCharacterSelection(of: opponnentPlayer, for: "target :")
            attackingPlayer.selectTargetinTeam(of: opponnentPlayer)
        }
    }
}
