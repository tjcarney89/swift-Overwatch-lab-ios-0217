//
//  Heroes.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

typealias Health = Int

protocol Weapon {
    func fire() -> String
    func heal() -> String
    
}

protocol OverwatchHero: Weapon, CustomStringConvertible {
    var name: HeroName { get set }
    var hitPoints: Health { get set }
    var heroType: HeroType { get }
    func produceHeroType() -> HeroType
    func produceInitialHitPoints() -> Health
    
}

extension OverwatchHero {
    
    func fire() -> String {
        switch heroType {
        case .offense:
            return "Role: 👊🏽"
        case .defense:
            return "Role: ✋🏽"
        case .support:
            return "Role: 👐🏽"
        case .tank:
            return "Role: ✊🏽"
        }
    }
    
    func heal() -> String {
        switch heroType {
        case .offense:
            return "Heal: ✖️"
        case .defense:
            return "Heal: ✖️"
        case .support:
            return "Heal: ❤️"
        case .tank:
            return "Heal: ✖️"
        }
    }
    
}

extension OverwatchHero {
    
    func produceHeroType() -> HeroType {
        switch name {
        case .genji, .mcCree, .pharah, .reaper, .soldier76, .tracer: return HeroType.offense
        case .bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker: return HeroType.defense
        case .reinhardt, .roadhog, .winston, .zarya: return HeroType.tank
        case .ana, .lúcio, .symmetra, .zenyatta: return HeroType.support
        }
    }
}

extension OverwatchHero {
    
    func produceInitialHitPoints() -> Health {
        switch heroType {
        case .offense: return 250
        case .defense: return 250
        case .support: return 150
        case .tank: return 500
        }
    }
    
}

extension OverwatchHero {
    var description: String {
        return "Name: \(name)\nType: \(heroType)\nAttack: \(fire())\nHeal: \(heal())\nHit Points: \(hitPoints)"
    }
}

enum HeroType: CustomStringConvertible {
    case offense, defense, tank, support
    
    var description: String {
        switch self {
        case .offense:
            return "Offense: 💥"
        case .defense:
            return "Defense: 🛡"
        case .support:
            return "Support: 🚑"
        case .tank:
            return "Tank: 🐼"
        }
        
    }
}

enum HeroName: CustomStringConvertible {
    case genji, mcCree, pharah, reaper, soldier76, tracer, bastion, hanzo, junkrat, mei, torbjörn, widowmaker, reinhardt, roadhog, winston, zarya, ana, lúcio, symmetra, zenyatta
    
    var description: String {
        switch self {
        case .genji: return "Genji"
        case .mcCree: return "McCree"
        case .pharah: return "Pharah"
        case .reaper: return "Reaper"
        case .soldier76: return "Soldier 76"
        case .tracer: return "Tracer"
        case .bastion: return "Bastion"
        case .hanzo: return "Hanzo"
        case .junkrat: return "Junkrat"
        case .mei: return "Mei"
        case .torbjörn: return "Torbjörn"
        case .widowmaker: return "Widowmaker"
        case .reinhardt: return "Reinhardt"
        case .roadhog: return "Roadhog"
        case .winston: return "Winston"
        case .zarya: return "Zarya"
        case .ana: return "Ana"
        case .lúcio: return "Lúcio"
        case .symmetra: return "Symmetra"
        case .zenyatta: return "Zenyatta"
        }
    }
    
}





