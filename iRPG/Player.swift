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
    let texturePlayerN = SKTexture(image: UIImage(named: "male_N-1")!)
    let texturePlayerE = SKTexture(image: UIImage(named: "male_E-1")!)
    let texturePlayerS = SKTexture(image: UIImage(named: "male_S-1")!)
    let texturePlayerW = SKTexture(image: UIImage(named: "male_W-1")!)
    let texturePlayerMask = SKTexture(image: UIImage(named: "male_N-1")!)
    let playerWalk = SKTextureAtlas(named: "male_walk")
    let playerSlash = SKTextureAtlas(named: "male_slash")
    let hairFrames  = SKTextureAtlas(named: "male_hair")
    
    var playerWalkingFramesN: [SKTexture] = []
    var playerWalkingFramesS: [SKTexture] = []
    var playerWalkingFramesE: [SKTexture] = []
    var playerWalkingFramesW: [SKTexture] = []
    
    var hairWalkingFramesN: [SKTexture] = []
    var hairWalkingFramesS: [SKTexture] = []
    var hairWalkingFramesE: [SKTexture] = []
    var hairWalkingFramesW: [SKTexture] = []
    
    var hairSlashN: [SKTexture] = []
    var hairSlashS: [SKTexture] = []
    var hairSlashE: [SKTexture] = []
    var hairSlashW: [SKTexture] = []
    
    var playerSlashN: [SKTexture] = []
    var playerSlashS: [SKTexture] = []
    var playerSlashE: [SKTexture] = []
    var playerSlashW: [SKTexture] = []
    
    var deadPlayer: [SKTexture] = []
    var deadPlayerHair: [SKTexture] = []
    
    var orientacionPersonaje: Int = 3
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
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
    
    var vida = 200.0
    var vidaMax = 200.0
    var stamina = 50.0
    var staminaMax = 50.0
    
    var isAlive: Bool = true
    var Atack: Bool = false // variable para saber si el jugador esta atacando
   
    
    init(_ position: CGPoint){
        
        avatarPlayer = SKSpriteNode(texture: texturePlayerS) //textura inicial del jugador
        // se añade un physicsbody al jugador para detectar colisiones
        avatarPlayer.physicsBody = SKPhysicsBody(texture: texturePlayerMask, size: avatarPlayer.size)
        avatarPlayer.physicsBody!.categoryBitMask = playerCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarPlayer.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | enemyCategory
        avatarPlayer.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        avatarPlayer.physicsBody!.isDynamic=true
        avatarPlayer.zPosition = 1
        
        //Equipo del jugador
        myWeapon = Weapon(nombreAtlas: "short_sword", nombreWeapon: "sword")
        weapon = myWeapon.weaponNode
        //myHelm = Helm(nombreAtlas: "Helmet", nombreHelm: "Helm")
        //helm = myHelm.helmNode
        myLeggs = Leggings(nombreAtlas: "Leggs", nombreHelm: "Leggings")
        leggs = myLeggs.leggingsNode
        
        
        //Apariencia
        hair =  SKSpriteNode(texture: hairFrames.textureNamed("male_hair_S-1"))
        hair.zPosition = 1.1
        
        
        //Juntando elementos del jugador
        Jugador.addChild(avatarPlayer)
        Jugador.addChild(weapon)
        Jugador.addChild(hair)
        //Jugador.addChild(helm)
        Jugador.addChild(leggs)
        
        Jugador.position = position
        Jugador.setScale(escala)
        
        
        createAnimations()
        

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
    
    func createAnimations() {
        
        
        for i in 2...9 {
            //Body
            let playerTextureName1 = "male_N-\(i)"
            playerWalkingFramesN.append(playerWalk.textureNamed(playerTextureName1))
            let playerTextureName2 = "male_S-\(i)"
            playerWalkingFramesS.append(playerWalk.textureNamed(playerTextureName2))
            let playerTextureName3 = "male_E-\(i)"
            playerWalkingFramesE.append(playerWalk.textureNamed(playerTextureName3))
            let playerTextureName4 = "male_W-\(i)"
            playerWalkingFramesW.append(playerWalk.textureNamed(playerTextureName4))
            //hair
            let hairTextureName1 = "male_hair_N-\(i)"
            hairWalkingFramesN.append(hairFrames.textureNamed(hairTextureName1))
            let hairTextureName2 = "male_hair_S-\(i)"
            hairWalkingFramesS.append(hairFrames.textureNamed(hairTextureName2))
            let hairTextureName3 = "male_hair_E-\(i)"
            hairWalkingFramesE.append(hairFrames.textureNamed(hairTextureName3))
            let hairTextureName4 = "male_hair_W-\(i)"
            hairWalkingFramesW.append(hairFrames.textureNamed(hairTextureName4))
        }
        
        for i in 1...7 {
            //body
            let playerTextureName1 = "slash_male_N-\(i)"
            playerSlashN.append(playerSlash.textureNamed(playerTextureName1))
            let playerTextureName2 = "slash_male_S-\(i)"
            playerSlashS.append(playerSlash.textureNamed(playerTextureName2))
            let playerTextureName3 = "slash_male_E-\(i)"
            playerSlashE.append(playerSlash.textureNamed(playerTextureName3))
            let playerTextureName4 = "slash_male_W-\(i)"
            playerSlashW.append(playerSlash.textureNamed(playerTextureName4))
            //hair
            let hairTextureName1 = "male_hair_slash_N-\(i)"
            hairSlashN.append(hairFrames.textureNamed(hairTextureName1))
            let hairTextureName2 = "male_hair_slash_S-\(i)"
            hairSlashS.append(hairFrames.textureNamed(hairTextureName2))
            let hairTextureName3 = "male_hair_slash_E-\(i)"
            hairSlashE.append(hairFrames.textureNamed(hairTextureName3))
            let hairTextureName4 = "male_hair_slash_W-\(i)"
            hairSlashW.append(hairFrames.textureNamed(hairTextureName4))
        }
        for i in 1...6 {
            let deadBody = "male_dead-\(i)"
            deadPlayer.append(playerWalk.textureNamed(deadBody))
            let deadHair = "male_hair_dead-\(i)"
            deadPlayerHair.append(hairFrames.textureNamed(deadHair))
        }
        
        
    }
    
    func animateMove() {
        switch orientacionPersonaje {
        case 1,5:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            //helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggingsMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            
        case 2,6:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            //helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggingsMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            
        case 3,7:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            //helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggingsMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")

        case 4,8:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
           // helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
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
            hair.run(SKAction.animate(with: hairSlashN, timePerFrame: 0.1))
            //helm.run(SKAction.animate(with: myHelm.helmAttackN, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggingsAttackN, timePerFrame: 0.1))
        case 2,6:
            avatarPlayer.run(SKAction.animate(with: playerSlashW, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackW, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: hairSlashW, timePerFrame: 0.1))
            //helm.run(SKAction.animate(with: myHelm.helmAttackW, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggingsAttackW, timePerFrame: 0.1))
        case 3,7:
            avatarPlayer.run(SKAction.animate(with: playerSlashS, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackS, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: hairSlashS, timePerFrame: 0.1))
            //helm.run(SKAction.animate(with: myHelm.helmAttackS, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggingsAttackS, timePerFrame: 0.1))
        case 4,8:
            avatarPlayer.run(SKAction.animate(with: playerSlashE, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackE, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: hairSlashE, timePerFrame: 0.1))
            //helm.run(SKAction.animate(with: myHelm.helmAttackE, timePerFrame: 0.1))
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
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_N-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_N-1")))
            //helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_N_1")))
            leggs.run(SKAction.setTexture(myLeggs.leggingsMoveN[0]))
        case 2,6:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_W-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_W-1")))
            //helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_W_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggingsMoveW[0]))
        case 3,7:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_S-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_S-1")))
            //helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_S_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggingsMoveS[0]))
        case 4,8:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_E-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_E-1")))
            //helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_E_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggingsMoveE[0]))

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


