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
    //Mark Properties
    //---------------------------//
    let player = Player()
    var infinity = true
    
    //---------------------------//
    //Mark Func
    //---------------------------//
    
    func launchSoft() {
        setup()
        launch()
    }
    
    private func setup() {
        presentation()
        player.createTeam()
    }
    
    private func launch() {
        while infinity == true {
            if player.team.count == 3 {
                print(player.team[0].name)
                print(player.team[1].name)
                print(player.team[2].name)
                infinity = false
            }
        }
    }
    
    private func presentation() {
        print("Welcome to Fighter'z, all you need to do is to select three fighter and go to the fight !")
        selectCharacter()
    }
    
    func selectCharacter() {
        print("Now you just have to add three characters in your team !"
        + "\n Which character do you want to add ?"
        + "\n1 Fighter : A balanced fighter who start with a sword."
        + "\n2 Wizard : His main ability is an heal."
        + "\n3 Dward : A character who focused on attack with low life."
        + "\n4 Colossus : A kind of armed tank")
    }
}
