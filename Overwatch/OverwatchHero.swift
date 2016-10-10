//
//  OverwatchHero.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

struct Hero: OverwatchHero {
    var name: HeroName
    var heroType: HeroType { return produceHeroType() }
    var hitPoints: Health = 0.0
    
    init (name: HeroName) {
        self.name = name
        hitPoints = produceInitialHitPoints()
    }
    
}
