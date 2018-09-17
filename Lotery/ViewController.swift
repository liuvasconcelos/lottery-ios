//
//  ViewController.swift
//  Lotery
//
//  Created by Stant 02 on 17/09/18.
//  Copyright © 2018 Liu Vasconcelos. All rights reserved.
//
import Foundation
import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

infix operator >-<

func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
    
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    
    return result.sorted()
}


class ViewController: UIViewController {

    @IBOutlet weak var gameType: UILabel!
    @IBOutlet weak var barOfOptions: UISegmentedControl!
    @IBOutlet weak var firstNumberSorted: UIButton!
    @IBOutlet weak var secondNumberSorted: UIButton!
    @IBOutlet weak var thirdNumberSorted: UIButton!
    @IBOutlet weak var forthNumberSorted: UIButton!
    @IBOutlet weak var fifthNumberSorted: UIButton!
    @IBOutlet weak var sixthNumberSorted: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(for: .megasena)
    }

    private func configureView(for type: GameType) {
        gameType.text = type.rawValue
        var game: [Int] = []
    
        switch type {
            case .megasena:
                game = 6>-<60
                firstNumberSorted.setTitle(String(game[0]), for: .normal)
                secondNumberSorted.setTitle(String(game[1]), for: .normal)
                thirdNumberSorted.setTitle(String(game[2]), for: .normal)
                forthNumberSorted.setTitle(String(game[3]), for: .normal)
                fifthNumberSorted.setTitle(String(game[4]), for: .normal)
                sixthNumberSorted.setTitle(String(game[5]), for: .normal)
                sixthNumberSorted.isHidden = false
            
            default:
                game = 5>-<80
                firstNumberSorted.setTitle(String(game[0]), for: .normal)
                secondNumberSorted.setTitle(String(game[1]), for: .normal)
                thirdNumberSorted.setTitle(String(game[2]), for: .normal)
                forthNumberSorted.setTitle(String(game[3]), for: .normal)
                fifthNumberSorted.setTitle(String(game[4]), for: .normal)
                sixthNumberSorted.isHidden = true
        }
        
    
    }
    
    @IBAction func generateGame(_ sender: Any) {
        switch barOfOptions.selectedSegmentIndex {
            case 0:
                configureView(for: .megasena)
            default:
                configureView(for: .quina)
        }
        
    }
    
   
}

