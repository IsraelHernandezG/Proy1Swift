//
//  Equip.swift
//  iRPG
//
//  Created by Israel on 5/27/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class Equip {
    
    var equipNode = SKSpriteNode()
    
    var equipMoveN: [SKTexture] = []
    var equipMoveS: [SKTexture] = []
    var equipMoveE: [SKTexture] = []
    var equipMoveW: [SKTexture] = []
    var equipAttackN: [SKTexture] = []
    var equipAttackW: [SKTexture] = []
    var equipAttackS: [SKTexture] = []
    var equipAttackE: [SKTexture] = []
    var deadequip: [SKTexture] = []
    var equipN: SKTexture?
    var equipS: SKTexture?
    var equipE: SKTexture?
    var equipW: SKTexture?
    
    //stats equip
    var damagePhysical: Double?
    var defensePhysical: Double?
    var durability: Int?
    var weight: Double?
    
    
    init(){
    }
    
    
    init (genero: String, arma: String){
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_weapons")!, rows: 21, columns: 13)
        
        equipN = sheet.textureForColumn(column: 0, row: 0)
        equipW = sheet.textureForColumn(column: 0, row: 1)
        equipS = sheet.textureForColumn(column: 0, row: 2)
        equipE = sheet.textureForColumn(column: 0, row: 3)
        
        let vacio = sheet.textureForColumn(column: 12, row: 0)
        
        for _ in 1...8 {
            //Body
            equipMoveN.append(vacio)
            equipMoveW.append(vacio)
            equipMoveS.append(vacio)
            equipMoveE.append(vacio)
        }
        
        for _ in 0...5 {
            deadequip.append(vacio)
        }
        
        if arma == "sword"{
            for i in 0...5 {
                equipAttackN.append(sheet.textureForColumn(column: i, row: 12))
                equipAttackW.append(sheet.textureForColumn(column: i, row: 13))
                equipAttackS.append(sheet.textureForColumn(column: i, row: 14))
                equipAttackE.append(sheet.textureForColumn(column: i, row: 15))
            }
        }else if arma == "bow"{
            for i in 0...12 {
                equipAttackN.append(sheet.textureForColumn(column: i, row: 16))
                equipAttackW.append(sheet.textureForColumn(column: i, row: 17))
                equipAttackS.append(sheet.textureForColumn(column: i, row: 18))
                equipAttackE.append(sheet.textureForColumn(column: i, row: 19))
            }
        }else if arma == "spear"{
            for i in 0...7 {
                equipAttackN.append(sheet.textureForColumn(column: i, row: 4))
                equipAttackW.append(sheet.textureForColumn(column: i, row: 5))
                equipAttackS.append(sheet.textureForColumn(column: i, row: 6))
                equipAttackE.append(sheet.textureForColumn(column: i, row: 7))
            }
        }
        
        equipAttackN.append(equipAttackN[0])
        equipAttackW.append(equipAttackW[0])
        equipAttackS.append(equipAttackS[0])
        equipAttackE.append(equipAttackE[0])
        
        equipNode = SKSpriteNode(texture: equipS) //textura inicial del arma
    }
    
    
    init(genero: String, tipo: String, nombre: String){
        
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_\(tipo)_\(nombre)")!, rows: 21, columns: 13)
        
        equipN = sheet.textureForColumn(column: 0, row: 0)
        equipW = sheet.textureForColumn(column: 0, row: 1)
        equipS = sheet.textureForColumn(column: 0, row: 2)
        equipE = sheet.textureForColumn(column: 0, row: 3)
        
        for i in 1...8 {
            //Body
            equipMoveN.append(sheet.textureForColumn(column: i, row: 8))
            equipMoveW.append(sheet.textureForColumn(column: i, row: 9))
            equipMoveS.append(sheet.textureForColumn(column: i, row: 10))
            equipMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            equipAttackN.append(sheet.textureForColumn(column: i, row: 12))
            equipAttackW.append(sheet.textureForColumn(column: i, row: 13))
            equipAttackS.append(sheet.textureForColumn(column: i, row: 14))
            equipAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        equipAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        equipAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        equipAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        equipAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadequip.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        equipNode = SKSpriteNode(texture: equipS) //textura inicial del arma
        
    }
    
    init(genero: String, tipo: String, nombre: String, orientacion: Int){
        
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_\(tipo)_\(nombre)")!, rows: 21, columns: 13)
        
        equipN = sheet.textureForColumn(column: 0, row: 0)
        equipW = sheet.textureForColumn(column: 0, row: 1)
        equipS = sheet.textureForColumn(column: 0, row: 2)
        equipE = sheet.textureForColumn(column: 0, row: 3)
        
        for i in 1...8 {
            //Body
            equipMoveN.append(sheet.textureForColumn(column: i, row: 8))
            equipMoveW.append(sheet.textureForColumn(column: i, row: 9))
            equipMoveS.append(sheet.textureForColumn(column: i, row: 10))
            equipMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            equipAttackN.append(sheet.textureForColumn(column: i, row: 12))
            equipAttackW.append(sheet.textureForColumn(column: i, row: 13))
            equipAttackS.append(sheet.textureForColumn(column: i, row: 14))
            equipAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        equipAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        equipAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        equipAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        equipAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadequip.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        switch orientacion {
        case 1,5:
            equipNode = SKSpriteNode(texture: equipN) //textura inicial del arma
        case 2,6:
            equipNode = SKSpriteNode(texture: equipW)
        case 3,7:
            equipNode = SKSpriteNode(texture: equipS)
        case 4,8:
            equipNode = SKSpriteNode(texture: equipE)
        default:
            equipNode = SKSpriteNode(texture: equipS)
            
        }
       
        
    }
    
    
    init(tipo: String, nombre: String){ //Para los enemigos sin genero
        
       
        //let sheet=SpriteSheet2(texture: Atlas.textureNamed("male_\(tipo)_\(nombre)"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "male_\(tipo)_\(nombre)")!, rows: 21, columns: 13)
        
        equipN = sheet.textureForColumn(column: 0, row: 0)
        equipW = sheet.textureForColumn(column: 0, row: 1)
        equipS = sheet.textureForColumn(column: 0, row: 2)
        equipE = sheet.textureForColumn(column: 0, row: 3)
        
        
        for i in 1...8 {
            //Body
            equipMoveN.append(sheet.textureForColumn(column: i, row: 8))
            equipMoveW.append(sheet.textureForColumn(column: i, row: 9))
            equipMoveS.append(sheet.textureForColumn(column: i, row: 10))
            equipMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            equipAttackN.append(sheet.textureForColumn(column: i, row: 12))
            equipAttackW.append(sheet.textureForColumn(column: i, row: 13))
            equipAttackS.append(sheet.textureForColumn(column: i, row: 14))
            equipAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        equipAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        equipAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        equipAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        equipAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadequip.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        
        equipNode = SKSpriteNode(texture: equipS) //textura inicial del arma
        //equipNode.zPosition = 1.1
    }
    
    init(genero: String, nombre: String, color: String){ //Para el cabello
        
        //let Atlas = SKTextureAtlas(named: nombre)
        //let sheet=SpriteSheet2(texture: Atlas.textureNamed("male_\(tipo)_\(nombre)"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_\(color)")!, rows: 21, columns: 13)
        
        equipN = sheet.textureForColumn(column: 0, row: 0)
        equipW = sheet.textureForColumn(column: 0, row: 1)
        equipS = sheet.textureForColumn(column: 0, row: 2)
        equipE = sheet.textureForColumn(column: 0, row: 3)
        
        
        for i in 1...8 {
            //Body
            equipMoveN.append(sheet.textureForColumn(column: i, row: 8))
            equipMoveW.append(sheet.textureForColumn(column: i, row: 9))
            equipMoveS.append(sheet.textureForColumn(column: i, row: 10))
            equipMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            equipAttackN.append(sheet.textureForColumn(column: i, row: 12))
            equipAttackW.append(sheet.textureForColumn(column: i, row: 13))
            equipAttackS.append(sheet.textureForColumn(column: i, row: 14))
            equipAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        equipAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        equipAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        equipAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        equipAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadequip.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        equipNode = SKSpriteNode(texture: equipS) //textura inicial del arma
        //equipNode.zPosition = 1.1
    }
    
}
