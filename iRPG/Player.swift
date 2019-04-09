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
    
    
    
    var playerWalkingFramesN: [SKTexture] = []
    var playerWalkingFramesS: [SKTexture] = []
    var playerWalkingFramesE: [SKTexture] = []
    var playerWalkingFramesW: [SKTexture] = []
    
    var playerSlashN: [SKTexture] = []
    var playerSlashS: [SKTexture] = []
    var playerSlashE: [SKTexture] = []
    var playerSlashW: [SKTexture] = []
    
    var swordSlashN: [SKTexture] = []
    var swordSlashS: [SKTexture] = []
    var swordSlashE: [SKTexture] = []
    var swordSlashW: [SKTexture] = []
   
    
    var orientacionPersonaje: Int = 3
    
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
    var Jugador = SKNode()
    var playerNode = SKSpriteNode()
    var weapon = SKSpriteNode()
    
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
        
        playerNode = SKSpriteNode(texture: texturePlayerS) //textura inicial del jugador
        // se añade un physicsbody al jugador para detectar colisiones
        playerNode.physicsBody = SKPhysicsBody(texture: texturePlayerMask, size: playerNode.size)
    
        playerNode.physicsBody!.categoryBitMask = playerCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        playerNode.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category
        playerNode.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        playerNode.physicsBody!.isDynamic=true
        
        playerNode.position = position
        playerNode.zPosition = 1
        playerNode.setScale(escala)
        
        let weaponAtack = SKTextureAtlas(named: "short_sword")
        
        weapon = SKSpriteNode(texture: weaponAtack.textureNamed("sword_S-1"))
        weapon.position = position
        weapon.zPosition = 1.1
        weapon.setScale(escala)
        
        
        createAnimations()
        animateWeapon()
        
        
        

    }
    
    
    init(){
    }
    
    func createAnimations() {
        let playerWalk = SKTextureAtlas(named: "male_walk")
        
        for i in 2...9 {
            let playerTextureName1 = "male_N-\(i)"
            playerWalkingFramesN.append(playerWalk.textureNamed(playerTextureName1))
            let playerTextureName2 = "male_S-\(i)"
            playerWalkingFramesS.append(playerWalk.textureNamed(playerTextureName2))
            let playerTextureName3 = "male_E-\(i)"
            playerWalkingFramesE.append(playerWalk.textureNamed(playerTextureName3))
            let playerTextureName4 = "male_W-\(i)"
            playerWalkingFramesW.append(playerWalk.textureNamed(playerTextureName4))
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
        swordSlashS.append(weaponAtack.textureNamed("sword_S-1"))
        swordSlashE.append(weaponAtack.textureNamed("sword_E-1"))
        swordSlashW.append(weaponAtack.textureNamed("sword_W-1"))
        
        
    }
    
    
    func animateMove() {
        //resetpersonaje()
        
        switch orientacionPersonaje {
        case 1:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            weapon.zPosition = 0.9
            weapon.texture = SKTexture(imageNamed: "sword_N-1")
        case 2:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            weapon.zPosition = 0.9
            weapon.texture = SKTexture(imageNamed: "sword_W-1")
        case 3:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            weapon.zPosition = 1.1
            weapon.texture = SKTexture(imageNamed: "sword_S-1")
        case 4:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            weapon.zPosition = 0.9
            weapon.texture = SKTexture(imageNamed: "sword_E-1")
        default:
            break
        }

    }
    
    func atack(){
        switch orientacionPersonaje {
        case 1:
            playerNode.run(SKAction.animate(with: playerSlashN, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: swordSlashN, timePerFrame: 0.1))
        case 2:
            playerNode.run(SKAction.animate(with: playerSlashW, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: swordSlashW, timePerFrame: 0.1))
        case 3:
            playerNode.run(SKAction.animate(with: playerSlashS, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: swordSlashS, timePerFrame: 0.1))
        case 4:
            playerNode.run(SKAction.animate(with: playerSlashE, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: swordSlashE, timePerFrame: 0.1))
        default:
            break
        }
        orientarPersonaje()
    }
    
    
    func orientarPersonaje() {
        //resetpersonaje()
        
        switch orientacionPersonaje {
        case 1:
            playerNode.run(SKAction.setTexture(texturePlayerN))
        case 2:
            playerNode.run(SKAction.setTexture(texturePlayerW))
        case 3:
            playerNode.run(SKAction.setTexture(texturePlayerS))
        case 4:
            playerNode.run(SKAction.setTexture(texturePlayerE))
        default:
            
            break
        }
        
    }
    
   
    func resetpersonaje(){
        playerNode.removeAllActions()
    }
    
}

/*open class Sword {
    var sword = SKSpriteNode()
    var orientacionEspada: Int = 0
    var swordAttackingFramesN: [SKTexture] = []
    var swordAttackingFramesS: [SKTexture] = []
    var swordAttackingFramesE: [SKTexture] = []
    var swordAttackingFramesW: [SKTexture] = []
    
    // Texturas espada
    let textureSwordN = SKTexture(image: UIImage(named: "IdleSwordN")!)
    
    
    let textureSwordE = SKTexture(image: UIImage(named: "IdleSwordE")!)
    
   
    let textureSwordS = SKTexture(image: UIImage(named: "IdleSwordS")!)
    
    
    let textureSwordW = SKTexture(image: UIImage(named: "IdleSwordW")!)
    
    
    let textureSwordMask = SKTexture(image: UIImage(named: "IdleSwordN")!)
    let escala: CGFloat = 3.0
    
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
    init(){
    }
    init(_ position: CGPoint){
        
        sword = SKSpriteNode(texture: textureSwordS) //textura inicial del arma
        // se añade un physicsbody al jugador para detectar colisiones
        sword.physicsBody = SKPhysicsBody(texture: textureSwordMask, size: sword.size)
        
        sword.physicsBody!.categoryBitMask = armsCategory // categoria del arma
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        sword.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category
        sword.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        sword.physicsBody!.isDynamic=true
        
        sword.position = position
        sword.zPosition = 0.9
        sword.setScale(escala)
        createSwordAnimations()
    
        
    }
    func createSwordAnimations() {
    let attackAnimation = SKTextureAtlas(named: "anima")
    for i in 1...3 {
        let swordTextureName1 = "AttackN\(i)"
        swordAttackingFramesN.append(attackAnimation.textureNamed(swordTextureName1))
        let swordTextureName2 = "AttackS\(i)"
        swordAttackingFramesS.append(attackAnimation.textureNamed(swordTextureName2))
        let swordTextureName3 = "AttackE\(i)"
        swordAttackingFramesE.append(attackAnimation.textureNamed(swordTextureName3))
        let swordTextureName4 = "AttackW\(i)"
        swordAttackingFramesW.append(attackAnimation.textureNamed(swordTextureName4))
    }
}
func createSword() {
    sword = SKSpriteNode(imageNamed: "IdleSwordN")
    sword.physicsBody?.categoryBitMask = 0
    sword.physicsBody?.collisionBitMask = 0
    sword.physicsBody?.contactTestBitMask = 0
    
   
    
    
}
    func orientarEspada() {
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
}
}
*/
