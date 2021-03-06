//
//  Player.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Player { //Class who affect player
    
    //MARK: - Properties
    
    var name: String // Contain name of player
    var team: [Character] = [] // Contain player's team
    var selectedCharacter: Character? // Contain selected Character
    var targetCharacter: Character? // Contain targeted Character 
    
    
    init(name: String) {
        self.name = name
    }
    
    //MARK: - Func to select character and character's target
    
    func selectACharater() { // Select character in player's own team
        if let userChoice = readLine() {
            switch userChoice {
            case "1":
                selectedCharacter = team[0]
            case "2":
                selectedCharacter = team[1]
            case "3":
                selectedCharacter = team[2]
            default:
                print("Please select a correct number")
                selectACharater()
            }
        }
    }
    
    func selectTargetinTeam(of player: Player) { // Select a target in team of Player 1 or player 2
        if let userChoice = readLine() {
            switch userChoice {
            case "1":
                targetCharacter = player.team[0]
                if let targetCharacter = targetCharacter {
                    print("You choose \(targetCharacter.name) as target character")
                }
            case "2":
                targetCharacter = player.team[1]
                if let targetCharacter = targetCharacter {
                    print("You choose \(targetCharacter.name) as target character")
                }
            case "3":
                targetCharacter = player.team[2]
                if let targetCharacter = targetCharacter {
                    print("You choose \(targetCharacter.name) as target character")
                }
            default:
                print("Please select a correct number")
            }
        }
    }
    
    func addCharaInTeam(_ fighter: Character) { // Add character in team
        if team.count < 3 {
            print("You add an ally")
            team.append(fighter)
        } else {
            print("You team is full")
        }
    }
    
    //MARK: - Func to attack / Heal
    
    func doAction(to player: Player) { // attack for specifical character
        if let _ = selectedCharacter as? Wizard {
            setupHeal()
        } else if let _ = selectedCharacter as? Colossus {
            setupColossusAttack(against: player)
        } else {
            setupAttack()
        }
    }
    
    private func setupAttack() { // Attack in fight
        if let selectedCharacter = selectedCharacter,
            let targetCharacter = targetCharacter {
            targetCharacter.life -= selectedCharacter.totalDamage
            print("""
                You inflicted \(selectedCharacter.totalDamage) damage.
                And \(targetCharacter.name) have \(targetCharacter.life) life left.
                """)
        }
    }
    
    private func setupHeal() { // Heal in fight
        if let character = selectedCharacter as? Wizard {
            if let targetCharacter = targetCharacter {
                targetCharacter.life += character.totalHeal
                print("""
                    You heal \(character.totalHeal) point of life.
                    And \(targetCharacter.name) have \(targetCharacter.life) life left.
                    """)
            }
        }
    }
    
    private func setupColossusAttack(against player: Player) { // Attack or special attack
        if let character = selectedCharacter as? Colossus {
            character.passiveSkillBerzerk()
            
            if character.colossusSlashIsAvailable() { // Change name
                character.colossusSlash(to: player)
                
                for enemy in player.team {
                    print("You inflicted \(character.totalDamage) damage to \(enemy.name) and \(enemy.life) HP left")
                }
            } else if let targetCharacter = targetCharacter {
                
                targetCharacter.life -= character.totalDamage
                
                print("""
                    You inflicted \(character.totalDamage) damage.
                    And \(targetCharacter.name) have \(targetCharacter.life) life left.
                    """)
            }
        }
    }
    
    func checkIfDeadInTeam() { // Check if character is dead in team
        for (index, character) in team.enumerated() {
            if isDead(character) {
                team.remove(at: index)
                print("\(character.name) is dead ...")
                print("Character's left: \(team.count)")

                if team.count > 0 {
                    checkIfDeadInTeam()
                    
                    return
                }
            }
        }
    }
    
    private func isDead(_ character: Character) -> Bool {
        if character.life <= 0 {
            
            return true
        }
        
        return false
    }
    
}
