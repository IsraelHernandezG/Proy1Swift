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
        //player Category
        let playerCategory: UInt32 = 0x01 << 0
        //TileMapCategories
        let Wall1Category: UInt32 = 0x01 << 1
        let Wall2Category: UInt32 = 0x01 << 2
        let Wall3Category: UInt32 = 0x01 << 3
        let Wall4Category: UInt32 = 0x01 << 4
        //Player
        var playerNode = SKSpriteNode()
        var myPlayer = Player()
        
        //Direccion Personaje
        var direccionPersonaje = 0
    
        //Interfaz
        var nodo = GameUI()
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
    
    
    
    
        override func didMove(to view: SKView) {
            super.didMove(to: view)
            self.physicsWorld.contactDelegate = self
            self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
            
            loadLevel(1)
            
            //Camara
            cam=SKCameraNode()
            //Elementos de la Interfaz Grafica
            nodo.createUI(self.frame)
            //El Menu se crea de una vez pero no se agrega a la escena
            nodo.createMenu(self.frame)

            //El objeto resultante se agrega a la camara
            cam!.addChild(nodo.interfaz)
            
            self.camera=cam
            self.addChild(cam!)
            
            //Creando al jugador
            myPlayer = Player.init(CGPoint(x: frame.midX, y: frame.midY))
            //Agregando los sprites del jugador a la escena
            playerNode = myPlayer.playerNode
            addChild(playerNode)
            
            nodo.rotateAnalogStick.myPlayer = myPlayer
            
            
            
            // Movimiento del personaje
            var movX = 0.0
            var movY = 0.0
            //al mover el Joystick cambia la orientacion del jugador
            nodo.rotateAnalogStick.trackingHandler = { [unowned self] jData in
                
                if (jData.angular >= -0.375 && jData.angular < 0.375){
                    //vista N
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerN))
                    movX += 0.0
                    movY += 1.0 * self.velocidadYp
                    self.direccionPersonaje = 1
                     //self.myPlayer.orientacionPersonaje = 1
                    
                }else if (jData.angular >= 0.375 && jData.angular < 1.125){
                    //vista NW
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerNW))
                    movX -= 0.7072 * self.velocidadXm
                    movY += 0.7072 * self.velocidadYp
                    
                     self.direccionPersonaje = 0
                    
                }else if (jData.angular >= 1.125 && jData.angular < 1.875){
                   //vista W
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerW))
                    
                    movX -= 1.0 * self.velocidadXm
                    movY += 0.0
                    self.direccionPersonaje = 2
                    
                }else if (jData.angular >= 1.875 && jData.angular < 2.675){
                    //vista SW
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerSW))
                    movX -= 0.7072 * self.velocidadXm
                    movY -= 0.7072 * self.velocidadYm
                    self.direccionPersonaje = 0
                    
                }else if (jData.angular >= 2.625 || jData.angular < -2.625){
                    //vista S
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerS))
                    
                    movX += 0.0
                    movY -= 1.0 * self.velocidadYm
                    self.direccionPersonaje = 3
                    
                }else if (jData.angular >= -2.625 && jData.angular < -1.875){
                    //vista SE
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerSE))
                    movX += 0.7072 * self.velocidadXp
                    movY -= 0.7072 * self.velocidadYm
                    self.direccionPersonaje = 0
                    
                }else if (jData.angular >= -1.875 && jData.angular < -1.125){
                    //vista E
                    
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerE))
                    movX += 1.0 * self.velocidadXp
                    movY += 0.0
                    self.direccionPersonaje = 4
                    
                }else if (jData.angular >= -1.125 && jData.angular < -0.375){
                    //vista NE
                    //self.playerNode.run(SKAction.setTexture(self.myPlayer.texturePlayerNE))
                    movX += 0.7072 * self.velocidadXp
                    movY += 0.7072 * self.velocidadYp
                    self.direccionPersonaje = 0
                }
                
                self.playerNode.run(SKAction.moveTo(x: CGFloat(movX), duration: 0.1))
                self.playerNode.run(SKAction.moveTo(y: CGFloat(movY), duration: 0.1))
                
                
                
            }
            
            nodo.joystickStickImageEnabled = true
            nodo.joystickSubstrateImageEnabled = true
            //animateMove(1)
    
            view.isMultipleTouchEnabled = true
            
        }
    
    
    
    
    
   
    
    func lanzaMenu(){
        self.cam!.addChild(nodo.contextoMenu)
    }
    
    func cierramenu(){
        nodo.contextoMenu.removeFromParent()
    }
    
    func readFile() -> NSString{
        
        //let level1Dir = "/Users/israel/Desktop/iRPG/iRPG/Niveles.xcassets/nivel_1.txt"
        let level1Dir = "/Users/israel/Desktop/iRPG/iRPG/Niveles.xcassets/nivelPrueba.txt"
        
        let file: FileHandle? = FileHandle(forReadingAtPath: level1Dir)
        let vacio = NSString(string: "")
        
        if file != nil {
            let data = file?.readDataToEndOfFile()
            file?.closeFile()
            if let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
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
                    nodo.interfaz.childNode(withName: "Menu")?.run(SKAction.setTexture(nodo.textureMenuButtonPressed))
                }else if name == "Arriba"{
                    nodo.interfaz.childNode(withName: "Arriba")?.run(SKAction.setTexture(nodo.textureButtonUpPres))
                    playerNode.run(SKAction.repeatForever(SKAction.animate(with: myPlayer.playerWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
                }else if name == "Abajo"{
                    nodo.interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(nodo.textureButtonDownPres))
                    playerNode.run(SKAction.repeatForever(SKAction.animate(with: myPlayer.playerWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
                }else if name == "Der"{
                    nodo.interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(nodo.textureButtonRightPres))
                    playerNode.run(SKAction.repeatForever(SKAction.animate(with: myPlayer.playerWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
                }else if name == "Izq"{
                    nodo.interfaz.childNode(withName: "Izq")?.run(SKAction.setTexture(nodo.textureButtonLeftPres))
                    playerNode.run(SKAction.repeatForever(SKAction.animate(with: myPlayer.playerWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
                }else if name == "MenuWin"{
                    nodo.contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(nodo.textureMenuWinButtonPres))
                }else if name == "MenuButton1"{
                    nodo.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(nodo.textureMenuButtonRightPress))
                    //
                    nodo.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    nodo.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    nodo.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(nodo.textureMenuButtonLeft))
                    
                    nodo.cierraMenuEquip()
                    
                }else if name == "MenuButton2"{
                    nodo.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(nodo.textureMenuButtonCenterPress))
                    //
                    nodo.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(nodo.textureMenuButtonRight))
                    //nodo.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    nodo.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    nodo.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(nodo.textureMenuButtonLeft))
                    
                    nodo.cierraMenuEquip()
                }else if name == "MenuButton3"{
                    nodo.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(nodo.textureMenuButtonCenterPress))
                    //
                    nodo.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(nodo.textureMenuButtonRight))
                    nodo.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    //nodo.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    nodo.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(nodo.textureMenuButtonLeft))
                    
                    nodo.cierraMenuEquip()
                    
                }else if name == "MenuButton4"{
                    nodo.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(nodo.textureMenuButtonLeftPress))
                    //
                    nodo.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(nodo.textureMenuButtonRight))
                    nodo.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    nodo.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    //nodo.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(nodo.textureMenuButtonLeft))
                    
                    nodo.lanzaMenuEquip()
                }else if (name == "ranura0" || name == "ranura1" || name == "ranura2") {
                    nodo.ranuraSel(1)
                }else if (name == "ranura3" || name == "ranura4" || name == "ranura5") {
                    nodo.ranuraSel(2)
                }else if (name == "ranura6" || name == "ranura7" || name == "ranura8") {
                    nodo.ranuraSel(3)
                }else if (name == "ranura9" || name == "ranura10" || name == "ranura11") {
                    nodo.ranuraSel(4)
                }else if name == "helmet"{
                    nodo.selEquip(1)
                }else if name == "amulet"{
                    nodo.selEquip(2)
                }else if name == "armor"{
                    nodo.selEquip(3)
                }else if name == "weapon"{
                    nodo.selEquip(4)
                }else if name == "shield"{
                    nodo.selEquip(5)
                }else if name == "graves"{
                    nodo.selEquip(6)
                }else if name == "ring1"{
                    nodo.selEquip(7)
                }else if name == "ring2"{
                    nodo.selEquip(8)
                }else if name == "ring3"{
                    nodo.selEquip(9)
                }else if (name == "botonEquip1" || name == "botonEquip2" || name == "botonEquip3" || name == "labelBoton") {
                    
                    nodo.ventana1.childNode(withName: "botonEquip1")?.run(SKAction.setTexture(nodo.textureMenuTitleLeftPress))
                    nodo.ventana1.childNode(withName: "botonEquip2")?.run(SKAction.setTexture(nodo.textureMenuTitleCenterPress))
                    nodo.ventana1.childNode(withName: "botonEquip3")?.run(SKAction.setTexture(nodo.textureMenuTitleRightPress))
                    
                    nodo.labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(0.5), alpha: CGFloat(1.0))
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
                    nodo.interfaz.removeFromParent()
                    nodo.interfaz.childNode(withName: "Menu")?.run(SKAction.setTexture(nodo.textureMenuButton))
                }else if name == "Arriba"{
                    nodo.interfaz.childNode(withName: "Arriba")?.run(SKAction.setTexture(nodo.textureButtonUp))
                    myPlayer.resetpersonaje()
                    playerNode.run(SKAction.setTexture(myPlayer.texturePlayerN))
                }else if name == "Abajo"{
                    nodo.interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(nodo.textureButtonDown))
                    myPlayer.resetpersonaje()
                    playerNode.run(SKAction.setTexture(myPlayer.texturePlayerS))
                }else if name == "Der"{
                    nodo.interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(nodo.textureButtonRight))
                    myPlayer.resetpersonaje()
                    playerNode.run(SKAction.setTexture(myPlayer.texturePlayerE))
                }else if name == "Izq"{
                    nodo.interfaz.childNode(withName: "Izq")?.run(SKAction.setTexture(nodo.textureButtonLeft))
                    myPlayer.resetpersonaje()
                    playerNode.run(SKAction.setTexture(myPlayer.texturePlayerW))
                }else if name == "MenuWin"{
                    cierramenu()
                    nodo.contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(nodo.textureMenuWinButton))
                    cam!.addChild(nodo.interfaz)
                }else if name == "MenuButton1"{
                    nodo.labelName.text = "Ajustes"
                }else if name == "MenuButton2"{
                    nodo.labelName.text = "Menu X"
                }else if name == "MenuButton3"{
                    nodo.labelName.text = "Inventario"
                }else if name == "MenuButton4"{
                    nodo.labelName.text = "Equipo"
                }else if (name == "botonEquip1" || name == "botonEquip2" || name == "botonEquip3" || name == "labelBoton") {
                    nodo.equiparItem()
                }
                
            }
            
            
            
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        super.update(currentTime)
        
        let posJugador = playerNode.position
        nodo.rotateAnalogStick.myPlayer.orientacionPersonaje = direccionPersonaje
        
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
