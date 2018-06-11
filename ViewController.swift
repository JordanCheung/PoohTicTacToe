//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jordan on 2018-06-10.
//  Copyright © 2018 Jordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var isGameActive = true
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                               [0, 3, 6], [1, 4, 7], [2, 5, 8],
                               [0, 4, 8], [2, 4, 6]]
    
    @IBOutlet weak var winningMessage: UILabel!
    
    @IBAction func gamePiece(_ sender: AnyObject) {
        if (gameState[sender.tag - 1] == 0 && isGameActive == true)
        {
            gameState[sender.tag - 1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "pooh_icon"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "piglet_icon"), for: UIControlState())
                activePlayer = 1
            }
        }
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                isGameActive = false
                if gameState[combination[0]] == 1
                {
                    winningMessage.backgroundColor = UIColor.red
                    winningMessage.textColor = UIColor.yellow
                    winningMessage.text = "Pooh Won!"
                }
                else
                {
                    winningMessage.backgroundColor = UIColor.magenta
                    winningMessage.textColor = UIColor.white
                    winningMessage.text = "Piglet Won!"
                }
                playAgainButton.isHidden = false;
                winningMessage.isHidden = false;
            }
        }
        // Handling Ties
        isGameActive = false
        for i in gameState
        {
            if i == 0
            {
                isGameActive = true
                break
            }
        }
        if isGameActive == false
        {
            winningMessage.backgroundColor = UIColor.black
            winningMessage.textColor = UIColor.white
            winningMessage.text = "Draw"
            winningMessage.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isGameActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        winningMessage.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

