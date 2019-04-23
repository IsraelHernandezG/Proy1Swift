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
    let helmFrames = SKTextureAtlas(named: "Helmet")
    let leggsFrames = SKTextureAtlas(named: "Leggs")
    
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
    var deadPlayerLeggs: [SKTexture] = []
    
    var orientacionPersonaje: Int = 3
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
    var Jugador = SKNode()
    var avatarPlayer = SKSpriteNode()
    var weapon = SKSpriteNode()
    var myWeapon = Weapon()
    var hair = SKSpriteNode()
    var helm = SKSpriteNode()
    var leggs = SKSpriteNode()
    var myHelm = Armor()
    var myLeggs = ArmorLeggs()
    
    //Movimiento personaje
    var velocidadXp = 5.0
    var velocidadXm = 5.0
    var velocidadYp = 5.0
    var velocidadYm = 5.0
    
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
    
    var vida = 100.1
    
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
        myWeapon = Weapon(nombre: "short_sword")
        weapon = myWeapon.weapon
        myHelm = Armor(nombre: "bronce_helm")
        helm = myHelm.helm
        myLeggs = ArmorLeggs(nombre: "Roman_Leggs")
        leggs = myLeggs.leggs
        
        
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
            let deadLeggs = "Leggings_dead-\(i)"
            deadPlayerLeggs.append(leggsFrames.textureNamed(deadLeggs))
        }
        
        
    }
    
    func animateMove() {
        switch orientacionPersonaje {
        case 1:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
        case 2:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")
            
        case 3:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")

        case 4:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
            helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")

        default:
            break
        }

    }
    
    func atack(){
        switch orientacionPersonaje {
        case 1:
            avatarPlayer.run(SKAction.animate(with: playerSlashN, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashN, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: hairSlashN, timePerFrame: 0.1))
            helm.run(SKAction.animate(with: myHelm.helmAttackN, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggsAttackN, timePerFrame: 0.1))
        case 2:
            avatarPlayer.run(SKAction.animate(with: playerSlashW, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashW, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: hairSlashW, timePerFrame: 0.1))
             helm.run(SKAction.animate(with: myHelm.helmAttackW, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggsAttackW, timePerFrame: 0.1))
        case 3:
            avatarPlayer.run(SKAction.animate(with: playerSlashS, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashS, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: hairSlashS, timePerFrame: 0.1))
             helm.run(SKAction.animate(with: myHelm.helmAttackS, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggsAttackS, timePerFrame: 0.1))
        case 4:
            avatarPlayer.run(SKAction.animate(with: playerSlashE, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashE, timePerFrame: 0.1))
            hair.run(SKAction.animate(with: hairSlashE, timePerFrame: 0.1))
            helm.run(SKAction.animate(with: myHelm.helmAttackE, timePerFrame: 0.1))
            leggs.run(SKAction.animate(with: myLeggs.leggsAttackE, timePerFrame: 0.1))
        default:
            break
        }
        orientarPersonaje()
    }
    
    
    func orientarPersonaje() {
        //resetpersonaje()
        
        switch orientacionPersonaje {
        case 1:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_N-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_N-1")))
            helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_N_1")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_N-1")))
        case 2:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_W-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_W-1")))
            helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_W_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_W-1")))
        case 3:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_S-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_S-1")))
            helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_S_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_S-1")))
        case 4:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_E-1")))
            hair.run(SKAction.setTexture(hairFrames.textureNamed("male_hair_E-1")))
            helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_E_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_E-1")))

        default:
            
            break
        }
        
    }
    
    func muertePersonaje(){
        avatarPlayer.run(SKAction.animate(with: deadPlayer, timePerFrame: 0.1))
        hair.run(SKAction.animate(with: deadPlayerHair, timePerFrame: 0.1))
        leggs.run(SKAction.animate(with: deadPlayerLeggs, timePerFrame: 0.1))
    }
    
   
    func resetpersonaje(){
        avatarPlayer.removeAllActions()
        hair.removeAllActions()
        helm.removeAllActions()
        leggs.removeAllActions()

    }
    
}
/******************************************/


open class Weapon {
    var weapon = SKSpriteNode()
    var orientacionEspada: Int = 0
    
    var swordSlashN: [SKTexture] = []
    var swordSlashS: [SKTexture] = []
    var swordSlashE: [SKTexture] = []
    var swordSlashW: [SKTexture] = []
    
