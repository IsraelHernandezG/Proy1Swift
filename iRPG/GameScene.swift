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
        var myMapa = TileMap()
    
        var map = SKNode()
        //player Category
        let playerCategory: UInt32 = 0x01 << 0
        //Player
        //var Player1 = SKNode()
        var myPlayer = Player()
        // Enemigos
        var Enemy1 = SKNode()
        var enemyMob1 = Skeleton()
        //Direccion Personaje
        var direccionPersonaje = 3
        //Direccion Espada
        var direccionEspada = 3
        //Direccion Casco
        var direccionCasco = 3
    
        //Interfaz
        var myInterface = GameUI()
        // Controles de la fisica
    
        
        var topeYp: CGFloat = 0.0
        var topeYm: CGFloat = 0.0
        var topeXp: CGFloat = 0.0
        var topeXm: CGFloat = 0.0
        var bandera = 0
        var bandera2 = 0
        var bandera3 = 0
        var bandera4 = 0

        var banderaHoguera = 0
    
        // Poscion del personaje en el mapa
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
    
    
    
        override func didMove(to view: SKView) {
            super.didMove(to: view)
            self.physicsWorld.contactDelegate = self
            self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
            
            
            loadLevel(1)
            
            //Camara
            cam=SKCameraNode()
            //Elementos de la Interfaz Grafica
            myInterface.createUI(self.frame)
            //El Menu se crea de una vez pero no se agrega a la escena
            myInterface.createMenu(self.frame)

            //El objeto resultante se agrega a la camara
            cam!.addChild(myInterface.interfaz)
            
            self.camera=cam
            self.addChild(cam!)
            
            //Creando al jugador
            myPlayer = Player.init(CGPoint(x: frame.midX , y: frame.midY))
            
            enemyMob1 = Skeleton.init(CGPoint(x: frame.midX + 100, y: frame.midY + 100))
            
            //Agregando enemigos a la escena
            Enemy1 = enemyMob1.Enemy
            addChild(Enemy1)
            //Agregando los sprites del jugador a la escena
            addChild(myPlayer.Jugador)
            myInterface.rotateAnalogStick.myPlayer = myPlayer
            //nodo.rotateAnalogStick.firstSword = firstSword
            
            myInterface.healt(myPlayer.vida, myPlayer.vidaMax)
            
            
            //al mover el Joystick cambia la orientacion del jugador
            
            if myPlayer.isAlive == true {
            myInterface.rotateAnalogStick.trackingHandler = { [unowned self] jData in
                
                
                if (jData.angular == 0){
                    //self.posX += 0.0
                    //self.posY += 0.0
                    self.myPlayer.velocidad = 0.0
                }else{
                    self.myPlayer.velocidad = 5.0
                    
                    if (jData.angular >= -0.375 && jData.angular < 0.375){
                        //vista N
                        //self.posX += 0.0
                        //self.posY += 1.0 * self.myPlayer.velocidadYp
                        self.direccionPersonaje = 1
                        self.direccionEspada = 1
                        
                        
                    }else if (jData.angular >= 0.375 && jData.angular < 1.125){
                        //vista NW
                        //self.posX -= 0.7072 * self.myPlayer.velocidadXm
                        //self.posY += 0.7072 * self.myPlayer.velocidadYp
                        
                         self.direccionEspada = 1
                         self.direccionPersonaje = 5
                         self.direccionCasco = 5
                        

                    }else if (jData.angular >= 1.125 && jData.angular < 1.875){
                       //vista W
                       //self.posX -= 1.0 * self.myPlayer.velocidadXm
                        //self.posY += 0.0
                        self.direccionPersonaje = 2
                        self.direccionEspada = 2
                    }else if (jData.angular >= 1.875 && jData.angular < 2.675){
                        //vista SW
                        //self.posX -= 0.7072 * self.myPlayer.velocidadXm
                       //self.posY -= 0.7072 * self.myPlayer.velocidadYm

                        self.direccionEspada = 6
                         self.direccionCasco = 6
                        self.direccionPersonaje = 6
                        

                    }else if (jData.angular >= 2.625 || jData.angular < -2.625){
                        //vista S
                        //self.posX += 0.0
                        //self.posY -= 1.0 * self.myPlayer.velocidadYm
                        self.direccionPersonaje = 3
                        self.direccionEspada = 3
                         self.direccionCasco = 3
                    }else if (jData.angular >= -2.625 && jData.angular < -1.875){
                        //vista SE
                        //self.posX += 0.7072 * self.myPlayer.velocidadXp
                        //self.posY -= 0.7072 * self.myPlayer.velocidadYm

                    
                        self.direccionEspada = 7
                        self.direccionPersonaje = 7
                         self.direccionCasco = 7
                        

                    }else if (jData.angular >= -1.875 && jData.angular < -1.125){
                        //vista E
                        //self.posX += 1.0 * self.myPlayer.velocidadXp
                        //self.posY += 0.0
                        self.direccionPersonaje = 4
                        self.direccionEspada = 4
                         self.direccionCasco = 4
                        
                    }else if (jData.angular >= -1.125 && jData.angular < -0.375){
                        //vista NE
                        //self.posX += 0.7072 * self.myPlayer.velocidadXp
                        //self.posY += 0.7072 * self.myPlayer.velocidadYp

                        self.direccionEspada = 8
                        self.direccionCasco = 8
                        self.direccionPersonaje = 8

                    }
                }
                
            }
            
            myInterface.joystickStickImageEnabled = true
            myInterface.joystickSubstrateImageEnabled = true
    
            view.isMultipleTouchEnabled = true
            }
        }
    
    
    
    
    
    
    func lanzaMenu(){
        self.cam!.addChild(myInterface.contextoMenu)
    }
    
    func cierramenu(){
        myInterface.contextoMenu.removeFromParent()
    }
    
    func readFile() -> NSString{
        
        let FileName = "nivelPrueba"
        
        var dir = String()
        
        if let FilePath = Bundle.main.path(forResource: FileName, ofType: "txt") {
            print(FilePath)
            dir = FilePath
        }
    
        let file: FileHandle? = FileHandle(forReadingAtPath: dir)
        let vacio = NSString(string: "")
        
        if file != nil {
            let data = file?.readDataToEndOfFile()
            file?.closeFile()
            if let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
                return str
            }
            
        } else {
            print("No se encontro el archivo")
            myMapa = TileMap.init(10)
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
                myMapa = TileMap.init(cadena)
                map = myMapa.map
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
        
        
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & myMapa.Wall1Category != 0)){
            
            if (topeYp == 0.0){
                myPlayer.velocidadYp = 0.0
                topeYp = myPlayer.Jugador.position.y
                bandera = 1
            }else{
                bandera = 1
            }
        }
        
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & myMapa.Wall2Category != 0)){
            
            //print("\nLeft Wall Contact:\nx: \(playerNode.position.x), y: \(playerNode.position.y)")
            if (topeXm == 0.0){
                myPlayer.velocidadXm = 0.0
                topeXm = myPlayer.Jugador.position.x
                bandera2 = 1
                
            }else{
                bandera2 = 1
            }
        }
        
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & myMapa.Wall3Category != 0)){
            
            //print("\nRight Wall Contact:\nx: \(playerNode.position.x), y: \(playerNode.position.y)")
            if (topeXp == 0.0){
                myPlayer.velocidadXp = 0.0
                topeXp = myPlayer.Jugador.position.x
                bandera3 = 1
             
             }else{
                bandera3 = 1
             }
        }
        
        
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & myMapa.Wall4Category != 0)){
            
            if (topeYm == 0.0){
                myPlayer.velocidadYm = 0.0
                topeYm = myPlayer.Jugador.position.y
                bandera4 = 1
            }else{
                bandera4 = 1
            }
        }
        
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & myMapa.fireCategory != 0)){
            
            print("Encender la hoguera?")
            
        }
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & enemyMob1.enemyCategory != 0)){
            
            
            myPlayer.vida -= 1
            myInterface.damage(myPlayer.vida,myPlayer.vidaMax)
            
            
            if myPlayer.vida <= 0 {
               
                myPlayer.muertePersonaje()
                
            }
            
            if ((firstBody.categoryBitMask & myPlayer.armsCategory != 0) &&
                (secondBody.categoryBitMask & enemyMob1.enemyCategory != 0)){
                
                 enemyMob1.vida = enemyMob1.vida - 10
                print("OUCH!")
                if enemyMob1.vida <= 0 {
                    enemyMob1.muertePersonaje()
                    
                }
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
                    myInterface.interfaz.childNode(withName: "Menu")?.run(SKAction.setTexture(myInterface.textureMenuButtonPressed))
                }else if name == "Arriba"{
                    myInterface.interfaz.childNode(withName: "Arriba")?.run(SKAction.setTexture(myInterface.textureButtonUpPres))
                   
                }else if name == "Abajo"{
                    myInterface.interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(myInterface.textureButtonDownPres))
                    
                }else if name == "Der"{
                    myInterface.interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(myInterface.textureButtonRightPres))
                     if (myPlayer.isAlive == true && myPlayer.stamina >= 10){
                        myPlayer.inAction = true
                        myPlayer.atack()
                        myPlayer.stamina -= 20.0
                        if (myPlayer.stamina <= 0.0){
                            myPlayer.stamina = 0.0
                        }
                        myInterface.spendStamina(myPlayer.stamina, myPlayer.staminaMax)
                    }
                    
                }else if name == "Izq"{
                    myInterface.interfaz.childNode(withName: "Izq")?.run(SKAction.setTexture(myInterface.textureButtonLeftPres))
                   
                }else if name == "MenuWin"{
                    myInterface.contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(myInterface.textureMenuWinButtonPres))
                }else if name == "MenuButton1"{
                    myInterface.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(myInterface.textureMenuButtonRightPress))
                    //
                    myInterface.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(myInterface.textureMenuButtonLeft))
                    
                    myInterface.cierraMenuEquip()
                    
                }else if name == "MenuButton2"{
                    myInterface.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenterPress))
                    //
                    myInterface.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(myInterface.textureMenuButtonRight))
                    //nodo.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(myInterface.textureMenuButtonLeft))
                    
                    myInterface.cierraMenuEquip()
                }else if name == "MenuButton3"{
                    myInterface.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenterPress))
                    //
                    myInterface.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(myInterface.textureMenuButtonRight))
                    myInterface.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    //nodo.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(nodo.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(myInterface.textureMenuButtonLeft))
                    
                    myInterface.cierraMenuEquip()
                    
                }else if name == "MenuButton4"{
                    myInterface.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(myInterface.textureMenuButtonLeftPress))
                    //
                    myInterface.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(myInterface.textureMenuButtonRight))
                    myInterface.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    //nodo.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(nodo.textureMenuButtonLeft))
                    
                    myInterface.lanzaMenuEquip()
                }else if (name == "ranura0" || name == "ranura1" || name == "ranura2") {
                    myInterface.ranuraSel(1)
                }else if (name == "ranura3" || name == "ranura4" || name == "ranura5") {
                    myInterface.ranuraSel(2)
                }else if (name == "ranura6" || name == "ranura7" || name == "ranura8") {
                    myInterface.ranuraSel(3)
                }else if (name == "ranura9" || name == "ranura10" || name == "ranura11") {
                    myInterface.ranuraSel(4)
                }else if name == "helmet"{
                    myInterface.selEquip(1)
                }else if name == "amulet"{
                    myInterface.selEquip(2)
                }else if name == "armor"{
                    myInterface.selEquip(3)
                }else if name == "weapon"{
                    myInterface.selEquip(4)
                }else if name == "shield"{
                    myInterface.selEquip(5)
                }else if name == "graves"{
                    myInterface.selEquip(6)
                }else if name == "ring1"{
                    myInterface.selEquip(7)
                }else if name == "ring2"{
                    myInterface.selEquip(8)
                }else if name == "ring3"{
                    myInterface.selEquip(9)
                }else if (name == "botonEquip1" || name == "botonEquip2" || name == "botonEquip3" || name == "labelBoton") {
                    
                    myInterface.ventana1.childNode(withName: "botonEquip1")?.run(SKAction.setTexture(myInterface.textureMenuTitleLeftPress))
                    myInterface.ventana1.childNode(withName: "botonEquip2")?.run(SKAction.setTexture(myInterface.textureMenuTitleCenterPress))
                    myInterface.ventana1.childNode(withName: "botonEquip3")?.run(SKAction.setTexture(myInterface.textureMenuTitleRightPress))
                    
                    myInterface.labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(0.5), alpha: CGFloat(1.0))
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
                    myInterface.interfaz.removeFromParent()
                    myInterface.interfaz.childNode(withName: "Menu")?.run(SKAction.setTexture(myInterface.textureMenuButton))
                }else if name == "Arriba"{
                    myInterface.interfaz.childNode(withName: "Arriba")?.run(SKAction.setTexture(myInterface.textureButtonUp))
                    myPlayer.vida = myPlayer.vidaMax 
                    myInterface.healt(myPlayer.vida, myPlayer.vidaMax)
                    myPlayer.isAlive = true
                }else if name == "Abajo"{
                    myInterface.interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(myInterface.textureButtonDown))
                   
                }else if name == "Der"{
                    myInterface.interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(myInterface.textureButtonRight))
                   
                    
                }else if name == "Izq"{
                    myInterface.interfaz.childNode(withName: "Izq")?.run(SKAction.setTexture(myInterface.textureButtonLeft))
                   
                }else if name == "MenuWin"{
                    cierramenu()
                    myInterface.contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(myInterface.textureMenuWinButton))
                    cam!.addChild(myInterface.interfaz)
                }else if name == "MenuButton1"{
                    myInterface.labelName.text = "Ajustes"
                }else if name == "MenuButton2"{
                    myInterface.labelName.text = "Menu X"
                }else if name == "MenuButton3"{
                    myInterface.labelName.text = "Inventario"
                }else if name == "MenuButton4"{
                    myInterface.labelName.text = "Equipo"
                }else if (name == "botonEquip1" || name == "botonEquip2" || name == "botonEquip3" || name == "labelBoton") {
                    myInterface.equiparItem()
                }
                
            }
            
            
            
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        super.update(currentTime)
        /*if myPlayer.vida > 0 {
            myPlayer.isAlive = true
        }*/
        
        if enemyMob1.isAlive{
            enemyMob1.enemyxPosition = Enemy1.position.x - myPlayer.Jugador.position.x
            enemyMob1.enemyyPosition = Enemy1.position.y - myPlayer.Jugador.position.y
            if enemyMob1.enemyxPosition < 0 && enemyMob1.enemyyPosition < 0
            {
                enemyMob1.orientaCaminata = 4
                enemyMob1.followPlayer()
            } else if enemyMob1.enemyxPosition < 0 && enemyMob1.enemyyPosition > 0{
                enemyMob1.orientaCaminata = 3
                enemyMob1.followPlayer()
            }else if enemyMob1.enemyxPosition > 0 && enemyMob1.enemyyPosition < 0{
                enemyMob1.orientaCaminata = 2
                enemyMob1.followPlayer()
            }else if enemyMob1.enemyxPosition > 0 && enemyMob1.enemyyPosition > 0{
                enemyMob1.orientaCaminata = 1
                enemyMob1.followPlayer()
            } else {
                enemyMob1.orientaCaminata = 0
                enemyMob1.followPlayer()
            }
        }
        if myPlayer.isAlive {
            
            //Funcion que reasigna el physics body al personaje
            //myPlayer.setPlayerPhysicsBody()
            myPlayer.setWeaponPhysicsBody()
            //
            
            myInterface.rotateAnalogStick.myPlayer.orientacionPersonaje = direccionPersonaje
            //El personaje se mueve hacia una poscicion
            //myPlayer.movePlayerTo(x: posX, y: posY)
            
            //El personaje se mueve en la direccion del vector de posicion
            myPlayer.movePlayer()
            myInterface.restoreStamina(myPlayer.action(), myPlayer.staminaMax)
            
            let posJugador = myPlayer.Jugador.position
            
        
            if let camera = cam{
                camera.position=posJugador
                if (bandera == 1){
                    if (posJugador.y >= topeYp){
                        myPlayer.velocidadYp = 0.0
                        
                    }else if (posJugador.y < topeYp){
                        //
                        bandera = 0
                    }
                }else{
                    topeYp = 0.0
                    myPlayer.velocidadYp = 1.0
                }
                //+++++++++++++++++++++++
                if (bandera2 == 1){
                    if (posJugador.x <= topeXm){
                        myPlayer.velocidadXm = 0.0
                        
                    }else if (posJugador.x > topeXm){
                        //
                        bandera2 = 0
                    }
                }else{
                    topeXm = 0.0
                    myPlayer.velocidadXm = 1.0
                }
                //**************************
                if (bandera3 == 1){
                    if (posJugador.x >= topeXp){
                        myPlayer.velocidadXp = 0.0
                        
                    }else if (posJugador.x < topeXp){
                        //
                        bandera3 = 0
                    }
                }else{
                    topeXp = 0.0
                    myPlayer.velocidadXp = 1.0
                }
                //---------------------------
                if (bandera4 == 1){
                    if (posJugador.y <= topeYm){
                        myPlayer.velocidadYm = 0.0
                        
                    }else if (posJugador.y > topeYm){
                        //
                        bandera4 = 0
                    }
                }else{
                    topeYm = 0.0
                    myPlayer.velocidadYm = 1.0
                }
                
            }
        }
    }
}
