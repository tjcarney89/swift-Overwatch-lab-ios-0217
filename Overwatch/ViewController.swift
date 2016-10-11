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
    
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var secondNameView: UIView!
    @IBOutlet weak var thirdNameView: UIView!
    @IBOutlet weak var fourthNameView: UIView!
    @IBOutlet weak var fifthNameView: UIView!
    @IBOutlet weak var sixthNameView: UIView!
    
    @IBOutlet weak var firstLineView: UIView!
    @IBOutlet weak var secondLineView: UIView!
    @IBOutlet weak var thirdLineView: UIView!
    @IBOutlet weak var fourthLineView: UIView!
    @IBOutlet weak var fifthLineView: UIView!
    @IBOutlet weak var sixthLineView: UIView!
    
    var nameLabels: [UILabel]!
    var heroButtons: [OverwatchButton]!
    var nameViews: [UIView]!
    var lineViews: [UIView]!
    
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
        nameLabels.forEach { $0.text = ""; $0.backgroundColor = UIColor.clear }
        nameViews.forEach { $0.layer.borderWidth = 0.0 }
        lineViews.forEach { $0.backgroundColor = UIColor.clear }
        
        updateLabels(with: sender.hero)

        sender.layer.borderWidth = 4.0
        
        let index = heroButtons.index(of: sender)!
        
        let nameLabel = nameLabels[index]
        nameLabel.text = sender.hero.name.description
        nameLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let nameView = nameViews[index]
        nameView.layer.borderWidth = 4.0
        
        let lineView = lineViews[index]
        lineView.backgroundColor = UIColor.green
    }
    
    func updateLabels(with hero: OverwatchHero) {
        nameLabel.text = hero.name.description
        typeLabel.text = hero.heroType.description
        attackLabel.text = hero.fire()
        healLabel.text = hero.heal()
        hitPointsLabel.text = String(hero.hitPoints)
    }
    
    func createHeroes() {
        let heroes: [Hero] = [Hero(name: .ana), Hero(name: .reinhardt), Hero(name: .soldier76), Hero(name: .reaper), Hero(name: .lúcio), Hero(name: .winston)]
        
        for (index, hero) in heroes.enumerated() {
            let button = heroButtons[index]
            button.hero = hero
        }
    }
    
}


// MARK: - Setup Methods
extension ViewController {
    
    func setupButtons() {
        heroButtons = [firstHeroButton, secondHeroButton, thirdHeroButton, fourthHeroButton, fifthHeroButton, sixthHeroButton]
        nameLabels = [firstNameLabel, secondNameLabel, thirdNameLabel, fourthNameLabel, fifthNameLabel, sixthNameLabel]
        nameViews = [firstNameView, secondNameView, thirdNameView, fourthNameView, fifthNameView, sixthNameView]
        lineViews = [firstLineView, secondLineView, thirdLineView, fourthLineView, fifthLineView, sixthLineView]

        heroButtons.forEach { $0.layer.borderColor = UIColor.green.cgColor }
        nameViews.forEach { $0.layer.borderColor = UIColor.green.cgColor;  $0.backgroundColor = UIColor.clear }
        lineViews.forEach { $0.backgroundColor = UIColor.clear }
        nameLabels.forEach { $0.text = ""; $0.backgroundColor = UIColor.clear }
    }

}
