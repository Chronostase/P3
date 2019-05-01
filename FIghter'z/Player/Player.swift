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
    //Mark Properties
    //---------------------------//
    
    var team: [Character] = []
    var opponentTeam: [Character] = []
    
    //---------------------------//
    //Mark Func
    //---------------------------//
    
    func createTeam() {
        while team.count < 3 {
            if let userChoice = readLine() {
                switch userChoice {
                case "1":
                    let fighter = Fighter()
                    addCharacter(fighter)
                    rename(fighter)
                case "2":
                    let wizard = Wizard()
                    addCharacter(wizard)
                    rename(wizard)
                case "3":
                    let dwarf = Dwarf()
                    addCharacter(dwarf)
                    rename(dwarf)
                case "4":
                    let colossus = Colossus()
                    addCharacter(colossus)
                    rename(colossus)
                default:
                    print("Please select a correct number !")
                }
            }
        }
    }
    
    private func addCharacter(_ fighter: Character) {
        team.append(fighter)
    }
    
    private func rename(_ fighter: Character) {
        print("Chose the name of your fighters")
        if let name = readLine()?.lowercased() {
            if nameIsDifferent(of: fighter,name) == true {
                fighter.name = name
                print("You choose \(fighter.name)")
            } else {
                rename(fighter)
            }
        }
    }
    
    func nameIsDifferent(of fighter: Character,_ name: String) -> Bool {
        for character in team {
            if character.name == name {
                print("You already have a character with this name choose another one.")
                return false
            }
        }
        return true
    }
}
