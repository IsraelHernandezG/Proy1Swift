//
//  Helm.swift
//  iRPG
//
//  Created by Israel on 5/21/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class Helm {
    var helmNode = SKSpriteNode()
    
    var helmMoveN: [SKTexture] = []
    var helmMoveS: [SKTexture] = []
    var helmMoveE: [SKTexture] = []
    var helmMoveW: [SKTexture] = []
    var helmAttackN: [SKTexture] = []
    var helmAttackW: [SKTexture] = []
    var helmAttackS: [SKTexture] = []
    var helmAttackE: [SKTexture] = []
    
    let helmAtlas: SKTextureAtlas
    
    
    init(){
        helmAtlas = SKTextureAtlas(named: "Default")
    }
    
    init(nombreAtlas atlas: String, nombreHelm name: String){
        
        helmAtlas = SKTextureAtlas(named: atlas)
        helmNode = SKSpriteNode(texture: helmAtlas.textureNamed("\(name)_S-1")) //textura inicial del arma
        helmNode.zPosition = 1.1
        
        animateHelm(nombre: name)
        
    }
    
    func animateHelm(nombre: String){
        
        for i in 2...9 {
            let arrayN = "\(nombre)_N-\(i)"
            helmMoveN.append(helmAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_S-\(i)"
            helmMoveS.append(helmAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_E-\(i)"
            helmMoveE.append(helmAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_W-\(i)"
            helmMoveW.append(helmAtlas.textureNamed(arrayW))
        }
        for i in 1...7 {
            let arrayN = "\(nombre)_slash_N-\(i)"
            helmAttackN.append(helmAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_slash_S-\(i)"
            helmAttackS.append(helmAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_slash_E-\(i)"
            helmAttackE.append(helmAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_slash_W-\(i)"
            helmAttackW.append(helmAtlas.textureNamed(arrayW))
        }
    }
}
