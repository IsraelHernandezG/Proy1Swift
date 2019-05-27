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
    var myWeapon = Weapon()
    var myArmor = Armor()
    var myHelm = Helm()
    var myLeggs = Leggings()
    
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
        myWeapon = Weapon(nombreAtlas: "Swords", nombreWeapon: "sword")
        weapon = myWeapon.weaponNode
        myHelm = Helm(nombreAtlas: "helm", nombreHelm: "helm")
        helm = myHelm.helmNode
        myLeggs = Leggings(nombreAtlas: "Leggs", nombreHelm: "Leggings")
        leggs = myLeggs.leggingsNode
        
        
        //Apariencia
        hair =  SKSpriteNode(texture: playerHairViewS)
        hair.zPosition = 1.1
        helm.zPosition = 1.2
        
        
        //Juntando elementos del jugador
        Jugador.addChild(avatarPlayer)
        Jugador.addChild(weapon)
        Jugador.addChild(hair)
        Jugador.addChild(helm)
        Jugador.addChild(leggs)
        
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
        
        let playerWalk = SKTextureAtlas(named: "\(genero)_walk")
        let playerSlash = SKTextureAtlas(named: "\(genero)_slash")
        let hairFrames = SKTextureAtlas(named: "\(genero)_hair")
        
        playerViewN = playerWalk.textureNamed("\(genero)_N-1")
        playerViewS = playerWalk.textureNamed("\(genero)_S-1")
        playerViewE = playerWalk.textureNamed("\(genero)_E-1")
        playerViewW = playerWalk.textureNamed("\(genero)_W-1")
        playerHairViewN = hairFrames.textureNamed("\(genero)_hair_N-1")
        playerHairViewS = hairFrames.textureNamed("\(genero)_hair_S-1")
        playerHairViewE = hairFrames.textureNamed("\(genero)_hair_E-1")
        playerHairViewW = hairFrames.textureNamed("\(genero)_hair_W-1")
        
        
        for i in 2...9 {
            //Body
            let playerTexureN = "\(genero)_N-\(i)"
            playerMoveN.append(playerWalk.textureNamed(playerTexureN))
            let playerTexureS = "\(genero)_S-\(i)"
            playerMoveS.append(playerWalk.textureNamed(playerTexureS))
            let playerTexureE = "\(genero)_E-\(i)"
            playerMoveE.append(playerWalk.textureNamed(playerTexureE))
            let playerTexureW = "\(genero)_W-\(i)"
            playerMoveW.append(playerWalk.textureNamed(playerTexureW))
            //hair
            let hairTextureN = "\(genero)_hair_N-\(i)"
            playerHairMoveN.append(hairFrames.textureNamed(hairTextureN))
            let hairTextureS = "\(genero)_hair_S-\(i)"
            playerHairMoveS.append(hairFrames.textureNamed(hairTextureS))
            let hairTextureE = "\(genero)_hair_E-\(i)"
            playerHairMoveE.append(hairFrames.textureNamed(hairTextureE))
            let hairTextureW = "\(genero)_hair_W-\(i)"
            playerHairMoveW.append(hairFrames.textureNamed(hairTextureW))
        }
        
        for i in 1...7 {
            //body
            let playerTextureName1 = "slash_\(genero)_N-\(i)"
            playerSlashN.append(playerSlash.textureNamed(playerTextureName1))
            let playerTextureName2 = "slash_\(genero)_S-\(i)"
            playerSlashS.append(playerSlash.textureNamed(playerTextureName2))
            let playerTextureName3 = "slash_\(genero)_E-\(i)"
            playerSlashE.append(playerSlash.textureNamed(playerTextureName3))
            let playerTextureName4 = "slash_\(genero)_W-\(i)"
            playerSlashW.append(playerSlash.textureNamed(playerTextureName4))
            //hair
            let hairTextureName1 = "\(genero)_hair_slash_N-\(i)"
            playerHairSlashN.append(hairFrames.textureNamed(hairTextureName1))
            let hairTextureName2 = "\(genero)_hair_slash_S-\(i)"
            playerHairSlashS.append(hairFrames.textureNamed(hairTextureName2))
            let hairTextureName3 = "\(genero)_hair_slash_E-\(i)"
            playerHairSlashE.append(hairFrames.textureNamed(hairTextureName3))
            let hairTextureName4 = "\(genero)_hair_slash_W-\(i)"
            playerHairSlashW.append(hairFrames.textureNamed(hairTextureName4))
        }
        for i in 1...6 {
            let deadBody = "\(genero)_dead-\(i)"
            deadPlayer.append(playerWalk.textureNamed(deadBody))
            let deadHair = "\(genero)_hair_dead-\(i)"
            deadPlayerHair.append(hairFrames.textureNamed(deadHair))
        }
        
        
    }
    
    func animateMove() {
        switch orientacionPersonaje {
        case 1,5:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggingsMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            
        case 2,6:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggingsMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            
        case 3,7:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggingsMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")

        case 4,8:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: playerHairMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggingsMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")

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
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackN, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashN, timePerFrame: 0.1))
            helm.run(SKAction.animate(with: myHelm.helmAttackN, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggingsAttackN, timePerFrame: 0.1))
        case 2,6:
            avatarPlayer.run(SKAction.animate(with: playerSlashW, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackW, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashW, timePerFrame: 0.1))
            helm.run(SKAction.animate(with: myHelm.helmAttackW, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggingsAttackW, timePerFrame: 0.1))
        case 3,7:
            avatarPlayer.run(SKAction.animate(with: playerSlashS, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackS, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashS, timePerFrame: 0.1))
            helm.run(SKAction.animate(with: myHelm.helmAttackS, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggingsAttackS, timePerFrame: 0.1))
        case 4,8:
            avatarPlayer.run(SKAction.animate(with: playerSlashE, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackE, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: playerHairSlashE, timePerFrame: 0.1))
            helm.run(SKAction.animate(with: myHelm.helmAttackE, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggingsAttackE, timePerFrame: 0.1))
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
            helm.run(SKAction.setTexture(myHelm.helmN!))
            leggs.run(SKAction.setTexture(myLeggs.leggingsN!))
        case 2,6:
            avatarPlayer.run(SKAction.setTexture(playerViewW))
            hair.run(SKAction.setTexture(playerHairViewW))
            helm.run(SKAction.setTexture(myHelm.helmW!))
            leggs.run(SKAction.setTexture(myLeggs.leggingsW!))
        case 3,7:
            avatarPlayer.run(SKAction.setTexture(playerViewS))
            hair.run(SKAction.setTexture(playerHairViewS))
            helm.run(SKAction.setTexture(myHelm.helmS!))
            leggs.run(SKAction.setTexture(myLeggs.leggingsS!))
        case 4,8:
            avatarPlayer.run(SKAction.setTexture(playerViewE))
            hair.run(SKAction.setTexture(playerHairViewE))
            helm.run(SKAction.setTexture(myHelm.helmE!))
            leggs.run(SKAction.setTexture(myLeggs.leggingsE!))

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
            leggs.run(SKAction.animate(with: myLeggs.deadleggings, timePerFrame: 0.1))
            isAlive = false
        }
        
       
    }
    
   
    func resetpersonaje(){
            avatarPlayer.removeAllActions()
            hair.removeAllActions()
            helm.removeAllActions()
            leggs.removeAllActions()
            weapon.removeAllActions()
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
/******************************************/


