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
    let hairWalk  = SKTextureAtlas(named: "male_hair")
    
    var playerWalkingFramesN: [SKTexture] = []
    var playerWalkingFramesS: [SKTexture] = []
    var playerWalkingFramesE: [SKTexture] = []
    var playerWalkingFramesW: [SKTexture] = []
    
    var hairWalkingFramesN: [SKTexture] = []
    var hairWalkingFramesS: [SKTexture] = []
    var hairWalkingFramesE: [SKTexture] = []
    var hairWalkingFramesW: [SKTexture] = []
    
    var playerSlashN: [SKTexture] = []
    var playerSlashS: [SKTexture] = []
    var playerSlashE: [SKTexture] = []
    var playerSlashW: [SKTexture] = []
    
    var orientacionPersonaje: Int = 3
    
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
    var Jugador = SKNode()
    var avatarPlayer = SKSpriteNode()
    var weapon = SKSpriteNode()
    var myWeapon = Weapon()
    var hair = SKSpriteNode()
    
    
    
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
    
    init(_ position: CGPoint){
        
        avatarPlayer = SKSpriteNode(texture: texturePlayerS) //textura inicial del jugador
        // se añade un physicsbody al jugador para detectar colisiones
        avatarPlayer.physicsBody = SKPhysicsBody(texture: texturePlayerMask, size: avatarPlayer.size)
        avatarPlayer.physicsBody!.categoryBitMask = playerCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarPlayer.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category
        avatarPlayer.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        avatarPlayer.physicsBody!.isDynamic=true
        avatarPlayer.zPosition = 1
        
        //Equipo del jugador
        myWeapon = Weapon(nombre: "short_sword")
        weapon = myWeapon.weapon
        
        //Apariencia
        hair =  SKSpriteNode(texture: hairWalk.textureNamed("male_hair_S-1"))
        hair.zPosition = 1.1
        
        
        //Juntando elementos del jugador
        Jugador.addChild(avatarPlayer)
        Jugador.addChild(weapon)
        Jugador.addChild(hair)
        
        Jugador.position = position
        Jugador.setScale(escala)
        
        
        createAnimations()
       
        
        
        

    }
    
    
    init(){
    }
    
    func createAnimations() {
        
        
        for i in 2...9 {
            //Player
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
            hairWalkingFramesN.append(hairWalk.textureNamed(hairTextureName1))
            let hairTextureName2 = "male_hair_S-\(i)"
            hairWalkingFramesS.append(hairWalk.textureNamed(hairTextureName2))
            let hairTextureName3 = "male_hair_E-\(i)"
            hairWalkingFramesE.append(hairWalk.textureNamed(hairTextureName3))
            let hairTextureName4 = "male_hair_W-\(i)"
            hairWalkingFramesW.append(hairWalk.textureNamed(hairTextureName4))
            
        }
        
        let playerSlash = SKTextureAtlas(named: "male_slash")
        for i in 1...6 {
            let playerTextureName1 = "slash_male_N-\(i)"
            playerSlashN.append(playerSlash.textureNamed(playerTextureName1))
            let playerTextureName2 = "slash_male_S-\(i)"
            playerSlashS.append(playerSlash.textureNamed(playerTextureName2))
            let playerTextureName3 = "slash_male_E-\(i)"
            playerSlashE.append(playerSlash.textureNamed(playerTextureName3))
            let playerTextureName4 = "slash_male_W-\(i)"
            playerSlashW.append(playerSlash.textureNamed(playerTextureName4))
        }
        playerSlashN.append(playerWalk.textureNamed("male_N-1"))
        playerSlashS.append(playerWalk.textureNamed("male_S-1"))
        playerSlashE.append(playerWalk.textureNamed("male_E-1"))
        playerSlashW.append(playerWalk.textureNamed("male_W-1"))
        
    }
    
    
    
    
    func animateMove() {
        //resetpersonaje()
        
        switch orientacionPersonaje {
        case 1:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
        case 2:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
        case 3:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
        case 4:
            avatarPlayer.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            hair.run(SKAction.repeatForever(SKAction.animate(with: hairWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"HairPlayer")
        default:
            break
        }

    }
    
    func atack(){
        switch orientacionPersonaje {
        case 1:
            avatarPlayer.run(SKAction.animate(with: playerSlashN, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashN, timePerFrame: 0.1))
        case 2:
            avatarPlayer.run(SKAction.animate(with: playerSlashW, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashW, timePerFrame: 0.1))
        case 3:
            avatarPlayer.run(SKAction.animate(with: playerSlashS, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashS, timePerFrame: 0.1))
        case 4:
            avatarPlayer.run(SKAction.animate(with: playerSlashE, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.swordSlashE, timePerFrame: 0.1))
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
            hair.run(SKAction.setTexture(hairWalk.textureNamed("male_hair_N-1")))
        case 2:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_W-1")))
            hair.run(SKAction.setTexture(hairWalk.textureNamed("male_hair_W-1")))
        case 3:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_S-1")))
            hair.run(SKAction.setTexture(hairWalk.textureNamed("male_hair_S-1")))
        case 4:
            avatarPlayer.run(SKAction.setTexture(playerWalk.textureNamed("male_E-1")))
            hair.run(SKAction.setTexture(hairWalk.textureNamed("male_hair_E-1")))
        default:
            
            break
        }
        
    }
    
   
    func resetpersonaje(){
        avatarPlayer.removeAllActions()
        hair.removeAllActions()
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
    /*let textureSwordN = SKTexture(image: UIImage(named: "IdleSwordN")!)
    let textureSwordE = SKTexture(image: UIImage(named: "IdleSwordE")!)
    let textureSwordS = SKTexture(image: UIImage(named: "IdleSwordS")!)
    let textureSwordW = SKTexture(image: UIImage(named: "IdleSwordW")!)*/
    //let textureSwordMask = SKTexture(image: UIImage(named: "IdleSwordN")!)
    
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
    //ArmsCategory
    let armsCategory: UInt32 = 0x01 << 5
    
    init(){
        
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
    
    
    
    /*func orientarEspada() {

        //resetpersonaje()
        
        switch orientacionEspada {
        case 1:
            sword.run(SKAction.setTexture(textureSwordN))
        case 2:
            sword.run(SKAction.setTexture(textureSwordW))
        case 3:
            sword.run(SKAction.setTexture(textureSwordS))
        case 4:
            sword.run(SKAction.setTexture(textureSwordE))
        default:
            
            break
        }
     }*/
}

