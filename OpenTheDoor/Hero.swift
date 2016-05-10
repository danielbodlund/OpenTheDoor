//
//  Hero.swift
//  OpenTheDoor
//
//  Created by Daniel Hansson on 2016-05-10.
//  Copyright © 2016 Daniel Hansson. All rights reserved.
//

import Foundation

class Hero {
    var name: String
    var type: String
    var skills: [String]
    
    init(name: String, type: String, skill: String) {
        self.name = name
        self.type = type
        self.skills = [skill]
    }
    
    func printHeroDescription(){
        print(" \(name) The \(type) with \(skills[0])")
    }
}