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
        //Elementos de la intefaz
        var interfaz = SKNode()
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
 
    
        // Elementos del Menu
        var contextoMenu = SKNode()
    
        let textureMenuTitleLeft = SKTexture(image: UIImage(named: "botonMenuIzq1")!)
        let textureMenuTitleCenter = SKTexture(image: UIImage(named: "menuText1")!)
        let textureMenuTitleRight = SKTexture(image: UIImage(named: "menuTextDer1")!)
        let textureHorizontalButton = SKTexture(image: UIImage(named: "menuBotonID")!)
        let textureTop1 =  SKTexture(image: UIImage(named: "Frame1")!)
        let textureTop2 =  SKTexture(image: UIImage(named: "Frame2")!)
        let textureTop3 =  SKTexture(image: UIImage(named: "Frame3")!)
        let textureMiddle1 =  SKTexture(image: UIImage(named: "menuMedio1")!)
        let textureMiddle2 =  SKTexture(image: UIImage(named: "menuMedio2")!)
        let textureMiddle3 =  SKTexture(image: UIImage(named: "menuMedio3")!)
        let textureBottom1 =  SKTexture(image: UIImage(named: "menuBot1")!)
        let textureBottom2 =  SKTexture(image: UIImage(named: "menuBot2")!)
        let textureBottom3 =  SKTexture(image: UIImage(named: "menuBot3")!)
        //botones
        let textureBotonAzulFijo =  SKTexture(image: UIImage(named: "botonAzulFijo")!)
        let textureMenuWinButton = SKTexture(image: UIImage(named: "botonRojo")!)
        let textureMenuWinButtonPres = SKTexture(image: UIImage(named: "botonRojoPress")!)
        let textureMenuButtonRight = SKTexture(image: UIImage(named: "RightGenButton")!)
        let textureMenuButtonCenter = SKTexture(image: UIImage(named: "CenterGenButton")!)
        let textureMenuButtonLeft = SKTexture(image: UIImage(named: "LeftGenButton")!)
        let textureMenuButtonRightPress = SKTexture(image: UIImage(named: "RightGenButtonPress")!)
        let textureMenuButtonCenterPress = SKTexture(image: UIImage(named: "CenterGenButtonPress")!)
        let textureMenuButtonLeftPress = SKTexture(image: UIImage(named: "LeftGenButtonPress")!)
        //Labels
        var labelName = SKLabelNode()
    
    
    
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
            cam=SKCameraNode()
            //Elementos de la UI
            let nodo: GameUI = GameUI.init(self.frame)
            interfaz.addChild(nodo.statusBar)
            //cam!.addChild(nodo.statusBar)
            
            //Joystick
            rotateAnalogStick.position = CGPoint(x:-self.frame.maxX+rotateAnalogStick.radius+65, y:-self.frame.maxY+rotateAnalogStick.radius+65)
            rotateAnalogStick.zPosition = 3
            interfaz.addChild(rotateAnalogStick)
            
            
            
            interfaz.childNode(withName: "rotateAnalogStick")
            
            interfaz = nodo.createUI(self.frame, interfaz)
            
            createMenu()
            
            cam!.addChild(interfaz)
            
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
    
    func createMenu(){
        
        
        let escalaMenu = CGFloat(2.4)
        
        //Encabezado Menu (Estatico)
        let TopMenu1 = SKSpriteNode(texture: textureTop1)
        TopMenu1.zPosition = 4
        TopMenu1.xScale = escalaMenu
        TopMenu1.yScale = escalaMenu
        TopMenu1.position = CGPoint(x: -self.frame.maxX+180, y: self.frame.maxY-80)
        contextoMenu.addChild(TopMenu1)
        
        let TopMenu2 = SKSpriteNode(texture: textureTop2)
        TopMenu2.zPosition = 4
        TopMenu2.xScale = escalaMenu * 10
        TopMenu2.yScale = escalaMenu
        TopMenu2.anchorPoint = CGPoint(x: 0, y: 0.5)
        TopMenu2.position = CGPoint(x: TopMenu1.position.x+TopMenu1.size.width/2, y: TopMenu1.position.y)
        contextoMenu.addChild(TopMenu2)
        
        let TopMenu3 = SKSpriteNode(texture: textureTop3)
        TopMenu3.zPosition = 4
        TopMenu3.xScale = escalaMenu
        TopMenu3.yScale = escalaMenu
        TopMenu3.anchorPoint = CGPoint(x: 0, y: 0.5)
        TopMenu3.position = CGPoint(x: TopMenu2.position.x+TopMenu2.size.width, y: TopMenu2.position.y)
        contextoMenu.addChild(TopMenu3)
        // Title Bar
        let MenuTitleLeft = SKSpriteNode(texture: textureMenuTitleLeft)
        MenuTitleLeft.zPosition = 4.1
        MenuTitleLeft.xScale = escalaMenu
        MenuTitleLeft.yScale = escalaMenu
        MenuTitleLeft.anchorPoint = CGPoint(x: 0, y: 0.0)
        MenuTitleLeft.position = CGPoint(x: TopMenu1.position.x-16, y: TopMenu1.position.y+2)
        contextoMenu.addChild(MenuTitleLeft)
        let MenuTitleCenter = SKSpriteNode(texture: textureMenuTitleCenter)
        MenuTitleCenter.zPosition = 4.1
        MenuTitleCenter.xScale = escalaMenu * 2
        MenuTitleCenter.yScale = escalaMenu
        MenuTitleCenter.anchorPoint = CGPoint(x: 0, y: 0)
        MenuTitleCenter.position = CGPoint(x: MenuTitleLeft.position.x+MenuTitleLeft.size.width, y: MenuTitleLeft.position.y)
        contextoMenu.addChild(MenuTitleCenter)
        let MenuTitleRight = SKSpriteNode(texture: textureMenuTitleRight)
        MenuTitleRight.zPosition = 4.1
        MenuTitleRight.xScale = escalaMenu
        MenuTitleRight.yScale = escalaMenu
        MenuTitleRight.anchorPoint = CGPoint(x: 0, y: 0)
        MenuTitleRight.position = CGPoint(x: MenuTitleCenter.position.x+MenuTitleCenter.size.width, y: MenuTitleCenter.position.y)
        contextoMenu.addChild(MenuTitleRight)
        // Button Title Bar
        let MenuTitleButton = SKSpriteNode(texture: textureBotonAzulFijo)
        MenuTitleButton.zPosition = 4.2
        MenuTitleButton.xScale = escalaMenu
        MenuTitleButton.yScale = escalaMenu
        MenuTitleButton.anchorPoint = CGPoint(x: 0, y: 0)
        MenuTitleButton.position = CGPoint(x: MenuTitleLeft.position.x+12, y: MenuTitleLeft.position.y+14)
        contextoMenu.addChild(MenuTitleButton)
        // Button Close Menu
        let MenuCloseFrame = SKSpriteNode(texture: textureHorizontalButton)
        MenuCloseFrame.zPosition = 4.1
        MenuCloseFrame.xScale = escalaMenu
        MenuCloseFrame.yScale = escalaMenu
        MenuCloseFrame.anchorPoint = CGPoint(x: 0, y: 0)
        MenuCloseFrame.position = CGPoint(x: TopMenu3.position.x-8, y: TopMenu3.position.y+2)
        contextoMenu.addChild(MenuCloseFrame)
        
        let MenuCloseButton = SKSpriteNode(texture: textureMenuWinButton)
        MenuCloseButton.name = "MenuWin"
        MenuCloseButton.zPosition = 4.2
        MenuCloseButton.xScale = escalaMenu
        MenuCloseButton.yScale = escalaMenu
        MenuCloseButton.anchorPoint = CGPoint(x: 0, y: 0)
        MenuCloseButton.position = CGPoint(x: TopMenu3.position.x+4, y: TopMenu3.position.y+14)
        contextoMenu.addChild(MenuCloseButton)
        
       let menuBottom1 = SKSpriteNode(texture: textureBottom1)
        menuBottom1.zPosition = 3.9
        menuBottom1.xScale = escalaMenu
        menuBottom1.yScale = escalaMenu
        menuBottom1.position = CGPoint(x: TopMenu1.position.x, y: TopMenu1.position.y-TopMenu1.size.width/2)
        contextoMenu.addChild(menuBottom1)
        let menuBottom2 = SKSpriteNode(texture: textureBottom2)
        menuBottom2.zPosition = 3.9
        menuBottom2.xScale = escalaMenu * 10
        menuBottom2.yScale = escalaMenu
        menuBottom2.anchorPoint = CGPoint(x: 0, y: 0.5)
        menuBottom2.position = CGPoint(x: menuBottom1.position.x+menuBottom1.size.width/2, y: menuBottom1.position.y)
        contextoMenu.addChild(menuBottom2)
        let menuBottom3 = SKSpriteNode(texture: textureBottom3)
        menuBottom3.zPosition = 4.1
        menuBottom3.xScale = escalaMenu
        menuBottom3.yScale = escalaMenu
        menuBottom3.anchorPoint = CGPoint(x: 0, y: 0.5)
        menuBottom3.position = CGPoint(x: menuBottom2.position.x+menuBottom2.size.width, y: menuBottom2.position.y)
        contextoMenu.addChild(menuBottom3)
        
        // Botones de Navegacion
        let MenuButton1 = SKSpriteNode(texture: textureMenuButtonRight)
        MenuButton1.name = "MenuButton1"
        MenuButton1.zPosition = 4.2
        MenuButton1.xScale = escalaMenu
        MenuButton1.yScale = escalaMenu
        MenuButton1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton1.position = CGPoint(x: menuBottom3.position.x, y: menuBottom3.position.y+8)
        contextoMenu.addChild(MenuButton1)
        let MenuButton2 = SKSpriteNode(texture: textureMenuButtonCenter)
        MenuButton2.name = "MenuButton2"
        MenuButton2.zPosition = 4.2
        MenuButton2.xScale = escalaMenu
        MenuButton2.yScale = escalaMenu
        MenuButton2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton2.position = CGPoint(x: MenuButton1.position.x-MenuButton1.size.width, y: MenuButton1.position.y)
        contextoMenu.addChild(MenuButton2)
        let MenuButton3 = SKSpriteNode(texture: textureMenuButtonCenter)
        MenuButton3.name = "MenuButton3"
        MenuButton3.zPosition = 4.2
        MenuButton3.xScale = escalaMenu
        MenuButton3.yScale = escalaMenu
        MenuButton3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton3.position = CGPoint(x: MenuButton2.position.x-MenuButton2.size.width, y: MenuButton2.position.y)
        contextoMenu.addChild(MenuButton3)
        let MenuButton4 = SKSpriteNode(texture: textureMenuButtonLeft)
        MenuButton4.name = "MenuButton4"
        MenuButton4.zPosition = 4.2
        MenuButton4.xScale = escalaMenu
        MenuButton4.yScale = escalaMenu
        MenuButton4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton4.position = CGPoint(x: MenuButton3.position.x-MenuButton3.size.width, y: MenuButton3.position.y)
        contextoMenu.addChild(MenuButton4)
        
        
        //Etiqueta del menu
        let labelMenu = SKLabelNode(text: "Player 1")
        labelMenu.zPosition = 4.3
        labelMenu.fontSize = 30
        //labelMenu.fontName = "Romulus"
        labelMenu.fontName = "Alagard"
        labelMenu.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelMenu.position = CGPoint(x: MenuTitleCenter.position.x+50, y: MenuTitleCenter.position.y+20)
        contextoMenu.addChild(labelMenu)
        
        // Nombre del menu
        labelName = SKLabelNode(text: "Equipo")
        labelName.zPosition = 4.3
        labelName.fontSize = 58
        labelName.fontName = "Alagard"
        labelName.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
       // labelName.text = "Intentario"
        labelName.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelName.position = CGPoint(x: menuBottom1.position.x, y: menuBottom1.position.y-10)
        contextoMenu.addChild(labelName)
        
        
       /* for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }*/
        
    }
    
    func lanzaMenu(){
        self.cam!.addChild(contextoMenu)
    }
    
    func cierramenu(){
        contextoMenu.removeFromParent()
    }
    
    func readFile() -> NSString{
        
        let level1Dir = "/Users/israel/Desktop/iRPG/iRPG/Niveles.xcassets/nivel_1.txt"
        
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
                    interfaz.childNode(withName: "Menu")?.run(SKAction.setTexture(textureMenuButtonPressed))
                }else if name == "Arriba"{
                    interfaz.childNode(withName: "Arriba")?.run(SKAction.setTexture(textureButtonUpPres))
                }else if name == "Abajo"{
                    interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(textureButtonDownPres))
                }else if name == "Der"{
                    interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(textureButtonRightPres))
                }else if name == "Izq"{
                    interfaz.childNode(withName: "Izq")?.run(SKAction.setTexture(textureButtonLeftPres))
                }else if name == "MenuWin"{
                    contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(textureMenuWinButtonPres))
                }else if name == "MenuButton1"{
                    contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(textureMenuButtonRightPress))
                }else if name == "MenuButton2"{
                    contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(textureMenuButtonCenterPress))
                }else if name == "MenuButton3"{
                    contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(textureMenuButtonCenterPress))
                }else if name == "MenuButton4"{
                    contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(textureMenuButtonLeftPress))
                }
                
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            
            
            //self.touchUp(atPoint: t.location(in: self))
            let positionInScene = t.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            
            if let name = touchedNode.name
            {
                
                if name == "Menu"{
                    lanzaMenu()
                    interfaz.removeFromParent()
                    interfaz.childNode(withName: "Menu")?.run(SKAction.setTexture(textureMenuButton))
                }else if name == "Arriba"{
                    interfaz.childNode(withName: "Arriba")?.run(SKAction.setTexture(textureButtonUp))
                }else if name == "Abajo"{
                    interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(textureButtonDown))
                }else if name == "Der"{
                     interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(textureButtonRight))
                }else if name == "Izq"{
                     interfaz.childNode(withName: "Izq")?.run(SKAction.setTexture(textureButtonLeft))
                }else if name == "MenuWin"{
                    cierramenu()
                    contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(textureMenuWinButton))
                    cam!.addChild(interfaz)
                }else if name == "MenuButton1"{
                    contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(textureMenuButtonRight))
                    labelName.text = "Equipo"
                }else if name == "MenuButton2"{
                    contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(textureMenuButtonCenter))
                    labelName.text = "Inventario"
                }else if name == "MenuButton3"{
                    contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(textureMenuButtonCenter))
                     labelName.text = "Menu X"
                }else if name == "MenuButton4"{
                    contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(textureMenuButtonLeft))
                    labelName.text = "Menu Y"
                }
                
            }
            
            
            
        }
        
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