    // Texturas espada
    let textureSwordW = SKTexture(image: UIImage(named: "sword_W-5")!)
    let textureWeaponMask = SKTexture(image: UIImage(named: "sword_W-5")!)
    //let textureSwordMask = SKTexture(image: UIImage(named: "IdleSwordN")!)
    
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
    //ArmsCategory
    let armsCategory: UInt32 = 0x01 << 5
    //enemy category
    let enemyCategory: UInt32 = 0x01 << 6
    
    init(){
        weapon = SKSpriteNode(texture: textureSwordW) //textura inicial del jugador
        // se añade un physicsbody al jugador para detectar colisiones
        weapon.physicsBody = SKPhysicsBody(texture: textureWeaponMask, size: weapon.size)
        weapon.physicsBody!.categoryBitMask = armsCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        weapon.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | enemyCategory
        weapon.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        weapon.physicsBody!.isDynamic=true
        weapon.zPosition = 1
    }

    init(nombre: String){
        
        let weaponAtack = SKTextureAtlas(named: "short_sword")
        
        weapon = SKSpriteNode(texture: weaponAtack.textureNamed("sword_N-1")) //textura inicial del arma
        /*
         // se añade un physicsbody al jugador para detectar colisiones
         sword.physicsBody = SKPhysicsBody(texture: textureSwordMask, size: sword.size)
         
         sword.physicsBody!.categoryBitMask = armsCategory // categoria del arma
         // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
         sword.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category
         sword.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
         // estas configuraciones tambien son necesarias
         sword.physicsBody!.isDynamic=true
         
         */
        weapon.zPosition = 1.1
       
        animateWeapon()
    
        
    }
    

    func animateWeapon(){
        let weaponAtack = SKTextureAtlas(named: "short_sword")
        
        for i in 1...6 {
            let playerTextureName1 = "sword_N-\(i)"
            swordSlashN.append(weaponAtack.textureNamed(playerTextureName1))
            let playerTextureName2 = "sword_S-\(i)"
            swordSlashS.append(weaponAtack.textureNamed(playerTextureName2))
            let playerTextureName3 = "sword_E-\(i)"
            swordSlashE.append(weaponAtack.textureNamed(playerTextureName3))
            let playerTextureName4 = "sword_W-\(i)"
            swordSlashW.append(weaponAtack.textureNamed(playerTextureName4))
        }
        swordSlashN.append(weaponAtack.textureNamed("sword_N-1"))
        swordSlashS.append(weaponAtack.textureNamed("sword_N-1"))
        swordSlashE.append(weaponAtack.textureNamed("sword_N-1"))
        swordSlashW.append(weaponAtack.textureNamed("sword_N-1"))
        
        
    }
    
    
    
   
}
/******************************************/


open class Armor {
    var helm = SKSpriteNode()
    var orientacionCasco: Int = 0
    
    var helmMoveN: [SKTexture] = []
    var helmMoveS: [SKTexture] = []
    var helmMoveE: [SKTexture] = []
    var helmMoveW: [SKTexture] = []
    var helmAttackN: [SKTexture] = []
    var helmAttackW: [SKTexture] = []
    var helmAttackS: [SKTexture] = []
    var helmAttackE: [SKTexture] = []
  
    
    let helmMoves = SKTextureAtlas(named: "Helmet")
   
    
    init(){
        
    }
    
