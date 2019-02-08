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
        
        //Player
        var appleNode: SKSpriteNode?
        //Carga de las imagenes del joystick
        var joystickStickImageEnabled = true {
            didSet {
                let image = joystickStickImageEnabled ? UIImage(named: "jStick") : nil
                rotateAnalogStick.stick.image = image
            }
        }
        
        var joystickSubstrateImageEnabled = true {
            didSet {
                let image = joystickSubstrateImageEnabled ? UIImage(named: "jSubstrate") : nil
                rotateAnalogStick.substrate.image = image
            }
        }
        //Creacion del Joystick
        let rotateAnalogStick = AnalogJoystick(diameter: 110) // from Class
        
        
        override func didMove(to view: SKView) {
            /* Setup your scene here */
            backgroundColor = UIColor.white
            physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            rotateAnalogStick.position = CGPoint(x:-self.frame.maxY/2+rotateAnalogStick.radius, y:-self.frame.maxX/2+rotateAnalogStick.radius+10)
            addChild(rotateAnalogStick)
            
            //al mover el Joystick cambia la orientacion del jugador
            rotateAnalogStick.trackingHandler = { [unowned self] jData in
                self.appleNode?.zRotation = jData.angular
            }
            //Al dejar de moverlo el personaje debe quedar en la misma posicion
            
            
            joystickStickImageEnabled = true
            joystickSubstrateImageEnabled = true
            
            //inicia al personaje
            addApple(CGPoint(x: frame.midX, y: frame.midY))
            
            view.isMultipleTouchEnabled = true
        }
        
        func addApple(_ position: CGPoint) {
            
            guard let appleImage = UIImage(named: "apple") else {
                return
            }
            
            let texture = SKTexture(image: appleImage)
            let apple = SKSpriteNode(texture: texture)
            apple.physicsBody = SKPhysicsBody(texture: texture, size: apple.size)
            apple.physicsBody!.affectedByGravity = false
            apple.position = position
            addChild(apple)
            appleNode = apple
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
    }
}
