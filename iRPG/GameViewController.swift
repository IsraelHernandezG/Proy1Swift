//
//  GameViewController.swift
//  iRPG
//
//  Created by Israel on 2/8/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let gameScene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                gameScene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(gameScene)
                view.ignoresSiblingOrder = false
            }
    
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
            
        }
    }
    
    func mainMenuLoad(){
        self.dismiss(animated: true, completion: nil)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewControllerDos = storyBoard.instantiateViewController(withIdentifier: "MainMenu")
        self.present(ViewControllerDos, animated: true, completion: nil)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
