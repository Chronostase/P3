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
            }
        }
    }
    
    func selectTarget() {
        if let userChoice = readLine() {
            switch userChoice {
            case "1":
                targetCharacter = team[0]
            case "2":
                targetCharacter = team[1]
            case "3":
                targetCharacter = team[2]
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
                    let fighter = Fighter()
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
        }
    }
    
    private func rename(_ fighter: Character) {
        print("Chose the name of your fighters")
        if let name = readLine()?.lowercased() {
            if nameIsDifferent(of: name) == true {
                fighter.name = name
                print("You choose \(fighter.name)")
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
}
