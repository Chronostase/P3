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
    var attackingPlayer = Player(name: "Player 1")
    var opponnentPlayer = Player(name: "Player 2")
    
    //---------------------------//
    //MARK: - Main Func
    //---------------------------//
    
    func launchSoft() {
        setup()
    }
    
    func stopOrRetry() { // Give the choice to restart game or stop it
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
    
    private func setup() { // Launch all the func
        addPlayerInGame()
        giveNameToPlayer()
        presentation()
        createTeam(for: attackingPlayer)
        chooseCharacter(for: "ennemies team")
        createTeam(for: opponnentPlayer)
        teamInformations()
        fight()
    }
    
    //---------------------------//
    //MARK: - Private Func
    //---------------------------//

    private func createTeam(for player: Player) {
        while player.team.count < 3 {
            if let userChoice = readLine() {
                switch userChoice {
                case "1":
                    let fighter = Fighter(sword: AttackingWeapon())
                    player.addCharaInTeam(fighter)
                    giveName(to: fighter)
                case "2":
                    let wizard = Wizard(heal: 5)
                    player.addCharaInTeam(wizard)
                    giveName(to: wizard)
                case "3":
                    let dwarf = Dwarf()
                    player.addCharaInTeam(dwarf)
                    giveName(to: dwarf)
                case "4":
                    let colossus = Colossus()
                    player.addCharaInTeam(colossus)
                    giveName(to: colossus)
                default:
                    print("Please select a correct number !")
                    createTeam(for: player)
                }
            }
        }
    }
    
    //MARK: - Name settings
    
    private func giveName(to fighter: Character) {
        print("Choose the name of your fighters")
        if let name = readLine()?.lowercased() {
            if isAvailable(name, in: attackingPlayer) == true && isAvailable(name, in: opponnentPlayer) == true {
                
                fighter.name = name
                print("Your fighter is know called \(fighter.name)")
                print("Select another number")
            } else {
                giveName(to: fighter)
            }
        }
    }
    
    private func isAvailable(_ name: String, in player: Player) -> Bool {
        for character in player.team {
            if character.name == name {
                print("Someone already have a character with this name choose another one.")
                return false
            }
        }
        return true
    }
    
    private func giveNameToPlayer() {
        for player in playerInGame {
            
            if player.name == "Player 1" || player.name == "Player 2" {
                print("\(player.name), please select your name !")
                
                if let userChoice = readLine() {
                    player.name = userChoice
                    print("Your are now \(player.name) !")
                }
            }
        }
    }
    
    //MARK: - Fight settings
    
    private func fight() {
        while attackingPlayer.team.count != 0 && opponnentPlayer.team.count != 0 {
            print("Enter in loop")
            selectCharacterAndTarget()
            attackingPlayer.doAction(to: opponnentPlayer)
            checkIfSomeoneDie()
            swap(&attackingPlayer, &opponnentPlayer)
        }
        endGame()
    }
    
    private func checkIfSomeoneDie() {
        print("In team of attacking player.")
        attackingPlayer.checkIfDeadInTeam()
        print("In team of opponnent player.")
        opponnentPlayer.checkIfDeadInTeam()
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
        
        if (attackingPlayer.selectedCharacter as? Wizard) != nil {
            spawnChestGiveHealingWeapon()
            presentCharacterSelection(of: attackingPlayer, for: "target")
            attackingPlayer.selectTargetinTeam(of: attackingPlayer)
            
        }  else if (attackingPlayer.selectedCharacter as? Colossus) != nil {
            spawnChestGiveAttackingWeapon()
            presentCharacterSelection(of: opponnentPlayer, for: "target :")
            attackingPlayer.selectTargetinTeam(of: opponnentPlayer)
            
        } else {
            spawnChestGiveAttackingWeapon()
            presentCharacterSelection(of: opponnentPlayer, for: "target :")
            attackingPlayer.selectTargetinTeam(of: opponnentPlayer)
            
        }
        print("Exit of selectedchara/target")
    }
    
    //MARK: - Chest settings
    
    private func spawnChestGiveHealingWeapon() {
        if let selectedCharacter = attackingPlayer.selectedCharacter as? Wizard {
            spawnChest()?.giveAHealingWeapon(to: selectedCharacter)
            if let weapon = selectedCharacter.weapon,
                let name = weapon.name {
                print("Amazing ! You find a chest and loot a great \(name) that heal \(weapon.damage) HP !")
            }
        }
    }
    
    private func spawnChestGiveAttackingWeapon() {
        if let selectedCharacter = attackingPlayer.selectedCharacter {
            spawnChest()?.giveAttackingWeapon(to: selectedCharacter)
            if let weapon = selectedCharacter.weapon,
                let name = weapon.name {
                print("Amazing ! You find a chest and loot a great \(name) that deal \(weapon.damage) damage !")
            }
        }
    }
    
    private func spawnChest() -> Chest? {// 50% of spawn rate
        let index = Int.random(in: 0...1)
        if index == 1 {
            let chest = Chest()
            
            return chest
        }
        return nil
    }
    
    //MARK: - End of game and reset settings

    private func resetCharacterAndTarget() {
        for player in playerInGame {
            player.selectedCharacter = nil
            player.targetCharacter = nil
        }
    }
    
    private func resetTeam() {
        var index = 1
        for player in playerInGame {
            player.team.removeAll()
            player.name = "Player \(index)"
            index += 1
        }
    }
    
    private func endGame() {
        winOrLoose()
        presentationStopOrRetry()
        stopOrRetry()
    }
}
