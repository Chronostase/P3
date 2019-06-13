//
//  Game.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Game { // Setup and rules for the game
    
    //MARK: - Properties
    
    var playerInGame: [Player] = [] // Contain each player
    var attackingPlayer = Player(name: "Player 1") // contain player 1
    var opponnentPlayer = Player(name: "Player 2") // contain player 2
    
    //MARK: - Main Func
    
    func launchSoft() { // Launch the setup of the game
        setup()
    }
    
    private func setup() { // Launch the function to play to the game
        addPlayerInGame()
        giveNameToPlayer()
        presentation()
        createTeam(for: attackingPlayer)
        chooseCharacter(for: "ennemies team")
        createTeam(for: opponnentPlayer)
        teamInformations()
        fight()
    }
    
    private func createTeam(for player: Player) { // Function to creat a team to each player
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
    
    private func giveName(to fighter: Character) { // Give name to each character in player team
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
    
    private func isAvailable(_ name: String, in player: Player) -> Bool { // check if name is available
        for character in player.team {
            if character.name == name {
                print("Someone already have a character with this name choose another one.")
                return false
            }
        }
        return true
    }
    
    private func giveNameToPlayer() { // Give a name to Player 1 and player 2
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
    
    private func addPlayerInGame() { // Add player in array to have easier access to print information
        playerInGame.append(attackingPlayer)
        playerInGame.append(opponnentPlayer)
    }
    
    //MARK: - Fight settings
    
    private func fight() { // Loop to execute the fight
        while attackingPlayer.team.count != 0 && opponnentPlayer.team.count != 0 {
            selectCharacterAndTarget()
            attackingPlayer.doAction(to: opponnentPlayer)
            checkIfSomeoneDie()
            swap(&attackingPlayer, &opponnentPlayer)
        }
        endGame()
    }
    
    private func checkIfSomeoneDie() { // Check if character is dead
        attackingPlayer.checkIfDeadInTeam()
        opponnentPlayer.checkIfDeadInTeam()
    }
    
    private func selectCharacterAndTarget() { // Select a character and a target to attackingPlayer
        resetCharacterAndTarget()
        presentCharacterSelection(of: attackingPlayer, for: "Character to do an action :")
        attackingPlayer.selectACharater()
        selectTarget()
    }
    
    private func selectTarget() {
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
    }
    
    //MARK: - Chest settings
    
    private func spawnChestGiveHealingWeapon() { // Spawn a chest to Wizard
        if let selectedCharacter = attackingPlayer.selectedCharacter as? Wizard {
            spawnChest()?.giveAHealingWeapon(to: selectedCharacter)
            if let weapon = selectedCharacter.weapon,
                let name = weapon.name {
                print("Amazing ! You find a chest and loot a great \(name) that heal \(weapon.damage) HP !")
            }
        }
    }
    
    private func spawnChestGiveAttackingWeapon() { // Spawn chest to other character
        if let selectedCharacter = attackingPlayer.selectedCharacter {
            spawnChest()?.giveAttackingWeapon(to: selectedCharacter)
            if let weapon = selectedCharacter.weapon,
                let name = weapon.name {
                print("Amazing ! You find a chest and loot a great \(name) that deal \(weapon.damage) damage !")
            }
        }
    }
    
    /// 50% spawn rate
    ///
    /// - Returns: new chest or nothing
    private func spawnChest() -> Chest? {
        if Int.random(in: 0...1) == 1 {
            let chest = Chest()
            
            return chest
        }
        return nil
    }
    
    //MARK: - End of game and reset settings
    
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
    
    private func resetCharacterAndTarget() { // Func to reset selectedCharacter and targetCharacter
        for player in playerInGame {
            player.selectedCharacter = nil
            player.targetCharacter = nil
        }
    }
    
    private func resetTeam() { // Func to clean team of player
        var index = 1
        for player in playerInGame {
            player.team.removeAll()
            player.name = "Player \(index)"
            index += 1
        }
    }
    
    private func endGame() { // Setup to end the game
        presentWinner()
        presentationStopOrRetry()
        stopOrRetry()
    }
}
