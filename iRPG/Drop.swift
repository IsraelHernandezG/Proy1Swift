//
//  Drop.swift
//  iRPG
//
//  Created by Israel on 7/27/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

class Drop{
    var dropNode = SKNode()
    var drop = SKSpriteNode()
    var itemFire: [SKTexture] = []
    //PlayerCategory
    let playerCategory: UInt32 = 0x01 << 0
    //los objetos con los que puede interactuar el personaje usaran este mecanismo
    let interactionCategory: UInt32 = 0x01 << 28
    
    
    init(position: CGPoint){
        createAnimations()
        
        drop = SKSpriteNode(texture: itemFire[0])
        drop.alpha = 0.0
        drop.zPosition = 1.0
        drop.xScale = 4.5
        drop.yScale = 4.5
        drop.position = position
        dropNode.addChild(drop)
    }
    
    func createAnimations(){
        let fireSheet = SpriteSheet(image: UIImage(named: "fuegofatuo")!, rows: 3, columns: 4)
        
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
        //resizePB(tipo: 0)
        
    }
    func resizePB(tipo: Int){
        switch tipo {
        case 0:
            drop.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(15))
            drop.physicsBody?.categoryBitMask = interactionCategory
            drop.physicsBody?.contactTestBitMask = playerCategory
            drop.physicsBody?.collisionBitMask = 0
        case 1:
            drop.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(40))
            drop.physicsBody?.categoryBitMask = interactionCategory
            drop.physicsBody?.contactTestBitMask = playerCategory
            drop.physicsBody?.collisionBitMask = 0
        default:
            break
        }
        
    }
    
    
}
