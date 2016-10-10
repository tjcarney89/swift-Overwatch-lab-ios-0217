//
//  ViewController.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstHeroButton: OverwatchButton!
    @IBOutlet weak var secondHeroButton: OverwatchButton!
    @IBOutlet weak var thirdHeroButton: OverwatchButton!
    @IBOutlet weak var fourthHeroButton: OverwatchButton!
    @IBOutlet weak var fifthHeroButton: OverwatchButton!
    @IBOutlet weak var sixthHeroButton: OverwatchButton!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var healLabel: UILabel!
    @IBOutlet weak var hitPointsLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var thirdNameLabel: UILabel!
    @IBOutlet weak var fourthNameLabel: UILabel!
    @IBOutlet weak var fifthNameLabel: UILabel!
    @IBOutlet weak var sixthNameLabel: UILabel!
    
    var nameLabels: [UILabel]!
    var heroButtons: [OverwatchButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createHeroes()
    }
    
    @IBAction func overwatchButtonTapped(_ sender: OverwatchButton) {
        heroButtons.forEach { $0.layer.borderWidth = 0.0 }
        nameLabels.forEach { $0.layer.borderWidth = 0.0; $0.text = "" }
        sender.layer.borderColor = UIColor.green.cgColor
        sender.layer.borderWidth = 4.0
        updateLabels(with: sender.hero)
        let index = heroButtons.index(of: sender)!
        let nameLabel = nameLabels[index]
        nameLabel.layer.borderWidth = 4.0
        nameLabel.layer.borderColor = UIColor.green.cgColor
        nameLabel.text = sender.hero.name.description
    }
    
    func updateLabels(with hero: OverwatchHero) {
        nameLabel.text = hero.name.description
        typeLabel.text = hero.heroType.description
        attackLabel.text = hero.fire()
        healLabel.text = hero.heal()
        hitPointsLabel.text = String(hero.hitPoints)
    }
    
    func createHeroes() {
        let heroes: [Hero] = [Hero(name: .ana), Hero(name: .bastion), Hero(name: .genji), Hero(name: .junkrat), Hero(name: .lúcio), Hero(name: .mcCree)]
        
        for (index, hero) in heroes.enumerated() {
            let button = heroButtons[index]
            print(hero)
            button.hero = hero
        }
    }
    
}


// MARK: - Setup Methods
extension ViewController {
    
    func setupButtons() {
        heroButtons = [firstHeroButton, secondHeroButton, thirdHeroButton, fourthHeroButton, fifthHeroButton, sixthHeroButton]
        
        nameLabels = [firstNameLabel, secondNameLabel, thirdNameLabel, fourthNameLabel, fifthNameLabel, sixthNameLabel]
        
        nameLabels.forEach { $0.text = "" }
    }
    
    

}
