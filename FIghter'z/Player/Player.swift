//
//  Player.swift
//  FIghter'z
//
//  Created by Thomas on 25/04/2019.
//  Copyright © 2019 Thomas. All rights reserved.
//

import Foundation

class Player { //Class who affect player
    
    //---------------------------//
    //MARK: - Properties
    //---------------------------//
    var name = ""
    var team: [Character] = []
    var selectedCharacter: Character?
    var targetCharacter: Character?
    //---------------------------//
    //MARK: - Func
    //---------------------------//
    
    func selectACharater() {
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
    
    func selectTargetinTeam(of player: Player) {
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
    
    func createTeam() {
        while team.count < 3 {
            if let userChoice = readLine() {
                switch userChoice {
                case "1":
                    let fighter = Fighter(sword: AttackingWeapon())
                    addCharaInTeam(fighter)
                    rename(fighter)
                case "2":
                    let wizard = Wizard(heal: 5)
                    addCharaInTeam(wizard)
                    rename(wizard)
                case "3":
                    let dwarf = Dwarf()
                    addCharaInTeam(dwarf)
                    rename(dwarf)
                case "4":
                    let colossus = Colossus()
                    addCharaInTeam(colossus)
                    rename(colossus)
                default:
                    print("Please select a correct number !")
                    createTeam()
                }
            }
        }
    }
    
    //---------------------------//
    //MARK: - Private Func
    //---------------------------//
    
    private func addCharaInTeam(_ fighter: Character) {
        if team.count < 3 {
            print("You add an ally")
            team.append(fighter)
        } else {
            print("You team is full")
        }
    }
    
    private func rename(_ fighter: Character) {
        print("Chose the name of your fighters")
        if let name = readLine()?.lowercased() {
            if nameIsDifferent(of: name) == true {
                fighter.name = name
                print("You choose \(fighter.name), select another number")
            } else {
                rename(fighter)
            }
        }
    }
    
    private func nameIsDifferent(of name: String) -> Bool {
        for character in team {
            if character.name == name {
                print("You already have a character with this name choose another one.")
                return false
            }
        }
        return true
    }
    
    
    func checkIfDeadInTeam() {
        for (index, character) in team.enumerated() {
            if character.life <= 0 {
                team.remove(at: index)
                print("Character's left: \(team.count)")
            }
        }
    }
}
