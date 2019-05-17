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
    
    func stopOrRetry() {
        if let userchoice = readLine() {
            switch userchoice {
            case "1":
                resetCharacterAndTarget()
                resetTeam()
                setup()
            case "2":
                print("Good bye !")
            default:
                print("Please select a correct number")
            }
        }
    }
    
    //---------------------------//
    //MARK: - Private Func
    //---------------------------//
    
    
    private func setup() {
        addPlayerInGame()
        namePlayer()
        presentation()
        attackingPlayer.createTeam()
        chooseCharacter(for: "ennemies team")
        opponnentPlayer.createTeam()
        teamInformations()
        fight()
    }
    
    private func fight() {
        while attackingPlayer.team.count != 0 && opponnentPlayer.team.count != 0 {
            print("Enter in loop")
            selectCharacterAndTarget()
            fightInterface()
            actionInFight()
            swap(&attackingPlayer, &opponnentPlayer)
        }
        endGame()
    }
    
    private func actionInFight() {
        guard let userChoice = readLine() else {
            
            return print("Couldn't have information from readLine")
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
                print("In team of attacking player.")
                attackingPlayer.checkIfDeadInTeam()
                print("In team of opponnent player.")
                opponnentPlayer.checkIfDeadInTeam()
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
    
    
    private func resetCharacterAndTarget() {
        for player in playerInGame {
            player.selectedCharacter = nil
            player.targetCharacter = nil
        }
    }
    
    private func resetTeam() {
        for player in playerInGame {
            player.team.removeAll()
        }
    }
    
    private func addPlayerInGame() {
        playerInGame.append(attackingPlayer)
        playerInGame.append(opponnentPlayer)
    }

    private func selectCharacterAndTarget() {
        print("Enter in selectedchara/target")
        resetCharacterAndTarget()
        presentCharacterSelection(of: attackingPlayer, for: "Character to do an action :")
        attackingPlayer.selectACharater()
        //        if let _ = attackingPlayer.selectedCharacter as? Wizard {
        //
        //        }
        if (attackingPlayer.selectedCharacter as? Wizard) != nil {
            presentCharacterSelection(of: attackingPlayer, for: "target")
            attackingPlayer.selectTargetinTeam(of: attackingPlayer)
        } else {
            presentCharacterSelection(of: opponnentPlayer, for: "target :")
            attackingPlayer.selectTargetinTeam(of: opponnentPlayer)
        }
        print("Exit of selectedchara/target")
    }
    
    private func namePlayer() {
        print("Player 1: select your name !")
        for player in playerInGame {
            if attackingPlayer.name != "" {
                print("Player 2: select your name !")
            }
            if let userChoice = readLine() {
                player.name = userChoice
                print("You are now \(player.name)")
            }
        }
    }
    
    private func endGame() {
            presentationStopOrRetry()
            stopOrRetry()
    }
}
