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
        var mapNum = 1
        var map = SKNode()
        //player Category
        let playerCategory: UInt32 = 0x01 << 0
        //Player
        var myPlayer = Player()
        // Enemigos
        var enemigos: [Enemy] = []
        var numEnemigo = 0
        let enemyDictionary: Dictionary<Int,String> = [1:"skeleton",2:"zombie",3:"drake",4:"lizardman"]
        //let classDictionary: Dictionary<Int,String> = [1:"warrior",2:"sorcerer",3:"archer",4:"spearman"]
        let classDictionary: Dictionary<Int,String> = [1:"warrior",2:"warrior",3:"spearman",4:"spearman"]
        //drops
        var dropArray: [Drop] = []
        var dropActual = 0
        var posItem: CGPoint = CGPoint(x: 0.0,y: 0.0)
        var distanciaItem: CGFloat = 0.0
    
        //Direccion Personaje
        var direccionPersonaje = 3
    
        //Interfaz
        var myInterface = GameUI()
        var labelDead = SKLabelNode()
    
        // Controles de la fisica
        var topeYp: CGFloat = 0.0
        var topeYm: CGFloat = 0.0
        var topeXp: CGFloat = 0.0
        var topeXm: CGFloat = 0.0
        var bandera = 0
        var bandera2 = 0
        var bandera3 = 0
        var bandera4 = 0
        let mapScale: CGFloat = 6.0

        var banderaDrop = false
        var banderaMapa = false
        var estadoItem = 0
        var LoadScreen = SKSpriteNode()
    
        var EnemyCategory: UInt32 = 0
    
        var numPotions : Int = 0
    
        // Poscion del personaje en el mapa
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        let generoPersonaje: String = "male"
        var scoreJugador : Int = 0
        var daño = 0.0
    
        override func didMove(to view: SKView) {
            super.didMove(to: view)
            self.physicsWorld.contactDelegate = self
            self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
            loadLevel(mapNum)
            
            //Camara
            cam=SKCameraNode()
            
            //Creando al jugador
            myPlayer = Player.init(posicion: CGPoint(x: 0.0 , y: 0.0), genero: generoPersonaje)
            
            //Reservando memoria enemigos
            arregloEnemigos()
            
            //creando drops
            generaDrop()
            
            //Elementos de la Interfaz Grafica
            myInterface.createUI(ventana: self.frame)
            //El Menu se crea de una vez pero no se agrega a la escena
            myInterface.createMenu(self.frame)
            //Mandar las listas de items del jugador a la interfaz
            myInterface.itemsPlayer = myPlayer.items
            myInterface.itemsEquipedPlayer = myPlayer.itemsEquiped
            //El objeto resultante se agrega a la camara
            cam!.addChild(myInterface.interfaz)
            
            self.camera=cam
            self.addChild(cam!)
            
            
            //Agregando los sprites del jugador a la escena
            addChild(myPlayer.Jugador)
            myInterface.rotateAnalogStick.myPlayer = myPlayer
            
            //myInterface.healt(myPlayer.vida, myPlayer.vidaMax)
            
            //al mover el Joystick cambia la orientacion del jugador
            if myPlayer.isAlive == true {
            myInterface.rotateAnalogStick.trackingHandler = { [unowned self] jData in
                
                
                if (jData.angular == 0){
                    self.myPlayer.velocidad = 0.0
                }else{
                    self.myPlayer.velocidad = 5.0
                    
                    if (jData.angular >= -0.375 && jData.angular < 0.375){
                        //vista N
                        self.direccionPersonaje = 1
                        
                    }else if (jData.angular >= 0.375 && jData.angular < 1.125){
                        //vista NW
                        self.direccionPersonaje = 5
                    
                    }else if (jData.angular >= 1.125 && jData.angular < 1.875){
                       //vista W
                       self.direccionPersonaje = 2
                    }else if (jData.angular >= 1.875 && jData.angular < 2.675){
                        //vista SW
                        self.direccionPersonaje = 6

                    }else if (jData.angular >= 2.625 || jData.angular < -2.625){
                        //vista S
                        self.direccionPersonaje = 3
                    }else if (jData.angular >= -2.625 && jData.angular < -1.875){
                        //vista SE
                        self.direccionPersonaje = 7

                    }else if (jData.angular >= -1.875 && jData.angular < -1.125){
                        //vista E
                        self.direccionPersonaje = 4
                        
                    }else if (jData.angular >= -1.125 && jData.angular < -0.375){
                        //vista NE
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
    
    func readFile(nombre: String) -> NSString{
        
        let FileName = nombre
        
        var dir = String()
        
        if let FilePath = Bundle.main.path(forResource: FileName, ofType: "txt") {
            //print(FilePath)
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
        }
        
        return vacio
    }
    
    
    func loadLevel(_ level: Int){
        switch level {
        case 2:
            //lectura de archivo
            let maplevel = readFile(nombre: "nivel_cueva")
            let maplevelPB = readFile(nombre: "nivel_cueva_PB")
            if maplevel != ""{

                //let mapa = "volcano"
                let mapa = "ground_5"
                
                let cadena = maplevel as String
                let cadena2 = maplevelPB as String
                myMapa = TileMap.init(bitmap: cadena, physicBitmap: cadena2, spritesheet: mapa)
                map = myMapa.map
                map.xScale = mapScale
                map.yScale = mapScale
                map.position = CGPoint(x: 0.0, y: 0.0)
                //se agrega map a la vista
                self.addChild(map)
                myInterface.iniciaTableroScore(frame: self.frame)
                
                generaEnemigo()
                agregarEnemigo(index: numEnemigo)
                numEnemigo += 1
            }
            
        case 1:
            //lectura de archivo
            let maplevel = readFile(nombre: "nivel_bosque")
            let maplevelPB = readFile(nombre: "nivel_bosque_PB")
            if maplevel != ""{
                let mapa = "forest_2"
                let cadena = maplevel as String
                let cadena2 = maplevelPB as String
                myMapa = TileMap.init(bitmap: cadena, physicBitmap: cadena2, spritesheet: mapa)
                //myMapa = TileMap.init(bitmap: cadena, spritesheet: mapa)
                map = myMapa.map
                map.xScale = mapScale
                map.yScale = mapScale
                map.position = CGPoint(x: 0.0, y: 0.0)
                //se agrega map a la vista
                self.addChild(map)
                
                numEnemigo = 0
                //myInterface.removeVentanaE()
                
            }
        default:
            //Cargar un mapa alternativo o dejar el menu
            myMapa = TileMap.init(size: 10)
            map = myMapa.map
            map.xScale = mapScale
            map.yScale = mapScale
            map.position = CGPoint(x: 0.0, y: 0.0)
            //se agrega map a la vista
            self.addChild(map)
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
        
        //detectar que item es tomado
        if dropArray.count >= 1 {
            for j in 1...dropArray.count {
                if ((firstBody.categoryBitMask == myPlayer.playerCategory) &&
                    (secondBody.categoryBitMask == dropArray[j-1].interactionCategory && banderaDrop == true)){
                    
                    //al detectar el item, marcar su posicion y si el personaje se aleja una cierta distancia
                    // desaparece la ventana
                    //en caso de que entre en contacto con otro item, se cambia la marca
                    myInterface.ventanaEmergente(tipo: 1, frame: self.frame, texto: "Recoger Objeto")
                    //dropActual = j-1
                    //posItem = dropArray[j-1].getPosition()
                }
            }
        }
        
        //detectar que enemigo es golpeado
        if enemigos.count >= 1 {
            for x in 1...enemigos.count {
                if ((firstBody.categoryBitMask & myPlayer.playerArmCategory != 0) &&
                    (secondBody.categoryBitMask == enemigos[x-1].enemyCategory )){
                    
                    if enemigos[x-1].vida > 0{
                        daño = ((myPlayer.lvl-1.0)*(0.25))
                        enemigos[x-1].vida -=  1.2 + daño
                        enemigos[x-1].damage()
                    }else{
                        if(enemigos[x-1].isAlive == true){
                            //si muertePersonaje devuelve true, se crea un item y se añade a la escena
                            let temp = enemigos[x-1].muerteEnemigo()
                            
                            scoreJugador += 200
                            myPlayer.exp += 200
                            if (myPlayer.exp >= 1000){
                                myPlayer.exp = 0
                                myPlayer.lvl += 1.0
                            }
                            if (numEnemigo > 5 && numEnemigo < 20 ){
                                agregarEnemigo(index: numEnemigo)
                                numEnemigo += 1
                            }
                            if (numEnemigo < 20){
                                agregarEnemigo(index: numEnemigo)
                                numEnemigo += 1
                                
                            }
                            if (temp == true && banderaDrop == false){
                                posItem = enemigos[x-1].getPosition()
                                agregarDrop(position: posItem)
                                banderaDrop = true
                            }
                            
                        }
                        
                    }
                    
                }
            }
        }
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & myPlayer.enemyArmCategory != 0)){
        
            if myPlayer.vida >= 0 {
                myPlayer.vida -= 0.25
                myInterface.damage(myPlayer.vida,myPlayer.vidaMax)
                
            }else{
                if myPlayer.isAlive{
                    myPlayer.muertePersonaje()
                    deadscreen(frame: self.frame)
                }
            }
            
        }
        if ((firstBody.categoryBitMask & myMapa.playerCategory != 0) &&
            (secondBody.categoryBitMask & myMapa.caveEntrance != 0) && banderaMapa == false){
            
            switch mapNum {
            case 1:
                mapNum = 2
                posX = 304.0*mapScale
                posY = -160.0*mapScale
                LoadScreen = SKSpriteNode(imageNamed: "Dark Cavern")
                
            case 2:
                mapNum = 1
                posX = -320.0*mapScale
                posY = 160.0*mapScale
                LoadScreen = SKSpriteNode(imageNamed: "Blue Forest")
            default:
                mapNum = 2
                posX = 304.0*mapScale
                posY = -160.0*mapScale
            }
            
            animacionCortina(time: 1.0)
            
            banderaMapa = true
            
        }
    }
    
    func arregloEnemigos(){
        for _ in 0...20{
            enemigos.append(Enemy())
        }
    }
    
    func generaEnemigo(){
        //crea un arreglo de enemigos
        for i in 0...20{
            var coordX : CGFloat = CGFloat(arc4random_uniform(80))
            var coordY : CGFloat = CGFloat(arc4random_uniform(80))
            
            coordX = coordX *  CGFloat(exp(valor: -1, potencia: Int(arc4random_uniform(6))))
            coordY = coordY *  CGFloat(exp(valor: -1, potencia: Int(arc4random_uniform(6))))
            
            
            let ale1 = Int((arc4random_uniform(31) % 4)+1)
            let tipoM = enemyDictionary[ale1]!
            
            let ale2 = Int((arc4random_uniform(31) % 4)+1)
            let classM = classDictionary[ale2]!
            
            
            enemigos[i] = Enemy(position: CGPoint(x: coordX*mapScale, y: coordY*mapScale), tipo: tipoM, clase: classM, categoria: EnemyCategory)
            EnemyCategory += 1
        }
        
        //Agregar el enemigo a la escena
    }
    
    func generaDrop(){
        dropArray.append(Drop())
    }
    
    func agregarDrop(position: CGPoint){
        dropArray[0] = Drop(position: position, categoria: 0)
        addChild(dropArray[0].dropNode)
        dropArray[0].showItem()
    }
    
    func agregarEnemigo(index: Int){
        addChild(enemigos[index].Enemigo)
        enemigos[index].invocarEnemigo()
    }
    
    func removeAllEnemies(){
        //remover enemigos del mapa
        
        for i in 1...20 {
            enemigos[i-1].Enemigo.removeFromParent()
        }
        numEnemigo = 0
        EnemyCategory = 0
    }
    
    func removeAllDrops(){
        if dropArray.count >= 1{
            for i in 1...dropArray.count{
                dropArray[i-1].dropNode.removeFromParent()
            }
        }
    }
    
    func exp(valor: Int, potencia: Int) -> Int{
        var pot = valor
        if (potencia >= 2){
            for _ in 1...(potencia-1){
                pot = pot * valor
            }
        }
        return pot
    }
    
    func animacionCortina(time: Double){
        
        
        //cargar loadScreen
        LoadScreen.zPosition = 5
        LoadScreen.xScale = 5.0
        LoadScreen.yScale = 3.0
        LoadScreen.alpha = 0.0
        LoadScreen.name = "LoadScreen"
        cam!.addChild(LoadScreen)
        LoadScreen.run(SKAction.fadeAlpha(by: 1.0, duration: time))
        
    }
    
    func deadscreen(frame: CGRect){
        
        labelDead = SKLabelNode(text: "HAS MUERTO")
        labelDead.fontColor = UIColor(displayP3Red: CGFloat(0.4), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelDead.name = "labelDead"
        labelDead.alpha = 0.0
        labelDead.zPosition = 4.5
        labelDead.fontSize = 160
        labelDead.fontName = "Alagard"
        labelDead.position = CGPoint(x: frame.midX, y: frame.midY)
        labelDead.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        
        cam!.addChild(labelDead)
        
        labelDead.run(SKAction.fadeAlpha(by: 1.0, duration: 1.0))
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
                   
                }else if name == "Abajo"{ // player use item
                    myInterface.interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(myInterface.textureButtonDownPres))
                    
                }else if name == "Der"{ //Player atack
                    myInterface.interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(myInterface.textureButtonRightPres))
                     if (myPlayer.isAlive == true && myPlayer.stamina >= 10 && myPlayer.velocidad == 0.0){
                        //myPlayer.Atack = true
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
                    myInterface.contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(myInterface.textureMenuButtonPressed))
                }else if name == "MenuButton1"{
                    myInterface.contextoMenu.childNode(withName: "MenuButton1")?.run(SKAction.setTexture(myInterface.textureMenuButtonRightPress))
                    //
                    myInterface.contextoMenu.childNode(withName: "MenuButton2")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton3")?.run(SKAction.setTexture(myInterface.textureMenuButtonCenter))
                    myInterface.contextoMenu.childNode(withName: "MenuButton4")?.run(SKAction.setTexture(myInterface.textureMenuButtonLeft))
                    
                    myInterface.cierraMenuEquip()
                    //myInterface.lanzaMenuDif()
                    
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
                  

                    myInterface.lanzaMenuEquip()
                }else if (name == "ranura0" || name == "ranura1" || name == "ranura2" || name == "labelranura1" || name == "ranuraA") {
                    myInterface.ranuraSel(numRanura: 1)
                }else if (name == "ranura3" || name == "ranura4" || name == "ranura5" || name == "labelranura2" || name == "ranuraB") {
                    myInterface.ranuraSel(numRanura: 2)
                }else if (name == "ranura6" || name == "ranura7" || name == "ranura8" || name == "labelranura3" || name == "ranuraC") {
                    myInterface.ranuraSel(numRanura: 3)
                }else if (name == "ranura9" || name == "ranura10" || name == "ranura11" || name == "labelranura4" || name == "ranuraD") {
                    myInterface.ranuraSel(numRanura: 4)
                }else if name == "helmet"{
                    myInterface.selEquip(idEquip: 1)
                }else if name == "amulet"{
                    myInterface.selEquip(idEquip: 2)
                }else if name == "armor"{
                    myInterface.selEquip(idEquip: 3)
                }else if name == "weapon"{
                    myInterface.selEquip(idEquip: 4)
                }else if name == "shield"{
                    myInterface.selEquip(idEquip: 5)
                }else if name == "graves"{
                    myInterface.selEquip(idEquip: 6)
                }else if name == "ring1"{
                    myInterface.selEquip(idEquip: 7)
                }else if name == "ring2"{
                    myInterface.selEquip(idEquip: 8)
                }else if name == "ring3"{
                    myInterface.selEquip(idEquip: 9)
                }else if (name == "botonEquip1" || name == "botonEquip2" || name == "botonEquip3" || name == "labelBoton") {
                    
                    myInterface.ventana1.childNode(withName: "botonEquip1")?.run(SKAction.setTexture(myInterface.textureMenuTitleLeftPress))
                    myInterface.ventana1.childNode(withName: "botonEquip2")?.run(SKAction.setTexture(myInterface.textureMenuTitleCenterPress))
                    myInterface.ventana1.childNode(withName: "botonEquip3")?.run(SKAction.setTexture(myInterface.textureMenuTitleRightPress))
                    
                    myInterface.labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(0.5), alpha: CGFloat(1.0))
    
                }else if (name == "botonAcept1" || name == "botonAcept2" || name == "botonAcept3" || name == "labelAceptar"){
                    
                    myInterface.ventanaEmergente.childNode(withName: "botonAcept1")!.run(SKAction.setTexture(myInterface.textureMenuTitleLeftPress))
                    myInterface.ventanaEmergente.childNode(withName: "botonAcept2")!.run(SKAction.setTexture(myInterface.textureMenuTitleCenterPress))
                    myInterface.ventanaEmergente.childNode(withName: "botonAcept3")!.run(SKAction.setTexture(myInterface.textureMenuTitleRightPress))
                    myInterface.labelAceptar.fontColor = UIColor(displayP3Red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(0.5), alpha: CGFloat(1.0))
                   
                    
                }
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            
            //var isUserInteractionEnabled: Bool
            //A Boolean value that indicates whether the node receives touch events
            
            //self.touchUp(atPoint: t.location(in: self))
            let positionInScene = t.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            
            if let name = touchedNode.name
            {
                
                if name == "Menu"{
                    lanzaMenu()
                    myInterface.selEquip(idEquip: 1)
                    myInterface.interfaz.removeFromParent()
                    myInterface.interfaz.childNode(withName: "Menu")?.run(SKAction.setTexture(myInterface.textureMenuButton))
                }else if name == "Arriba"{
                    myInterface.interfaz.childNode(withName: "Arriba")?.run(SKAction.setTexture(myInterface.textureButtonUp))
                    
                }else if name == "Abajo"{
                    myInterface.interfaz.childNode(withName: "Abajo")?.run(SKAction.setTexture(myInterface.textureButtonDown))
                    //usa item
                    if (myInterface.numItems > 0){
                        myInterface.numItems -= 1
                        myPlayer.vida += 75
                        if myPlayer.vida > myPlayer.vidaMax{
                            myPlayer.vida = myPlayer.vidaMax
                        }
                        myInterface.healt(vida: myPlayer.vida, vidaMax: myPlayer.vidaMax)
                        myInterface.actualizaItem()
                        
                    }
                }else if name == "Der"{
                    myInterface.interfaz.childNode(withName: "Der")?.run(SKAction.setTexture(myInterface.textureButtonRight))
                    
                }else if name == "Izq"{
                    myInterface.interfaz.childNode(withName: "Izq")?.run(SKAction.setTexture(myInterface.textureButtonLeft))
                    
                }else if name == "MenuWin"{
                    cierramenu()
                    myInterface.contextoMenu.childNode(withName: "MenuWin")?.run(SKAction.setTexture(myInterface.textureMenuButton))
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
                    if  (myInterface.labelEquip.text == "Equipar" || myInterface.labelEquip.text == "Desequipar"){
                        
                        myInterface.equiparItem()
                        //actualizar las listas del jugador
                        myPlayer.itemsEquiped = myInterface.itemsEquipedPlayer
                        myPlayer.reloadItems()
                    }else{
                        myInterface.ventana1.childNode(withName: "botonEquip1")?.run(SKAction.setTexture(myInterface.textureMenuTitleLeft))
                        myInterface.ventana1.childNode(withName: "botonEquip2")?.run(SKAction.setTexture(myInterface.textureMenuTitleCenter))
                        myInterface.ventana1.childNode(withName: "botonEquip3")?.run(SKAction.setTexture(myInterface.textureMenuTitleRight))
                        
                        myInterface.labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
                    }
                    
                }else if (name == "botonAcept1" || name == "botonAcept2" || name == "botonAcept3" || name == "labelAceptar"){
                   
                    if estadoItem == 0{
                        myInterface.recogerObjeto()
                        //animacion desaparece item
                        dropArray[dropActual].takeDrop()
                        //reordenar arreglo de drops?
                        estadoItem = 1
                        //aumentar el contador de items
                        myInterface.numItems += 1
                        myInterface.actualizaItem()
                        
                        banderaDrop = false
                       
                    }else{
                        myInterface.removeVentanaE()
                        estadoItem = 0
                    }
                    
                    myInterface.ventanaEmergente.childNode(withName: "botonAcept1")?.run(SKAction.setTexture(myInterface.textureMenuTitleLeft))
                    myInterface.ventanaEmergente.childNode(withName: "botonAcept2")?.run(SKAction.setTexture(myInterface.textureMenuTitleCenter))
                    myInterface.ventanaEmergente.childNode(withName: "botonAcept3")?.run(SKAction.setTexture(myInterface.textureMenuTitleRight))
                    myInterface.labelAceptar.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
                    
                    
                }
            }
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        super.update(currentTime)
        
        if (myPlayer.isAlive == false && labelDead.alpha == 1.0){
           
            LoadScreen = SKSpriteNode(imageNamed: "Blue Forest")
            animacionCortina(time: 2.0)
            labelDead.alpha = 0.9
            banderaMapa = true
            mapNum = 1
        }
        
        if (myPlayer.isAlive == false && banderaMapa == true && LoadScreen.alpha == 1.0){
            
            labelDead.removeFromParent()
            map.removeFromParent()
            myInterface.removeTableroScore()
            myInterface.numItems = 5
            myInterface.actualizaItem()
            
            removeAllEnemies()
            //remover todos los objetos
            removeAllDrops()
            //quitar todas las ventanas por si acaso
            
            loadLevel(mapNum)
            
            scoreJugador = 0
            myInterface.scoreJugador = 0
            myInterface.actualizaScore()
            
            myPlayer.vida = myPlayer.vidaMax
            myInterface.healt(vida: myPlayer.vida, vidaMax: myPlayer.vidaMax)
            myPlayer.isAlive = true
            myPlayer.orientarPersonaje()
            myPlayer.movePlayerTo(x: 0.0, y: 0.0)
            
            LoadScreen.run(SKAction.fadeAlpha(by: -1.0, duration: 2.0))
            
            banderaMapa = false
            
        }
        
        
        if myPlayer.isAlive == true{
            
            //actualiza tablero score
            if (myInterface.scoreJugador < scoreJugador){
                myInterface.scoreJugador += 1
                myInterface.actualizaScore()
            }
            
            if enemigos.count >= 1 {
                for i in 1...enemigos.count {
                    enemigos[i-1].enemyplay(selfPosition: enemigos[i-1].Enemigo.position, playerPosition: myPlayer.Jugador.position)
                }
                
            }
            
            //Funcion que reasigna el physics body al personaje
            myPlayer.actionsPlayer()
            
            if myPlayer.Atack == true {myPlayer.setWeaponPhysicsBody()}
            
            myInterface.rotateAnalogStick.myPlayer.orientacionPersonaje = direccionPersonaje
            
            //El personaje se mueve en la direccion del vector de posicion
            myPlayer.movePlayer()
            myInterface.restoreStamina(myPlayer.action(), myPlayer.staminaMax)
            
            let posJugador = myPlayer.Jugador.position
            
            //control de la ventana del drop
            if banderaDrop == true{
                distanciaItem = ((posJugador.x-posItem.x)*(posJugador.x-posItem.x)+(posJugador.y-posItem.y)*(posJugador.y-posItem.y)).squareRoot()
                
                //print(distanciaItem)
                if distanciaItem > 40.0*mapScale{
                    myInterface.removeVentanaE()
                    
                }
            }
        
            if let camera = cam{
                camera.position=posJugador
                
                if (camera.childNode(withName: "LoadScreen")?.alpha == 1.0 &&  banderaMapa == true){
                    
                    map.removeFromParent()
                    myInterface.removeTableroScore()
                    
                    removeAllEnemies()
                    
                    loadLevel(mapNum)
                    //mover al personaje a la emtrada/salida de la cueva
                    myPlayer.movePlayerTo(x: posX, y: posY) //la posicion se calcula con la posicion del tile al que se
                    //quiere colocar al personaje multuplicado por la escala del mapa
                    
                    camera.childNode(withName: "LoadScreen")!.run(SKAction.fadeAlpha(by: -1.0, duration: 1.0))
                    banderaMapa = false
                    //
                }
                if (camera.childNode(withName: "LoadScreen")?.alpha == 0.0 &&  banderaMapa == false){
                    camera.childNode(withName: "LoadScreen")!.removeFromParent()
                }
            }
        }
    }
}
