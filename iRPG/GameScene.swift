//
//  GameScene.swift
//  iRPG
//
//  Created by Israel on 2/8/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
        //Scene
        var CavernBackground = SKTileMapNode()
    
        var movX = 0
        var movY = 0
    
        //Player
        var appleNode = SKSpriteNode()
        var playerNode = SKSpriteNode()
        let texturePlayerN = SKTexture(imageNamed: "player0")
        let texturePlayerNE = SKTexture(imageNamed: "player1")
        let texturePlayerE = SKTexture(imageNamed: "player2")
        let texturePlayerSE = SKTexture(imageNamed: "player3")
        let texturePlayerS = SKTexture(imageNamed: "player4")
        let texturePlayerSW = SKTexture(imageNamed: "player5")
        let texturePlayerW = SKTexture(imageNamed: "player6")
        let texturePlayerNW = SKTexture(imageNamed: "player7")
        //Carga de las imagenes del joystick
        var joystickStickImageEnabled = true {
            didSet {
                let image = joystickStickImageEnabled ? UIImage(named: "jStick2") : nil
                
                rotateAnalogStick.stick.image = image
            }
        }
        
        var joystickSubstrateImageEnabled = true {
            didSet {
                let image = joystickSubstrateImageEnabled ? UIImage(named: "jSubstrate2") : nil
                rotateAnalogStick.substrate.image = image
            }
        }
        //Creacion del Joystick
        let rotateAnalogStick = AnalogJoystick(diameter: 160) // from Class
        
        
        override func didMove(to view: SKView) {
            
            physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            rotateAnalogStick.position = CGPoint(x:-self.frame.maxX+rotateAnalogStick.radius+65, y:-self.frame.maxY+rotateAnalogStick.radius+65)
            addChild(rotateAnalogStick)
            
            
            //al mover el Joystick cambia la orientacion del jugador
            rotateAnalogStick.trackingHandler = { [unowned self] jData in
                self.CavernBackground.zRotation=jData.angular
                
                if (jData.angular >= -0.375 && jData.angular < 0.375){
                    //vista N
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerN))
                    self.movX = self.movX + 1
                    
                }else if (jData.angular >= 0.375 && jData.angular < 1.125){
                    //vista NW
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerNW))
                    self.movX = self.movX + 1
                    self.movY = self.movY - 1
                    
                }else if (jData.angular >= 1.125 && jData.angular < 1.875){
                   //vista W
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerW))
                    self.movY = self.movY - 1
                    
                }else if (jData.angular >= 1.875 && jData.angular < 2.675){
                    //vista SW
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerSW))
                    self.movX = self.movX - 1
                    self.movY = self.movY - 1
                    
                }else if (jData.angular >= 2.625 || jData.angular < -2.625){
                    //vista S
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerS))
                    
                }else if (jData.angular >= -2.625 && jData.angular < -1.875){
                    //vista SE
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerSE))
                    
                }else if (jData.angular >= -1.875 && jData.angular < -1.125){
                    //vista E
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerE))
                    
                }else if (jData.angular >= -1.125 && jData.angular < -0.375){
                    //vista NE
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerNE))
                }
            }
            
            
            //self.CavernBackground.position = CGPoint(x: movX, y: movY)
            
            joystickStickImageEnabled = true
            joystickSubstrateImageEnabled = true
            
            addPlayer(CGPoint(x: frame.midX, y: frame.midY))
            
            view.isMultipleTouchEnabled = true
        }
    
    func addPlayer(_ position: CGPoint) {
        
        let player = SKSpriteNode(texture: texturePlayerS)
        player.physicsBody = SKPhysicsBody(texture: texturePlayerS, size: player.size)
        player.physicsBody!.affectedByGravity = false
        player.position = position
        addChild(player)
        playerNode = player
        
    }
        
    
    
    func touchDown(atPoint pos : CGPoint) {
        /*if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }*/
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       /* if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }*/
    }
    
    func touchUp(atPoint pos : CGPoint) {
       /* if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }*/
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }*/
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        let position=playerNode.position
        let column = CavernBackground.tileColumnIndex(fromPosition: position)
        let row = CavernBackground.tileRowIndex(fromPosition: position)
        
        let tile = CavernBackground.tileDefinition(atColumn: column, row: row)
        
        CavernBackground.position = CGPoint(x: movX, y: movY)
        //if tile == pared -> Deten el movimento
        
        
        
    }
}
