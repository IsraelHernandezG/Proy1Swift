//
//  Drop.swift
//  iRPG
//
//  Created by Israel on 7/27/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

struct Drop{
    var dropNode = SKNode()
    var drop = SKSpriteNode()
    var itemFire: [SKTexture] = []
    //bandera que controla si el usuario esta cerca o lejos del item
    var banderaDrop = 0
    //PlayerCategory
    let playerCategory: UInt32 = 0x01 << 0
    //los objetos con los que puede interactuar el personaje usaran este mecanismo
    var interactionCategory: UInt32 = 0x01 << 28
    
    
    init(position: CGPoint, categoria: UInt32){
        interactionCategory = 0x01 << 28 + categoria
        
        createAnimations()
        
        drop = SKSpriteNode(texture: itemFire[0])
        drop.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(6))
        drop.physicsBody?.categoryBitMask = interactionCategory
        drop.physicsBody?.contactTestBitMask = playerCategory
        drop.physicsBody?.collisionBitMask = 0
        drop.alpha = 0.0
        drop.zPosition = 0.5
        drop.xScale = 4.5
        drop.yScale = 4.5
        drop.position = position
        dropNode.addChild(drop)
    }
    
    mutating func createAnimations(){
        var fireSheet = SpriteSheet(image: UIImage(named: "fuegofatuo")!, rows: 3, columns: 4)
        
        itemFire.append(fireSheet.textureForColumn(column: 0, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 1, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 2, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 3, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 0, row: 1))
        itemFire.append(fireSheet.textureForColumn(column: 1, row: 1))
        itemFire.append(fireSheet.textureForColumn(column: 2, row: 1))
        itemFire.append(fireSheet.textureForColumn(column: 3, row: 1))
    }
    
    func showItem(){
        drop.run(SKAction.repeatForever(SKAction.animate(with: itemFire, timePerFrame: 0.2)))
        drop.run(SKAction.fadeAlpha(by: 1.0, duration: 1.0))
    }
    func takeDrop(){
        let disapear = SKAction.fadeAlpha(by: -1.0, duration: 1.0)
        let eliminate = SKAction.run {
            self.drop.removeFromParent()
        }
        let secuencia = SKAction.sequence([disapear,eliminate])
        drop.run(secuencia)
    }
    
    func getPosition() -> CGPoint{
        return drop.position
    }

    
    
}
