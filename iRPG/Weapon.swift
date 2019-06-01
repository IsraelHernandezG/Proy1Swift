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
    var deadweapon: [SKTexture] = []
    var weaponN: SKTexture?
    var weaponS: SKTexture?
    var weaponE: SKTexture?
    var weaponW: SKTexture?
    
    init(){
    }
    
    init(genero: String, tipo: String, nombre: String){
        
        let Atlas = SKTextureAtlas(named: "equip")
        //let sheet=SpriteSheet2(texture: Atlas.textureNamed("\(genero)_weapon_\(nombre)"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_weapon_\(nombre)")!, rows: 21, columns: 13)
        
        weaponN = sheet.textureForColumn(column: 0, row: 0)
        weaponW = sheet.textureForColumn(column: 0, row: 1)
        weaponS = sheet.textureForColumn(column: 0, row: 2)
        weaponE = sheet.textureForColumn(column: 0, row: 3)
    
        for i in 1...8 {
            weaponMoveN.append(sheet.textureForColumn(column: i, row: 8))
            weaponMoveW.append(sheet.textureForColumn(column: i, row: 9))
            weaponMoveS.append(sheet.textureForColumn(column: i, row: 10))
            weaponMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            weaponAttackN.append(sheet.textureForColumn(column: i, row: 12))
            weaponAttackW.append(sheet.textureForColumn(column: i, row: 13))
            weaponAttackS.append(sheet.textureForColumn(column: i, row: 14))
            weaponAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        weaponAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        weaponAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        weaponAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        weaponAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadweapon.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        weaponNode = SKSpriteNode(texture: weaponS) //textura inicial del arma
        //equipNode.zPosition = 1.1
    }
    
    
    init(genero: String, clase: String, nombre: String){
        
        let Atlas = SKTextureAtlas(named: "equip")
        //let sheet=SpriteSheet2(texture: Atlas.textureNamed("\(genero)_weapon_\(nombre)"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_weapon_\(nombre)")!, rows: 21, columns: 13)
        
        weaponN = sheet.textureForColumn(column: 0, row: 0)
        weaponW = sheet.textureForColumn(column: 0, row: 1)
        weaponS = sheet.textureForColumn(column: 0, row: 2)
        weaponE = sheet.textureForColumn(column: 0, row: 3)
        
        
        for i in 1...8 {
            //Body
            weaponMoveN.append(sheet.textureForColumn(column: i, row: 8))
            weaponMoveW.append(sheet.textureForColumn(column: i, row: 9))
            weaponMoveS.append(sheet.textureForColumn(column: i, row: 10))
            weaponMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            weaponAttackN.append(sheet.textureForColumn(column: i, row: 12))
            weaponAttackW.append(sheet.textureForColumn(column: i, row: 13))
            weaponAttackS.append(sheet.textureForColumn(column: i, row: 14))
            weaponAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        weaponAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        weaponAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        weaponAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        weaponAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadweapon.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        weaponNode = SKSpriteNode(texture: weaponS) //textura inicial del arma
        //equipNode.zPosition = 1.1
    }
}
