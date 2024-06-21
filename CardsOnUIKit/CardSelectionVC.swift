//
//  CardSelectionVC.swift
//  CardsOnUIKit
//
//  Created by BS00834 on 21/6/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    
    @IBOutlet var cardImageView: UIImageView!
    
    var timer : Timer!
    
    var cards : [UIImage] = Card.allValues
    
    //Outlet Collection
    
    @IBOutlet var buttons: [UIButton]!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Giving Corner Radius to the Buttons - which cannot bve given in Story Board
       
        for button in buttons {
            button.layer.cornerRadius = 10
        }
        
        startTimer()
        /*
         stopButton.layer.cornerRadius = 8
         restartButton.layer.cornerRadius = 8
         rulesButton.layer.cornerRadius = 8
         */
       
        
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        timer.invalidate()
        
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonTapped(_ sender: UIButton) {
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard(){
        
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
}
