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
    
    var orientacionPersonaje: Int = 3
    
    let escala: CGFloat = 3.0
   
    var Jugador = SKNode()
    var avatarPlayer = SKSpriteNode()
    var weapon = SKSpriteNode()
    var hair = SKSpriteNode()
    var helm = SKSpriteNode()
    var leggs = SKSpriteNode()
    var armor = SKSpriteNode()
    var shield = SKSpriteNode()
    
    var myWeapon = Equip()
    var myArmor = Equip()
    var myHelm = Equip()
    var myLeggs = Equip()
    var myShield = Equip()
    
    var equipPlayer: [Equip] = []
    
    //Movimiento personaje
    var velocidadXp: CGFloat = 1.0
    var velocidadXm: CGFloat = 1.0
    var velocidadYp: CGFloat = 1.0
    var velocidadYm: CGFloat = 1.0
    var velocidad: CGFloat = 0.0
    
     // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
    //PlayerCategory
    let playerCategory: UInt32 = 0x01 << 0
    //ArmsCategory
    let armsCategory: UInt32 = 0x01 << 5
    //EnemyCategory
    let enemyCategory: UInt32 = 0x01 << 6
    
    //Stats personaje
    var vida = 200.0
    var vidaMax = 200.0
    var stamina = 50.0
    var staminaMax = 50.0
    
    var isAlive: Bool = true
    var Atack: Bool = false // variable para saber si el jugador esta atacando
   
    
    init(posicion position: CGPoint, genero gen: String){
        
        //crear una coleccion para el genero
        createAnimations(gen)
        
        avatarPlayer = SKSpriteNode(texture: playerViewS) //textura inicial del jugador
        // se añade un physicsbody al jugador para detectar colisiones
        avatarPlayer.physicsBody = SKPhysicsBody(texture: playerViewS, size: avatarPlayer.size)
        avatarPlayer.physicsBody!.categoryBitMask = playerCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarPlayer.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | enemyCategory
        avatarPlayer.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        avatarPlayer.physicsBody!.isDynamic=true
        avatarPlayer.zPosition = 1
        
        //Equipo del jugador
        myWeapon = Equip(genero: gen, tipo: "weapon", nombre: "short_sword")
        weapon = myWeapon.equipNode
        /*myHelm = Equip(genero: gen, tipo: "helmet", nombre: "bronze_legion_1")
        helm = myHelm.equipNode
        myLeggs = Equip(genero: gen, tipo: "leggings", nombre: "legion")
        leggs = myLeggs.equipNode
        myArmor = Equip(genero: gen, tipo: "armor", nombre: "steel_legion")
        armor = myArmor.equipNode
        myShield = Equip(genero: gen, tipo: "shield", nombre: "spartan")
        shield = myShield.equipNode*/
        
        //Apariencia
        hair =  SKSpriteNode(texture: playerHairViewS)
        hair.zPosition = avatarPlayer.zPosition + 0.3
        weapon.zPosition = avatarPlayer.zPosition + 0.5
        /*helm.zPosition = avatarPlayer.zPosition + 0.4
        leggs.zPosition = avatarPlayer.zPosition + 0.1
        armor.zPosition = avatarPlayer.zPosition + 0.2
        shield.zPosition = avatarPlayer.zPosition + 0.4
        
        
        equipPlayer.append(myHelm)
        equipPlayer.append(myWeapon)
        equipPlayer.append(myArmor)
        equipPlayer.append(myShield)
        equipPlayer.append(myLeggs)*/
        
        
        
        //Juntando elementos del jugador
        Jugador.addChild(avatarPlayer)
        
        
        Jugador.addChild(weapon)
        Jugador.addChild(hair)
        /*Jugador.addChild(helm)
        Jugador.addChild(leggs)
        Jugador.addChild(armor)
        Jugador.addChild(shield)*/
        
        Jugador.position = position
        Jugador.setScale(escala)
        
        
    }
    
    func setPlayerPhysicsBody(){
        avatarPlayer.physicsBody = SKPhysicsBody(texture: avatarPlayer.texture!, size: avatarPlayer.size)
        avatarPlayer.physicsBody!.categoryBitMask = playerCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarPlayer.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | enemyCategory
        avatarPlayer.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        avatarPlayer.physicsBody!.isDynamic=true
    }
    
    func setWeaponPhysicsBody(){
        
        if let temp = SKPhysicsBody(texture: weapon.texture!, size: weapon.size) as? SKPhysicsBody {
            weapon.physicsBody = temp
            weapon.physicsBody?.categoryBitMask = armsCategory // categoria del jugador
            // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
            weapon.physicsBody?.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | enemyCategory
            weapon.physicsBody?.collisionBitMask = 0 // esta opcion debe estar en 0
            // estas configuraciones tambien son necesarias
            weapon.physicsBody?.isDynamic=true
        }
    }
    
    init(){
    }
    
    func createAnimations(_ genero: String) {
        
        let playerAtlas = SKTextureAtlas(named: "player")
        //let sheet=SpriteSheet2(texture: playerAtlas.textureNamed("\(genero)_white"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_white")!, rows: 21, columns: 13)
        
        let hairAtlas = SKTextureAtlas(named: "hair")
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
            /*helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.equipMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.equipMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            armor.run(SKAction.repeatForever(SKAction.animate(with: myArmor.equipMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"armorPlayer")
            shield.run(SKAction.repeatForever(SKAction.animate(with: myShield.equipMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"shieldPlayer")
            */
        case 2,6:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            /*helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.equipMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.equipMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            armor.run(SKAction.repeatForever(SKAction.animate(with: myArmor.equipMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"armorPlayer")
            shield.run(SKAction.repeatForever(SKAction.animate(with: myShield.equipMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"shieldPlayer")*/
        case 3,7:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            /*helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.equipMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.equipMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            armor.run(SKAction.repeatForever(SKAction.animate(with: myArmor.equipMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"armorPlayer")
            shield.run(SKAction.repeatForever(SKAction.animate(with: myShield.equipMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"shieldPlayer")*/
        case 4,8:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            /*helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.equipMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.equipMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            armor.run(SKAction.repeatForever(SKAction.animate(with: myArmor.equipMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"armorPlayer")
            shield.run(SKAction.repeatForever(SKAction.animate(with: myShield.equipMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"shieldPlayer")*/
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
            weapon.run(SKAction.animate(with: myWeapon.equipAttackN, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashN, timePerFrame: 0.1))
            /*helm.run(SKAction.animate(with: myHelm.equipAttackN, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.equipAttackN, timePerFrame: 0.1))
            armor.run(SKAction.animate(with: myArmor.equipAttackN, timePerFrame: 0.1))
            shield.run(SKAction.animate(with: myShield.equipAttackN, timePerFrame: 0.1))*/
        case 2,6:
            avatarPlayer.run(SKAction.animate(with: playerSlashW, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.equipAttackW, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashW, timePerFrame: 0.1))
            /*helm.run(SKAction.animate(with: myHelm.equipAttackW, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.equipAttackW, timePerFrame: 0.1))
            armor.run(SKAction.animate(with: myArmor.equipAttackW, timePerFrame: 0.1))
            shield.run(SKAction.animate(with: myShield.equipAttackW, timePerFrame: 0.1))*/
        case 3,7:
            avatarPlayer.run(SKAction.animate(with: playerSlashS, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.equipAttackS, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashS, timePerFrame: 0.1))
            /*helm.run(SKAction.animate(with: myHelm.equipAttackS, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.equipAttackS, timePerFrame: 0.1))
            armor.run(SKAction.animate(with: myArmor.equipAttackS, timePerFrame: 0.1))
            shield.run(SKAction.animate(with: myShield.equipAttackS, timePerFrame: 0.1))*/
        case 4,8:
            avatarPlayer.run(SKAction.animate(with: playerSlashE, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.equipAttackE, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashE, timePerFrame: 0.1))
            /*helm.run(SKAction.animate(with: myHelm.equipAttackE, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.equipAttackE, timePerFrame: 0.1))
            armor.run(SKAction.animate(with: myArmor.equipAttackE, timePerFrame: 0.1))
            shield.run(SKAction.animate(with: myShield.equipAttackE, timePerFrame: 0.1))*/
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
            //weapon.run(SKAction.setTexture(myWeapon.equipN!))
            /*helm.run(SKAction.setTexture(myHelm.equipN!))
            leggs.run(SKAction.setTexture(myLeggs.equipN!))
            armor.run(SKAction.setTexture(myArmor.equipN!))
            shield.run(SKAction.setTexture(myShield.equipN!))*/
        case 2,6:
            avatarPlayer.run(SKAction.setTexture(playerViewW))
            hair.run(SKAction.setTexture(playerHairViewW))
           /* weapon.run(SKAction.setTexture(myWeapon.equipW!))
            helm.run(SKAction.setTexture(myHelm.equipW!))
            leggs.run(SKAction.setTexture(myLeggs.equipW!))
            armor.run(SKAction.setTexture(myArmor.equipW!))
            shield.run(SKAction.setTexture(myShield.equipW!))*/
        case 3,7:
            avatarPlayer.run(SKAction.setTexture(playerViewS))
            hair.run(SKAction.setTexture(playerHairViewS))
            /*/weapon.run(SKAction.setTexture(myWeapon.equipS!))
            helm.run(SKAction.setTexture(myHelm.equipS!))
            leggs.run(SKAction.setTexture(myLeggs.equipS!))
            armor.run(SKAction.setTexture(myArmor.equipS!))
            shield.run(SKAction.setTexture(myShield.equipS!))*/
        case 4,8:
            avatarPlayer.run(SKAction.setTexture(playerViewE))
            hair.run(SKAction.setTexture(playerHairViewE))
            /*/weapon.run(SKAction.setTexture(myWeapon.equipE!))
            helm.run(SKAction.setTexture(myHelm.equipE!))
            leggs.run(SKAction.setTexture(myLeggs.equipE!))
            armor.run(SKAction.setTexture(myArmor.equipE!))
            shield.run(SKAction.setTexture(myShield.equipE!))*/
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
                Jugador.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(1)*velocidad*velocidadYp, duration: 0.1))
            case 2: //W
                Jugador.run(SKAction.moveBy(x: CGFloat(-1)*velocidad*velocidadXm, y: CGFloat(0), duration: 0.1))
            case 3: //S
                Jugador.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(-1)*velocidad*velocidadYm, duration: 0.1))
            case 4: //E
                Jugador.run(SKAction.moveBy(x: CGFloat(1)*velocidad*velocidadXp, y: CGFloat(0), duration: 0.1))
            case 5: //NW
                Jugador.run(SKAction.moveBy(x: CGFloat(-0.7072)*velocidad*velocidadXm, y: CGFloat(0.7072)*velocidad*velocidadYp, duration: 0.1))
            case 6: //SW
                Jugador.run(SKAction.moveBy(x: CGFloat(-0.7072)*velocidad*velocidadXm, y: CGFloat(-0.7072)*velocidad*velocidadYm, duration: 0.1))
            case 7: //SE
                Jugador.run(SKAction.moveBy(x: CGFloat(0.7072)*velocidad*velocidadXp, y: CGFloat(-0.7072)*velocidad*velocidadYm, duration: 0.1))
            case 8: //NE
                Jugador.run(SKAction.moveBy(x: CGFloat(0.7072)*velocidad*velocidadXp, y: CGFloat(0.7072)*velocidad*velocidadYp, duration: 0.1))
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
            /*helm.run(SKAction.animate(with: myHelm.deadequip, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.deadequip, timePerFrame: 0.1))
            armor.run(SKAction.animate(with: myArmor.deadequip, timePerFrame: 0.1))
            shield.run(SKAction.animate(with: myShield.deadequip, timePerFrame: 0.1))*/
            isAlive = false
        }
    }
    
   
    func resetpersonaje(){
            avatarPlayer.removeAllActions()
            hair.removeAllActions()
            /*helm.removeAllActions()
            leggs.removeAllActions()
            weapon.removeAllActions()
            armor.removeAllActions()
            shield.removeAllActions()*/
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
    
}


