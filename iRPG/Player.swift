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
    let texturePlayerN = SKTexture(image: UIImage(named: "00-vistaN")!)
    let texturePlayerNE = SKTexture(image: UIImage(named: "01-vistaNE")!)
    let texturePlayerE = SKTexture(image: UIImage(named: "02-vistaE")!)
    let texturePlayerSE = SKTexture(image: UIImage(named: "03-vistaSE")!)
    let texturePlayerS = SKTexture(image: UIImage(named: "04-vistaS")!)
    let texturePlayerSW = SKTexture(image: UIImage(named: "05-vistaSW")!)
    let texturePlayerW = SKTexture(image: UIImage(named: "06-vistaW")!)
    let texturePlayerNW = SKTexture(image: UIImage(named: "07-vistaNW")!)
    let texturePlayerMask = SKTexture(image: UIImage(named: "Mascara")!)
    
    
    let escala: CGFloat = 6.0
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

    }
    
    init(){
    }
    
}

