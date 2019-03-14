//
//  GameScene.swift
//  iRPG
//
//  Created by Israel on 2/8/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import SpriteKit
import Foundation
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
        //Camera
        var cam: SKCameraNode?
        // Mapa
        var map = SKNode()
    
        //TileMapCategories
        let Wall1Category: UInt32 = 0x01 << 1
        let Wall2Category: UInt32 = 0x01 << 2
        let Wall3Category: UInt32 = 0x01 << 3
        let Wall4Category: UInt32 = 0x01 << 4
        //Player
        var playerNode = SKSpriteNode()
        let escala: CGFloat = 6.0
        // Controles de la fisica
        var velocidadXp = 5.0
        var velocidadXm = 5.0
        var velocidadYp = 5.0
        var velocidadYm = 5.0
        var topeYp: CGFloat = 0.0
        var topeYm: CGFloat = 0.0
        var topeXp: CGFloat = 0.0
        var topeXm: CGFloat = 0.0
        var bandera = 0
        var bandera2 = 0
        var bandera3 = 0
        var bandera4 = 0
        // Texturas jugador
        let texturePlayerN = SKTexture(image: UIImage(named: "00-vistaN")!)
        let texturePlayerNE = SKTexture(image: UIImage(named: "01-vistaNE")!)
        let texturePlayerE = SKTexture(image: UIImage(named: "02-vistaE")!)
        let texturePlayerSE = SKTexture(image: UIImage(named: "03-vistaSE")!)
        let texturePlayerS = SKTexture(image: UIImage(named: "04-vistaS")!)
        let texturePlayerSW = SKTexture(image: UIImage(named: "05-vistaSW")!)
        let texturePlayerW = SKTexture(image: UIImage(named: "06-vistaW")!)
        let texturePlayerNW = SKTexture(image: UIImage(named: "07-vistaNW")!)
        let texturePlayerMask = SKTexture(image: UIImage(named: "Mascara")!)
        let playerCategory: UInt32 = 0x01 << 0
        //
        let textureMenuButton = SKTexture(image: UIImage(named: "menuButton")!)
        let textureMenuButtonPressed = SKTexture(image: UIImage(named: "menuButtonPressed")!)
        let textureButtonUp = SKTexture(image: UIImage(named: "shadedLightUp")!)
        let textureButtonDown = SKTexture(image: UIImage(named: "shadedLightDown")!)
        let textureButtonLeft = SKTexture(image: UIImage(named: "shadedLightLeft")!)
        let textureButtonRight = SKTexture(image: UIImage(named: "shadedLightRight")!)
        let textureButtonUpPres = SKTexture(image: UIImage(named: "shadedLightUpPressed")!)
        let textureButtonDownPres = SKTexture(image: UIImage(named: "shadedLightDownPressed")!)
        let textureButtonLeftPres = SKTexture(image: UIImage(named: "shadedLightLeftPressed")!)
        let textureButtonRightPres = SKTexture(image: UIImage(named: "shadedLightRightPressed")!)
        var menuButton = SKSpriteNode()
        var buttonUp  = SKSpriteNode()
        var buttonDown = SKSpriteNode()
        var buttonRight = SKSpriteNode()
        var buttonLeft = SKSpriteNode()
    
        // Manejo de archivos
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    
        //Carga de las imagenes del joystick
        var joystickStickImageEnabled = true {
            didSet {
                let image = joystickStickImageEnabled ? UIImage(named: "shadedLightStick") : nil
                rotateAnalogStick.stick.image = image
            }
        }
    
        var joystickSubstrateImageEnabled = true {
            didSet {
                let image = joystickSubstrateImageEnabled ? UIImage(named: "shadedLightSubstrate") : nil
                rotateAnalogStick.substrate.image = image
            }
        }
        //Creacion del Joystick
        let rotateAnalogStick = AnalogJoystick(diameter: 160) // from Class
    
    
    
    
        override func didMove(to view: SKView) {
            super.didMove(to: view)
            self.physicsWorld.contactDelegate = self
            self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
            
            loadLevel(1)
            
            //Camara
            cam = GameUI.init(self.frame).cam
            
            
            //Joystick
            rotateAnalogStick.position = CGPoint(x:-self.frame.maxX+rotateAnalogStick.radius+65, y:-self.frame.maxY+rotateAnalogStick.radius+65)
            rotateAnalogStick.zPosition = 3
            cam!.addChild(rotateAnalogStick)
            
            createUI()
            
            self.camera=cam
            self.addChild(cam!)
            
            
            
            // Movimiento del mapa
            var movX = 0.0
            var movY = 0.0
            //al mover el Joystick cambia la orientacion del jugador
            rotateAnalogStick.trackingHandler = { [unowned self] jData in
                
                if (jData.angular >= -0.375 && jData.angular < 0.375){
                    //vista N
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerN))
                    movX += 0.0
                    movY += 1.0 * self.velocidadYp
                    
                }else if (jData.angular >= 0.375 && jData.angular < 1.125){
                    //vista NW
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerNW))
                    movX -= 0.7072 * self.velocidadXm
                    movY += 0.7072 * self.velocidadYp
                    
                    
                }else if (jData.angular >= 1.125 && jData.angular < 1.875){
                   //vista W
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerW))
                    movX -= 1.0 * self.velocidadXm
                    movY += 0.0
                    
                }else if (jData.angular >= 1.875 && jData.angular < 2.675){
                    //vista SW
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerSW))
                    movX -= 0.7072 * self.velocidadXm
                    movY -= 0.7072 * self.velocidadYm
                    
                }else if (jData.angular >= 2.625 || jData.angular < -2.625){
                    //vista S
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerS))
                    movX += 0.0
                    movY -= 1.0 * self.velocidadYm
                    
                }else if (jData.angular >= -2.625 && jData.angular < -1.875){
                    //vista SE
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerSE))
                    movX += 0.7072 * self.velocidadXp
                    movY -= 0.7072 * self.velocidadYm
                    
                }else if (jData.angular >= -1.875 && jData.angular < -1.125){
                    //vista E
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerE))
                    movX += 1.0 * self.velocidadXp
                    movY += 0.0
                    
                }else if (jData.angular >= -1.125 && jData.angular < -0.375){
                    //vista NE
                    self.playerNode.run(SKAction.setTexture(self.texturePlayerNE))
                    movX += 0.7072 * self.velocidadXp
                    movY += 0.7072 * self.velocidadYp
                }
                
                self.playerNode.run(SKAction.moveTo(x: CGFloat(movX), duration: 0.1))
                self.playerNode.run(SKAction.moveTo(y: CGFloat(movY), duration: 0.1))
            }
            
            
            joystickStickImageEnabled = true
            joystickSubstrateImageEnabled = true
            
            playerNode = Player.init(CGPoint(x: frame.midX, y: frame.midY)).playerNode
            addChild(playerNode)
            
            
            view.isMultipleTouchEnabled = true
        }
    
    func createUI(){
        
        // Menu Button
        menuButton = SKSpriteNode(texture: textureMenuButton)
        menuButton.name = "Menu"
        menuButton.zPosition = 3
        menuButton.xScale = 2
        menuButton.yScale = 2
        menuButton.position = CGPoint(x: self.frame.maxX-80, y: self.frame.maxY-80)
        cam!.addChild(menuButton)
        
        // Action Buttons
        buttonUp = SKSpriteNode(texture: textureButtonUp)
        buttonUp.name = "Arriba"
        buttonUp.zPosition = 3
        buttonUp.xScale = 1.2
        buttonUp.yScale = 1.2
        buttonUp.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonUp.position = CGPoint(x: self.frame.maxX-150, y: -self.frame.maxY+190)
        cam!.addChild(buttonUp)
        
        buttonDown = SKSpriteNode(texture: textureButtonDown)
        buttonDown.name = "Abajo"
        buttonDown.zPosition = 3
        buttonDown.xScale = 1.2
        buttonDown.yScale = 1.2
        buttonDown.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonDown.position = CGPoint(x: buttonUp.position.x, y: buttonUp.position.y-110)
        cam!.addChild(buttonDown)
        
        buttonRight = SKSpriteNode(texture: textureButtonRight)
        buttonRight.name = "Der"
        buttonRight.zPosition = 3
        buttonRight.xScale = 1.2
        buttonRight.yScale = 1.2
        buttonRight.position = CGPoint(x: buttonUp.position.x+50, y: buttonUp.position.y-55)
        cam!.addChild(buttonRight)
        
        buttonLeft = SKSpriteNode(texture: textureButtonLeft)
        buttonLeft.name = "Izq"
        buttonLeft.zPosition = 3
        buttonLeft.xScale = 1.2
        buttonLeft.yScale = 1.2
        buttonLeft.position = CGPoint(x: buttonUp.position.x-50, y: buttonUp.position.y-55)
        cam!.addChild(buttonLeft)
        
       
    }
    
    
    func readFile() -> NSString{
        
        let level1Dir = "/Users/israel/Desktop/Proys Xcode/iRPG/iRPG/iRPG/Niveles.xcassets/nivel_1.txt"
        //let level1Dir = "/Users/Israel/Desktop/Proys Xcode/iRPG/iRPG/Documents/Niveles/nivel_1.txt"
        
        let file: FileHandle? = FileHandle(forReadingAtPath: level1Dir)
        let vacio = NSString(string: "")
        
        if file != nil {
            let data = file?.readDataToEndOfFile()
            file?.closeFile()
            if let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
                //print(str)
                return str
            }
            
        } else {
            print("Ooops! Ha ocurrido un error!")
        }
        
        return vacio
    }
    
    
    func loadLevel(_ level: Int){
        
        switch level {
        case 1:
            //lectura de archivo
            let maplevel = readFile()
            if maplevel != ""{
                let cadena = maplevel as String
                map = TileMap.init(cadena).map
                //se agrega map a la vista
                self.addChild(map)
                map.xScale = 6.0
                map.yScale = 6.0
                
                print("Done")
            }
            
            
        default:
            //Cargar un mapa alternativo o dejar el menu
            print("No se cargo el nivel")
        }
    
    }
    
    
    
    // Manejo de colisiones
    func didBegin(_ contact: SKPhysicsContact) {
        
         var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        
        if ((firstBody.categoryBitMask & playerCategory != 0) &&
            (secondBody.categoryBitMask & Wall1Category != 0)){
            
            if (topeYp == 0.0){
                velocidadYp = 0.0
                topeYp = playerNode.position.y
                bandera = 1
            }else{
                bandera = 1
            }
        }
        
        if ((firstBody.categoryBitMask & playerCategory != 0) &&
            (secondBody.categoryBitMask & Wall2Category != 0)){
            
            //print("\nLeft Wall Contact:\nx: \(playerNode.position.x), y: \(playerNode.position.y)")
            if (topeXm == 0.0){
                velocidadXm = 0.0
                topeXm = playerNode.position.x
                bandera2 = 1
                
            }else{
                bandera2 = 1
            }
        }
        
        if ((firstBody.categoryBitMask & playerCategory != 0) &&
            (secondBody.categoryBitMask & Wall3Category != 0)){
            
            //print("\nRight Wall Contact:\nx: \(playerNode.position.x), y: \(playerNode.position.y)")
            if (topeXp == 0.0){
                velocidadXp = 0.0
                topeXp = playerNode.position.x
                bandera3 = 1
             
             }else{
                bandera3 = 1
             }
        }
        
        
        if ((firstBody.categoryBitMask & playerCategory != 0) &&
            (secondBody.categoryBitMask & Wall4Category != 0)){
            
            if (topeYm == 0.0){
                velocidadYm = 0.0
                topeYm = playerNode.position.y
                bandera4 = 1
            }else{
                bandera4 = 1
            }
        }
        
        
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            //print("toque de pantalla")
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            
            if let name = touchedNode.name
            {
                if name == "Menu"{
                    self.menuButton.run(SKAction.setTexture(textureMenuButtonPressed))
                }else if name == "Arriba"{
                    self.buttonUp.run(SKAction.setTexture(textureButtonUpPres))
                }else if name == "Abajo"{
                    self.buttonDown.run(SKAction.setTexture(textureButtonDownPres))
                }else if name == "Der"{
                    self.buttonRight.run(SKAction.setTexture(textureButtonRightPres))
                }else if name == "Izq"{
                    self.buttonLeft.run(SKAction.setTexture(textureButtonLeftPres))
                }
                
                
                
                
                
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.menuButton.run(SKAction.setTexture(textureMenuButton))
        self.buttonUp.run(SKAction.setTexture(textureButtonUp))
        self.buttonDown.run(SKAction.setTexture(textureButtonDown))
        self.buttonRight.run(SKAction.setTexture(textureButtonRight))
        self.buttonLeft.run(SKAction.setTexture(textureButtonLeft))
        
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        super.update(currentTime)
        
        let posJugador = playerNode.position
        
        if let camera = cam{
            camera.position=posJugador
            if (bandera == 1){
                if (posJugador.y >= topeYp){
                    velocidadYp = 0.0
                    
                }else if (posJugador.y < topeYp){
                    //
                    bandera = 0
                }
            }else{
                topeYp = 0.0
                velocidadYp = 5.0
            }
            //+++++++++++++++++++++++
            if (bandera2 == 1){
                if (posJugador.x <= topeXm){
                    velocidadXm = 0.0
                    
                }else if (posJugador.x > topeXm){
                    //
                    bandera2 = 0
                }
            }else{
                topeXm = 0.0
                velocidadXm = 5.0
            }
            //**************************
            if (bandera3 == 1){
                if (posJugador.x >= topeXp){
                    velocidadXp = 0.0
                    
                }else if (posJugador.x < topeXp){
                    //
                    bandera3 = 0
                }
            }else{
                topeXp = 0.0
                velocidadXp = 5.0
            }
            //---------------------------
            if (bandera4 == 1){
                if (posJugador.y <= topeYm){
                    velocidadYm = 0.0
                    
                }else if (posJugador.y > topeYm){
                    //
                    bandera4 = 0
                }
            }else{
                topeYm = 0.0
                velocidadYm = 5.0
            }
            
        }
    
    }

}
