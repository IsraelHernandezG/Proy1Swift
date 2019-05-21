//
//  Weapon.swift
//  iRPG
//
//  Created by Israel on 5/21/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class Weapon {
    var weaponNode = SKSpriteNode()
    
    var weaponMoveN: [SKTexture] = []
    var weaponMoveS: [SKTexture] = []
    var weaponMoveE: [SKTexture] = []
    var weaponMoveW: [SKTexture] = []
    var weaponAttackN: [SKTexture] = []
    var weaponAttackW: [SKTexture] = []
    var weaponAttackS: [SKTexture] = []
    var weaponAttackE: [SKTexture] = []
    
    let weaponAtlas: SKTextureAtlas
    
    init(){
        weaponAtlas = SKTextureAtlas(named: "Default")
    }
    
    init(nombreAtlas atlas: String, nombreWeapon name: String){
        
        weaponAtlas = SKTextureAtlas(named: atlas)
        weaponNode = SKSpriteNode(texture: weaponAtlas.textureNamed("\(name)_S-1")) //textura inicial del arma
   
        weaponNode.zPosition = 1.1
        
        animateWeapon(nombre: name)
        
    }
    
    func animateWeapon(nombre: String){
        
        //por ahora sword no tiene animaciones de caminata
        /*for i in 2...9 {
            let arrayN = "\(nombre)_N-\(i)"
            weaponMoveN.append(weaponAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_S-\(i)"
            weaponMoveS.append(weaponAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_E-\(i)"
            weaponMoveE.append(weaponAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_W-\(i)"
            weaponMoveW.append(weaponAtlas.textureNamed(arrayW))
        }*/
        for i in 1...7 {
            let arrayN = "\(nombre)_N-\(i)"
            weaponAttackN.append(weaponAtlas.textureNamed(arrayN))
            let arrayS = "\(nombre)_S-\(i)"
            weaponAttackS.append(weaponAtlas.textureNamed(arrayS))
            let arrayE = "\(nombre)_E-\(i)"
            weaponAttackE.append(weaponAtlas.textureNamed(arrayE))
            let arrayW = "\(nombre)_W-\(i)"
            weaponAttackW.append(weaponAtlas.textureNamed(arrayW))
        }
    }
}
