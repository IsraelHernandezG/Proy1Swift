//
//  Leggings.swift
//  iRPG
//
//  Created by Israel on 5/21/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class Leggings {
    var leggingsNode = SKSpriteNode()
    
    var leggingsMoveN: [SKTexture] = []
    var leggingsMoveS: [SKTexture] = []
    var leggingsMoveE: [SKTexture] = []
    var leggingsMoveW: [SKTexture] = []
    var leggingsAttackN: [SKTexture] = []
    var leggingsAttackW: [SKTexture] = []
    var leggingsAttackS: [SKTexture] = []
    var leggingsAttackE: [SKTexture] = []
    var deadleggings: [SKTexture] = []
    var leggingsN: SKTexture?
    var leggingsS: SKTexture?
    var leggingsE: SKTexture?
    var leggingsW: SKTexture? 
    
    let leggingsAtlas: SKTextureAtlas
    
    
    init(){
        leggingsAtlas = SKTextureAtlas(named: "Default")
    }
    
    init(nombreAtlas atlas: String, nombreHelm name: String){
        
        leggingsAtlas = SKTextureAtlas(named: atlas)
        leggingsNode = SKSpriteNode(texture: leggingsAtlas.textureNamed("\(name)_S-1")) //textura inicial del arma
        leggingsNode.zPosition = 1.1
        
        animateLeggings(nombre: name)
        
    }
    
    func animateLeggings(nombre: String){
        
        leggingsN = leggingsAtlas.textureNamed("\(nombre)_N-1")
        leggingsS = leggingsAtlas.textureNamed("\(nombre)_S-1")
        leggingsE = leggingsAtlas.textureNamed("\(nombre)_E-1")
        leggingsW = leggingsAtlas.textureNamed("\(nombre)_W-1")
        
        for i in 2...9 {
            let arrayN = "\(nombre)_N-\(i)"
            leggingsMoveN.append(leggingsAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_S-\(i)"
            leggingsMoveS.append(leggingsAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_E-\(i)"
            leggingsMoveE.append(leggingsAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_W-\(i)"
            leggingsMoveW.append(leggingsAtlas.textureNamed(arrayW))
        }
        for i in 1...7 {
            let arrayN = "\(nombre)_slash_N-\(i)"
            leggingsAttackN.append(leggingsAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_slash_S-\(i)"
            leggingsAttackS.append(leggingsAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_slash_E-\(i)"
            leggingsAttackE.append(leggingsAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_slash_W-\(i)"
            leggingsAttackW.append(leggingsAtlas.textureNamed(arrayW))
        }
        for i in 1...6 {
            let arrayDead = "\(nombre)_dead-\(i)"
            deadleggings.append(leggingsAtlas.textureNamed(arrayDead))
        }
        
    }
}