    init(nombre: String){
        
        let helmMove = SKTextureAtlas(named: "Helmet")
        
        helm = SKSpriteNode(texture: helmMove.textureNamed("Helm_S_I")) //textura inicial del arma
        /*
         // se añade un physicsbody al jugador para detectar colisiones
         sword.physicsBody = SKPhysicsBody(texture: textureSwordMask, size: sword.size)
         
         sword.physicsBody!.categoryBitMask = armsCategory // categoria del arma
         // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
         sword.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category
         sword.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
         // estas configuraciones tambien son necesarias
         sword.physicsBody!.isDynamic=true
         
         */
        helm.zPosition = 1.2
        
        animateHelm()
        
        
    }
    
    
    func animateHelm(){
        
        
        for i in 1...8 {
            let playerTextureName1 = "Helm_N_\(i)"
            helmMoveN.append(helmMoves.textureNamed(playerTextureName1))
            let playerTextureName2 = "Helm_S_\(i)"
            helmMoveS.append(helmMoves.textureNamed(playerTextureName2))
            let playerTextureName3 = "Helm_E_\(i)"
            helmMoveE.append(helmMoves.textureNamed(playerTextureName3))
            let playerTextureName4 = "Helm_W_\(i)"
            helmMoveW.append(helmMoves.textureNamed(playerTextureName4))
        }
        helmMoveN.append(helmMoves.textureNamed("Helm_N_1"))
        helmMoveS.append(helmMoves.textureNamed("Helm_S_1"))
        helmMoveE.append(helmMoves.textureNamed("Helm_E_1"))
        helmMoveW.append(helmMoves.textureNamed("Helm_W_1"))
        for i in 1...6 {
            let playerTextureName1 = "Helm_AN_\(i)"
            helmAttackN.append(helmMoves.textureNamed(playerTextureName1))
            let playerTextureName2 = "Helm_AS_\(i)"
            helmAttackS.append(helmMoves.textureNamed(playerTextureName2))
            let playerTextureName3 = "Helm_AE_\(i)"
            helmAttackE.append(helmMoves.textureNamed(playerTextureName3))
            let playerTextureName4 = "Helm_AW_\(i)"
            helmAttackW.append(helmMoves.textureNamed(playerTextureName4))
        }
        
        helmAttackN.append(helmMoves.textureNamed("Helm_AN_1"))
        helmAttackS.append(helmMoves.textureNamed("Helm_AS_1"))
        helmAttackE.append(helmMoves.textureNamed("Helm_AE_1"))
        helmAttackW.append(helmMoves.textureNamed("Helm_AW_1"))
        
    }
    
    
}

open class ArmorLeggs {
    var leggs = SKSpriteNode()
    
    var leggsMoveN: [SKTexture] = []
    var leggsMoveS: [SKTexture] = []
    var leggsMoveE: [SKTexture] = []
    var leggsMoveW: [SKTexture] = []
    var leggsAttackN: [SKTexture] = []
    var leggsAttackW: [SKTexture] = []
    var leggsAttackS: [SKTexture] = []
    var leggsAttackE: [SKTexture] = []
    
    
    let leggsMoves = SKTextureAtlas(named: "Leggs")
    
    
    init(){
        
    }
    
    init(nombre: String){
        
        leggs = SKSpriteNode(texture: leggsMoves.textureNamed("Leggings_S-1")) //textura inicial del arma
        /*
         // se añade un physicsbody al jugador para detectar colisiones
         sword.physicsBody = SKPhysicsBody(texture: textureSwordMask, size: sword.size)
         
         sword.physicsBody!.categoryBitMask = armsCategory // categoria del arma
         // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
         sword.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category
         sword.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
         // estas configuraciones tambien son necesarias
         sword.physicsBody!.isDynamic=true
         
         */
        leggs.zPosition = 1.1
        
        animateLeggs()
        
        
    }
    
    
    func animateLeggs(){
        
        for i in 2...9 {
            let leggsTextureName1 = "Leggings_N-\(i)"
            leggsMoveN.append(leggsMoves.textureNamed(leggsTextureName1))
            let leggsTextureName2 = "Leggings_S-\(i)"
            leggsMoveS.append(leggsMoves.textureNamed(leggsTextureName2))
            let leggsTextureName3 = "Leggings_E-\(i)"
            leggsMoveE.append(leggsMoves.textureNamed(leggsTextureName3))
            let leggsTextureName4 = "Leggings_W-\(i)"
            leggsMoveW.append(leggsMoves.textureNamed(leggsTextureName4))
        }
        for i in 1...7 {
            let leggsTextureName1 = "Leggings_slash_N-\(i)"
            leggsAttackN.append(leggsMoves.textureNamed(leggsTextureName1))
            let leggsTextureName2 = "Leggings_slash_S-\(i)"
            leggsAttackS.append(leggsMoves.textureNamed(leggsTextureName2))
            let leggsTextureName3 = "Leggings_slash_E-\(i)"
            leggsAttackE.append(leggsMoves.textureNamed(leggsTextureName3))
            let leggsTextureName4 = "Leggings_slash_W-\(i)"
            leggsAttackW.append(leggsMoves.textureNamed(leggsTextureName4))
        }
        
        
    }
    
    
}
