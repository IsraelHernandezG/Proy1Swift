//
//  Armor.swift
//  iRPG
//
//  Created by Israel on 5/21/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class Armor {
    var armorNode = SKSpriteNode()
    
    var armorMoveN: [SKTexture] = []
    var armorMoveS: [SKTexture] = []
    var armorMoveE: [SKTexture] = []
    var armorMoveW: [SKTexture] = []
    var armorAttackN: [SKTexture] = []
    var armorAttackW: [SKTexture] = []
    var armorAttackS: [SKTexture] = []
    var armorAttackE: [SKTexture] = []
    
    let armorAtlas: SKTextureAtlas
    
    
    init(){
        armorAtlas = SKTextureAtlas(named: "Default")
    }
    
    init(nombreAtlas atlas: String, nombreArmor name: String){
        
        armorAtlas = SKTextureAtlas(named: atlas)
        armorNode = SKSpriteNode(texture: armorAtlas.textureNamed("\(name)_S-1")) //textura inicial del arma
        armorNode.zPosition = 1.1
        animateArmor(nombre: name)
        
    }
    
    func animateArmor(nombre: String){
        
        for i in 2...9 {
            let arrayN = "\(nombre)_N-\(i)"
            armorMoveN.append(armorAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_S-\(i)"
            armorMoveS.append(armorAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_E-\(i)"
            armorMoveE.append(armorAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_W-\(i)"
            armorMoveW.append(armorAtlas.textureNamed(arrayW))
        }
        for i in 1...7 {
            let arrayN = "\(nombre)_slash_N-\(i)"
            armorAttackN.append(armorAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_slash_S-\(i)"
            armorAttackS.append(armorAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_slash_A-\(i)"
            armorAttackE.append(armorAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_slash_W-\(i)"
            armorAttackW.append(armorAtlas.textureNamed(arrayW))
        }
    }
}
