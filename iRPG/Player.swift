//
//  Player.swift
//  iRPG
//
//  Created by Israel on 3/11/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class Player {
    // Texturas jugador
    var playerViewN: SKTexture = SKTexture()
    var playerViewS: SKTexture = SKTexture()
    var playerViewE: SKTexture = SKTexture()
    var playerViewW: SKTexture = SKTexture()
    var playerHairViewN: SKTexture = SKTexture()
    var playerHairViewS: SKTexture = SKTexture()
    var playerHairViewE: SKTexture = SKTexture()
    var playerHairViewW: SKTexture = SKTexture()
    
    var playerMoveN: [SKTexture] = []
    var playerMoveS: [SKTexture] = []
    var playerMoveE: [SKTexture] = []
    var playerMoveW: [SKTexture] = []
    
    var playerHairMoveN: [SKTexture] = []
    var playerHairMoveS: [SKTexture] = []
    var playerHairMoveE: [SKTexture] = []
    var playerHairMoveW: [SKTexture] = []
    
    var playerSlashN: [SKTexture] = []
    var playerSlashS: [SKTexture] = []
    var playerSlashE: [SKTexture] = []
    var playerSlashW: [SKTexture] = []
    
    var playerHairSlashN: [SKTexture] = []
    var playerHairSlashS: [SKTexture] = []
    var playerHairSlashE: [SKTexture] = []
    var playerHairSlashW: [SKTexture] = []
    
    var deadPlayer: [SKTexture] = []
    var deadPlayerHair: [SKTexture] = []
    
    var keyTextures: [SKTexture] = []
    
    var orientacionPersonaje: Int = 3
   
    
    let escala: CGFloat = 3.0
   
    var Jugador = SKNode()
    var avatarPlayer = SKSpriteNode()
    var hair = SKSpriteNode()
    //items equipados por el jugador
    var equipPlayer: [Equip] = []
    //items del jugador
    var items: [(String,String)] = []
    var itemsEquiped: [(String,String)] = []
    
    //information Player
    var level: Int?
    var souls: Int?
    var generoPersonaje: String = ""
    var clasePersonaje: String?
    var nombrePersonaje: String = ""
    
    //stats Player
    var vitality: Int?
    var endurance: Int?
    var strenght: Int?
    var dexterity: Int?
    
    //Movimiento personaje
    var velocidad: CGFloat = 0.0
    
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //PlayerCategory
    let playerCategory: UInt32 = 0x01 << 0
    
    //TileMapCategories
    let WallCategory: UInt32 = 0x01 << 31
    // Cave Entrance
    let caveEntrance: UInt32 = 0x01 << 30
    //ArmsCategory
    //ArmsCategory
    let playerArmCategory: UInt32 = 0x01 << 1
    let enemyArmCategory: UInt32 = 0x01 << 29
    //
    let fireCategory: UInt32 = 0x01 << 28
    //EnemyCategory
    let enemyCategory: UInt32 = 0x01 << 8
    
    //Stats personaje
    var vida = 200.0
    var vidaMax = 200.0
    var stamina = 50.0
    var staminaMax = 50.0
    
    var isAlive: Bool = true
    var Atack: Bool = false // variable para saber si el jugador esta atacando
   
    
    init(posicion position: CGPoint, genero gen: String){
        
        generoPersonaje = gen
        //crear una coleccion para el genero
        createAnimations(gen)
        
        avatarPlayer = SKSpriteNode(texture: playerViewS) //textura inicial del jugador
        avatarPlayer.name = "avatarPlayer"
        avatarPlayer.zPosition = 1
        
        //Apariencia
        hair =  SKSpriteNode(texture: playerHairViewS)
        
        hair.zPosition = avatarPlayer.zPosition + 0.3
     
        //Items del jugador (de 0 a infinito)
        items.append(("leggings","legion"))
        items.append(("armor","bronze"))
        items.append(("armor","legion_steel"))
        items.append(("armor","legion_bronze"))
        items.append(("armor","legion_gold"))
        items.append(("helmet","bronze_legion_1"))
        items.append(("helmet","steel_legion_2"))
        items.append(("helmet","gold_legion_3"))
        items.append(("helmet","bronze_legion_2"))
        items.append(("helmet","bronze_legion_3"))
        items.append(("helmet","steel_legion_1"))
        items.append(("helmet","steel_legion_3"))
        items.append(("helmet","gold_legion_1"))
        items.append(("helmet","gold_legion_2"))
        items.append(("shield","spartan"))
        items.append(("shield","crusader"))
        items.append(("weapon","short_sword"))
        
        //Items equipados del jugador (de 0 a 5)
        itemsEquiped.append(("leggings","legion"))
        itemsEquiped.append(("armor","legion_steel"))
        itemsEquiped.append(("helmet","bronze_legion_1"))
        itemsEquiped.append(("shield","spartan"))
        itemsEquiped.append(("weapon","short_sword"))
        
        //Equipo del jugador (se van a contruir los objetos a partir de los nombres de los items)
        equipPlayer.append(Equip(genero: gen, tipo: "leggings", nombre: "legion"))
        equipPlayer.append(Equip(genero: gen, tipo: "armor", nombre: "legion_steel"))
        equipPlayer.append(Equip(genero: gen, tipo: "helmet", nombre: "bronze_legion_1"))
        equipPlayer.append(Equip(genero: gen, tipo: "shield", nombre: "spartan"))
        equipPlayer.append(Equip(genero: gen, arma: "sword"))
        
        setZPosition()
        
        if equipPlayer.count >= 1 {
            for i in 1...equipPlayer.count {
                Jugador.addChild(equipPlayer[i-1].equipNode)
            }
        }
        
        //Juntando elementos del jugador
        Jugador.addChild(avatarPlayer)
        Jugador.addChild(hair)
        
        Jugador.position = position
        Jugador.setScale(escala)
        
        let sizePlayer = CGSize(width: playerViewS.size().width*escala, height: playerViewS.size().height*escala)
        // se añade un physicsbody al jugador para detectar colisiones
        Jugador.physicsBody = SKPhysicsBody(texture: playerViewS, size: sizePlayer)
        Jugador.physicsBody!.categoryBitMask = playerCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        Jugador.physicsBody!.contactTestBitMask = caveEntrance
        Jugador.physicsBody!.collisionBitMask = WallCategory
        // estas configuraciones tambien son necesarias
        Jugador.physicsBody!.isDynamic = true
        Jugador.physicsBody!.allowsRotation = false
        
        
    }

    func addItem(tipo: String, nombre: String){
        items.append((tipo,nombre))
    }
    
    
    func setZPosition(){
        equipPlayer[0].equipNode.zPosition = avatarPlayer.zPosition + 0.1 //leggs
        equipPlayer[1].equipNode.zPosition = avatarPlayer.zPosition + 0.2 //armor
        equipPlayer[2].equipNode.zPosition = avatarPlayer.zPosition + 0.4 //helmet
        equipPlayer[3].equipNode.zPosition = avatarPlayer.zPosition + 0.5 //shield
        equipPlayer[4].equipNode.zPosition = avatarPlayer.zPosition + 0.6 //weapon
    }
    
    func setPlayerPhysicsBody(){
        avatarPlayer.physicsBody = SKPhysicsBody(texture: avatarPlayer.texture!, size: avatarPlayer.size)
        avatarPlayer.physicsBody!.categoryBitMask = playerCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarPlayer.physicsBody!.contactTestBitMask = caveEntrance
        avatarPlayer.physicsBody!.collisionBitMask = WallCategory
        // estas configuraciones tambien son necesarias
        avatarPlayer.physicsBody!.isDynamic=true
    }
    
    func setWeaponPhysicsBody(){
        //el arma debe ser el ultimo elemento del arreglo
        equipPlayer[equipPlayer.count-1].equipNode.physicsBody = SKPhysicsBody(texture: equipPlayer[equipPlayer.count-1].equipNode.texture!, size: equipPlayer[equipPlayer.count-1].equipNode.size)
        equipPlayer[equipPlayer.count-1].equipNode.physicsBody?.categoryBitMask = playerArmCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        equipPlayer[equipPlayer.count-1].equipNode.physicsBody?.contactTestBitMask = WallCategory | enemyCategory
        equipPlayer[equipPlayer.count-1].equipNode.physicsBody?.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        equipPlayer[equipPlayer.count-1].equipNode.physicsBody?.isDynamic=true
        
    }
    
    init(){
    }
    
    func createAnimations(_ genero: String) {
        
        //let playerAtlas = SKTextureAtlas(named: "player")
        //let sheet2=SpriteSheet2(texture: playerAtlas.textureNamed("\(genero)_white"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_white")!, rows: 21, columns: 13)
        
        //let hairAtlas = SKTextureAtlas(named: "hair")
        //let sheet2=SpriteSheet2(texture: hairAtlas.textureNamed("\(genero)_raven"), rows: 21, columns: 13)
        let sheet2=SpriteSheet(image: UIImage(named: "\(genero)_raven")!, rows: 21, columns: 13)
        
        playerViewN = sheet.textureForColumn(column: 0, row: 0)
        playerViewW = sheet.textureForColumn(column: 0, row: 1)
        playerViewS = sheet.textureForColumn(column: 0, row: 2)
        playerViewE = sheet.textureForColumn(column: 0, row: 3)
        
        playerHairViewN = sheet2.textureForColumn(column: 0, row: 0)
        playerHairViewW = sheet2.textureForColumn(column: 0, row: 1)
        playerHairViewS = sheet2.textureForColumn(column: 0, row: 2)
        playerHairViewE = sheet2.textureForColumn(column: 0, row: 3)
        
        for i in 1...8 {
            //Body
            playerMoveN.append(sheet.textureForColumn(column: i, row: 8))
            playerMoveW.append(sheet.textureForColumn(column: i, row: 9))
            playerMoveS.append(sheet.textureForColumn(column: i, row: 10))
            playerMoveE.append(sheet.textureForColumn(column: i, row: 11))
            //hair
            playerHairMoveN.append(sheet2.textureForColumn(column: i, row: 8))
            playerHairMoveW.append(sheet2.textureForColumn(column: i, row: 9))
            playerHairMoveS.append(sheet2.textureForColumn(column: i, row: 10))
            playerHairMoveE.append(sheet2.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            //body
            playerSlashN.append(sheet.textureForColumn(column: i, row: 12))
            playerSlashW.append(sheet.textureForColumn(column: i, row: 13))
            playerSlashS.append(sheet.textureForColumn(column: i, row: 14))
            playerSlashE.append(sheet.textureForColumn(column: i, row: 15))
            //hair
            playerHairSlashN.append(sheet2.textureForColumn(column: i, row: 12))
            playerHairSlashW.append(sheet2.textureForColumn(column: i, row: 13))
            playerHairSlashS.append(sheet2.textureForColumn(column: i, row: 14))
            playerHairSlashE.append(sheet2.textureForColumn(column: i, row: 15))
            
        }
        playerSlashN.append(sheet.textureForColumn(column: 0, row: 12))
        playerSlashW.append(sheet.textureForColumn(column: 0, row: 13))
        playerSlashS.append(sheet.textureForColumn(column: 0, row: 14))
        playerSlashE.append(sheet.textureForColumn(column: 0, row: 15))
        //hair
        playerHairSlashN.append(sheet2.textureForColumn(column: 0, row: 12))
        playerHairSlashW.append(sheet2.textureForColumn(column: 0, row: 13))
        playerHairSlashS.append(sheet2.textureForColumn(column: 0, row: 14))
        playerHairSlashE.append(sheet2.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadPlayer.append(sheet.textureForColumn(column: i, row: 20))
            deadPlayerHair.append(sheet2.textureForColumn(column: i, row: 20))
        }
        
        
        
        
    }
    
    func animateMove() {
        switch orientacionPersonaje {
        case 1,5:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipPlayer[i-1].equipMoveN, timePerFrame: 0.1)))
                }
            }
            
        case 2,6:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipPlayer[i-1].equipMoveW, timePerFrame: 0.1)))
                }
            }
            
        case 3,7:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipPlayer[i-1].equipMoveS, timePerFrame: 0.1)))
                }
            }
            
        case 4,8:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipPlayer[i-1].equipMoveE, timePerFrame: 0.1)))
                }
            }
            
        default:
            break
        }

    }
    
    func atack(){
        
        resetpersonaje()
        orientarPersonaje()
        Atack = true
        
        switch orientacionPersonaje {
        case 1,5:
            avatarPlayer.run(SKAction.animate(with: playerSlashN, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashN, timePerFrame: 0.1))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.animate(with: equipPlayer[i-1].equipAttackN, timePerFrame: 0.1))
                }
            }
            
        case 2,6:
            avatarPlayer.run(SKAction.animate(with: playerSlashW, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashW, timePerFrame: 0.1))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.animate(with: equipPlayer[i-1].equipAttackW, timePerFrame: 0.1))
                }
            }
            
        case 3,7:
            avatarPlayer.run(SKAction.animate(with: playerSlashS, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashS, timePerFrame: 0.1))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.animate(with: equipPlayer[i-1].equipAttackS, timePerFrame: 0.1))
                }
            }
            
        case 4,8:
            avatarPlayer.run(SKAction.animate(with: playerSlashE, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashE, timePerFrame: 0.1))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.animate(with: equipPlayer[i-1].equipAttackE, timePerFrame: 0.1))
                }
            }
            
        default:
            break
        }
        orientarPersonaje()
        
    }
    
    
    func orientarPersonaje() {
        //resetpersonaje()
        
        switch orientacionPersonaje {
        case 1,5:
            avatarPlayer.run(SKAction.setTexture(playerViewN))
            hair.run(SKAction.setTexture(playerHairViewN))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.setTexture(equipPlayer[i-1].equipN!))
                }
            }
            
        case 2,6:
            avatarPlayer.run(SKAction.setTexture(playerViewW))
            hair.run(SKAction.setTexture(playerHairViewW))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.setTexture(equipPlayer[i-1].equipW!))
                }
            }
            
        case 3,7:
            avatarPlayer.run(SKAction.setTexture(playerViewS))
            hair.run(SKAction.setTexture(playerHairViewS))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.setTexture(equipPlayer[i-1].equipS!))
                }
            }
            
        case 4,8:
            avatarPlayer.run(SKAction.setTexture(playerViewE))
            hair.run(SKAction.setTexture(playerHairViewE))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.setTexture(equipPlayer[i-1].equipE!))
                }
            }
            
        default:
            
            break
        }
        
    }
    
    //funcion que mueve el pesonaje a una coordenada del mapa
    func movePlayerTo(x posX: CGFloat, y posY: CGFloat){
        
        Jugador.run(SKAction.moveTo(x: posX, duration: 0.1))
        Jugador.run(SKAction.moveTo(y: posY, duration: 0.1))
        
    }
    
    //funcion que muve el personaje en una direccion
    func movePlayer(){
        if Atack == false {
            switch orientacionPersonaje {
            case 1: //N
                Jugador.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(1)*velocidad, duration: 0.1))
            case 2: //W
                Jugador.run(SKAction.moveBy(x: CGFloat(-1)*velocidad, y: CGFloat(0), duration: 0.1))
            case 3: //S
                Jugador.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(-1)*velocidad, duration: 0.1))
            case 4: //E
                Jugador.run(SKAction.moveBy(x: CGFloat(1)*velocidad, y: CGFloat(0), duration: 0.1))
            case 5: //NW
                Jugador.run(SKAction.moveBy(x: CGFloat(-0.7072)*velocidad, y: CGFloat(0.7072)*velocidad, duration: 0.1))
            case 6: //SW
                Jugador.run(SKAction.moveBy(x: CGFloat(-0.7072)*velocidad, y: CGFloat(-0.7072)*velocidad, duration: 0.1))
            case 7: //SE
                Jugador.run(SKAction.moveBy(x: CGFloat(0.7072)*velocidad, y: CGFloat(-0.7072)*velocidad, duration: 0.1))
            case 8: //NE
                Jugador.run(SKAction.moveBy(x: CGFloat(0.7072)*velocidad, y: CGFloat(0.7072)*velocidad, duration: 0.1))
            default:
                break
            }
        }
    }
    
    func muertePersonaje(){
        if isAlive == true {
            resetpersonaje()
            avatarPlayer.run(SKAction.animate(with: deadPlayer, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: deadPlayerHair, timePerFrame: 0.1))
            
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.run(SKAction.animate(with: equipPlayer[i-1].deadequip, timePerFrame: 0.1))
                }
            }
            
            isAlive = false
        }
    }
    
   
    func resetpersonaje(){
            avatarPlayer.removeAllActions()
            hair.removeAllActions()
        
            if equipPlayer.count >= 1 {
                for i in 1...equipPlayer.count {
                    equipPlayer[i-1].equipNode.removeAllActions()
                }
            }
        
    }
    
    func actionsPlayer(){
        if (avatarPlayer.hasActions()==false){
            Atack = false
        }
    }
    
    func damage(_ value: Double){
        if (vida >= 0){
            vida -= value
        }
    }
    
    func action() -> Double{
        if (stamina <= staminaMax){
            stamina += 0.2
        }
        return stamina
    }
    
    func reloadItems(){
        
        for i in 0...(itemsEquiped.count-1){
            equipPlayer[i].equipNode.removeFromParent()
            if (itemsEquiped[i].1 != "null"){
                equipPlayer[i].equipNode.removeFromParent()
                equipPlayer[i] = Equip(genero: generoPersonaje, tipo: itemsEquiped[i].0, nombre: itemsEquiped[i].1,orientacion: orientacionPersonaje)
                Jugador.addChild(equipPlayer[i].equipNode)
            }
        }
        setZPosition()
    
    }
    
}


