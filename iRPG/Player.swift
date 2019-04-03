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
    let texturePlayerN = SKTexture(image: UIImage(named: "nakedN")!)
    
    //let texturePlayerNE = SKTexture(image: UIImage(named: "01-vistaNE")!)
    let texturePlayerE = SKTexture(image: UIImage(named: "nakedE")!)
   
    //let texturePlayerSE = SKTexture(image: UIImage(named: "03-vistaSE")!)
    let texturePlayerS = SKTexture(image: UIImage(named: "nakedS")!)
   
    //let texturePlayerSW = SKTexture(image: UIImage(named: "05-vistaSW")!)
    let texturePlayerW = SKTexture(image: UIImage(named: "nakedW")!)
    
    //let texturePlayerNW = SKTexture(image: UIImage(named: "07-vistaNW")!)
    let texturePlayerMask = SKTexture(image: UIImage(named: "nakedN")!)
    
    var playerWalkingFramesN: [SKTexture] = []
    var playerWalkingFramesS: [SKTexture] = []
    var playerWalkingFramesE: [SKTexture] = []
    var playerWalkingFramesW: [SKTexture] = []
    
   
    
    var orientacionPersonaje: Int = 0
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
    var playerNode = SKSpriteNode()
    
     // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
    //PlayerCategory
    let playerCategory: UInt32 = 0x01 << 0
    
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
        
        walkPlayer()

    }
    
    
    init(){
    }
    
    func walkPlayer() {
        let playerWalk = SKTextureAtlas(named: "anima")
        
        for i in 1...8 {
            let playerTextureName1 = "nakedN\(i)"
            playerWalkingFramesN.append(playerWalk.textureNamed(playerTextureName1))
            let playerTextureName2 = "nakedS\(i)"
            playerWalkingFramesS.append(playerWalk.textureNamed(playerTextureName2))
            let playerTextureName3 = "nakedE\(i)"
            playerWalkingFramesE.append(playerWalk.textureNamed(playerTextureName3))
            let playerTextureName4 = "nakedW\(i)"
            playerWalkingFramesW.append(playerWalk.textureNamed(playerTextureName4))
        }
    }
    
    
    func animateMove() {
        //resetpersonaje()
        
        switch orientacionPersonaje {
        case 1:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            //playerNode.run(SKAction.animate(with: playerWalkingFramesN, timePerFrame: 0.1))
        case 2:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            //playerNode.run(SKAction.animate(with: playerWalkingFramesW, timePerFrame: 0.1))
        case 3:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            //playerNode.run(SKAction.animate(with: playerWalkingFramesS, timePerFrame: 0.1))
        case 4:
            playerNode.run(SKAction.repeatForever(SKAction.animate(with: playerWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingPlayer")
            //playerNode.run(SKAction.animate(with: playerWalkingFramesE, timePerFrame: 0.1))
        default:
            
            break
        }
        
        
        
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

