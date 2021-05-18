//
//  ViewController.swift
//  SquareProgrammaticUI
//
//  Created by Ari on 4/28/21.
//

import UIKit

class SquareController: UIViewController {
    
    // MARK: - Properties
    let diceLabel = UILabel()
    let firstDiceImageView = UIImageView()
    let secondDiceImageView = UIImageView()
    let rollButton = UIButton()
    let stackView1 = UIStackView() //vertical StackView
    let stackView2 = UIStackView() //horizontal StackView
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    //MARK: - UI Setup
    
    func setUpUI() {
        view.backgroundColor = UIColor(named: "CreamColor")
        setUpStackView()
        setUpDiceLabel()
        setUpFirstDiceImageView()
        setUpSecondDiceImageView()
        setUpRollButton()
        
    }

    func setUpDiceLabel() {
        
        diceLabel.translatesAutoresizingMaskIntoConstraints = false
        diceLabel.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        diceLabel.text = "🎲 DICE ROLLER 🎲"
        diceLabel.textAlignment = .center
        
        stackView1.addArrangedSubview(diceLabel)
        
    }
    
    func setUpStackView() {
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.distribution = .fillProportionally
        stackView1.alignment = .center
        stackView1.spacing = 35
        view.addSubview(stackView1)
        
        
        NSLayoutConstraint.activate([
            stackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //DICES
        
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal
        stackView2.distribution = .equalSpacing
        stackView2.alignment = .center
        stackView2.spacing = 50
        view.addSubview(stackView2)

    }
    
    
    func setUpFirstDiceImageView() {

        firstDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        firstDiceImageView.image = UIImage(named: "dice1")
        stackView2.addArrangedSubview(firstDiceImageView)
        stackView1.addArrangedSubview(stackView2)

        let firstDiceImageViewConstraints: [NSLayoutConstraint] = [
            firstDiceImageView.widthAnchor.constraint(equalToConstant: 120),
            firstDiceImageView.heightAnchor.constraint(equalToConstant: 120)

        ]

        NSLayoutConstraint.activate(firstDiceImageViewConstraints)
        
        
    }
    
    func setUpSecondDiceImageView() {
        
        secondDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        secondDiceImageView.image = UIImage(named: "dice1")
        stackView2.addArrangedSubview(secondDiceImageView)
        stackView1.addArrangedSubview(stackView2)

        let secondDiceImageViewConstraints: [NSLayoutConstraint] = [
            secondDiceImageView.widthAnchor.constraint(equalToConstant: 120),
            secondDiceImageView.heightAnchor.constraint(equalToConstant: 120)

        ]

        NSLayoutConstraint.activate(secondDiceImageViewConstraints)
    }

    func setUpRollButton() {
        
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        rollButton.layer.cornerRadius = 20
        rollButton.backgroundColor = .red
        rollButton.setTitle("Roll", for: .normal)
        stackView1.addArrangedSubview(rollButton)
        
        let rollButtonConstraints: [NSLayoutConstraint] = [

            rollButton.widthAnchor.constraint(equalToConstant: 120),
            rollButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(rollButtonConstraints)
        
        rollButton.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        
    }
    
    
    //MARK: - Actions
    
    @objc func rollButtonPressed() {
        
        let dicesArray = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
        
        firstDiceImageView.image = dicesArray.randomElement()
        secondDiceImageView.image = dicesArray.randomElement()
        
    
    }
}

