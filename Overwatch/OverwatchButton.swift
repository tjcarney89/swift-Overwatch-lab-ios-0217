//
//  OverwatchButton.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

final class OverwatchButton: UIButton {
    
    var hero: OverwatchHero! {
        didSet { setButtonContents() }
    }
    
    func setButtonContents() {
        guard let hero = hero else { return }
        switch hero.name {
        case .lúcio:
            setBackgroundImage(#imageLiteral(resourceName: "Lúcio"), for: .normal)
        case .torbjörn:
            setBackgroundImage(#imageLiteral(resourceName: "Torbjörn"), for: .normal)
        default:
            let image = UIImage(named: "\(hero.name)")
            setBackgroundImage(image, for: .normal)
        }
    }

}
