//
//  TileMap.swift
//  iRPG
//
//  Created by Israel on 3/11/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class TileMap{
    
    // terrain
    var textureVacio : SKTexture?
    var textureBasePared1 : SKTexture?
    var textureBasePared2 : SKTexture?
    var textureBasePared3 : SKTexture?
    var textureCentroPared1 : SKTexture?
    var textureCentroPared2 : SKTexture?
    var textureCentroPared3 : SKTexture?
    
    var textureBordeSup1 : SKTexture?
    var textureBordeLeft : SKTexture?
    var textureBordeRight : SKTexture?
    var textureBordeInf1 : SKTexture?
    var textureBordeInf2 : SKTexture?
    var textureBordeSup2 : SKTexture?
    var textureEsquinaIn1 : SKTexture?
    var textureEsquinaIn2 : SKTexture?
    var textureEsquinaIn3 : SKTexture?
    var textureEsquinaIn4 : SKTexture?
    var textureEsquinaOut4 : SKTexture?
    var textureEsquinaOut3 : SKTexture?
    var textureEsquinaOut1 : SKTexture?
    var textureEsquinaOut2 : SKTexture?
    
    var textureBordeSupA : SKTexture?
    var textureBordeLeftA : SKTexture?
    var textureBordeRightA : SKTexture?
    var textureBordeInfA : SKTexture?
    var textureEsquinaInA1 : SKTexture?
    var textureEsquinaInA2 : SKTexture?
    var textureEsquinaInA3 : SKTexture?
    var textureEsquinaInA4 : SKTexture?
    var textureEsquinaOutA4 : SKTexture?
    var textureEsquinaOutA3 : SKTexture?
    var textureEsquinaOutA1 : SKTexture?
    var textureEsquinaOutA2 : SKTexture?
    
    var textureEntrada1 : SKTexture?
    var textureEntrada2 : SKTexture?
    var textureEntrada3 : SKTexture?
    var textureEntrada4 : SKTexture?
    var textureEntrada5 : SKTexture?
    var textureEntrada6 : SKTexture?
    //ground
    var textureCentro1 : SKTexture?
    var textureCentro2 : SKTexture?
    var textureCentro3 : SKTexture?
    var textureCentro4 : SKTexture?
    //forest
    var textureArbol1 : SKTexture?
    var textureArbol2 : SKTexture?
    var textureArbol3 : SKTexture?
    var textureArbol4 : SKTexture?
    var textureBosque1 : SKTexture?
    var textureBosque2 : SKTexture?
    var textureBosque3 : SKTexture?
    var textureBosque4 : SKTexture?
    
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let WallCategory: UInt32 = 0x01 << 1
    // Entrance category
    let caveEntrance: UInt32 = 0x01 << 7
    // fire category
    let fireCategory: UInt32 = 0x01 << 5
    //Player Category:
    let playerCategory: UInt32 = 0x01 << 0
    //Weapon Category
    let armsCategory: UInt32 = 0x01 << 6
    
    //bonfire
    var bonfire = SKSpriteNode()
    var bonfireOffAnimation: [SKTexture] = []
    var bonfireOnAnimation: [SKTexture] = []
    var bonfireAnimation: [SKTexture] = []
    
    
    let map = SKNode()  // En este objeto se iran añadiendo los tiles para formar el mapa
    
    //spriteSheets
    var ground : SpriteSheet = SpriteSheet()
    var terrain : SpriteSheet = SpriteSheet()
    var trees : SpriteSheet = SpriteSheet()
    
    
    init(){
        
    }
    
    init(size: Int){
        let tileSize = CGSize(width: 32, height: 32)
        let columns = size// num de elem de un renglon
        let rows = size // num de renglones = num de elementos del arreglo
        let halfWidth = CGFloat(columns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(rows) / 2.0 * tileSize.height
        
        ground = SpriteSheet(image: UIImage(named: "volcano")!, rows: 6, columns: 3)
        loadSprites(tipoMapa: 0)
        
        for row in 0..<rows {
            for col in 0..<columns {
                let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width/2)
                let y = CGFloat((rows-1)-row) * tileSize.height - halfHeight + (tileSize.height/2)
                _ = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                map.addChild(setFloor(CGPoint(x: x, y: y)))
            }
        }
    }
    
    func loadSprites(tipoMapa: Int){
        
        switch tipoMapa {
        case 0:
            textureCentro1 = ground.textureForColumn(column: 1, row: 3)
            textureCentro2 = ground.textureForColumn(column: 0, row: 5)
            textureCentro3 = ground.textureForColumn(column: 1, row: 5)
            textureCentro4 = ground.textureForColumn(column: 2, row: 5)
        case 1: //carga toda la hoja de terreno
            textureVacio = terrain.textureForColumn(column: 1, row: 6)
            
            textureBasePared1 = terrain.textureForColumn(column: 4, row: 4)
            textureBasePared2 = terrain.textureForColumn(column: 5, row: 4)
            textureBasePared3 = terrain.textureForColumn(column: 6, row: 4)
            
            textureCentroPared1 = terrain.textureForColumn(column: 4, row: 3)
            textureCentroPared2 = terrain.textureForColumn(column: 5, row: 3)
            textureCentroPared3 = terrain.textureForColumn(column: 6, row: 3)
            
            textureBordeSup1 = terrain.textureForColumn(column: 1, row: 5)
            textureBordeSup2 = terrain.textureForColumn(column: 2, row: 5)
            textureBordeLeft = terrain.textureForColumn(column: 0, row: 6)
            textureBordeRight = terrain.textureForColumn(column: 3, row: 6)
            textureBordeInf1 = terrain.textureForColumn(column: 1, row: 7)
            textureBordeInf2 = terrain.textureForColumn(column: 2, row: 7)
            
            textureEsquinaIn1 = terrain.textureForColumn(column: 0, row: 5)
            textureEsquinaIn2 = terrain.textureForColumn(column: 3, row: 5)
            textureEsquinaIn3 = terrain.textureForColumn(column: 0, row: 7)
            textureEsquinaIn4 = terrain.textureForColumn(column: 3, row: 7)
            
            textureEsquinaOut1 = terrain.textureForColumn(column: 2, row: 8)
            textureEsquinaOut2 = terrain.textureForColumn(column: 1, row: 8)
            textureEsquinaOut3 = terrain.textureForColumn(column: 1, row: 9)
            textureEsquinaOut4 = terrain.textureForColumn(column: 2, row: 9)
            
            //
            textureBordeSupA = terrain.textureForColumn(column: 5, row: 0)
            textureBordeLeftA = terrain.textureForColumn(column: 4, row: 1)
            textureBordeRightA = terrain.textureForColumn(column: 6, row: 1)
            textureBordeInfA = terrain.textureForColumn(column: 5, row: 2)
            
            textureEsquinaInA1 = terrain.textureForColumn(column: 4, row: 0)
            textureEsquinaInA2 = terrain.textureForColumn(column: 6, row: 0)
            textureEsquinaInA3 = terrain.textureForColumn(column: 4, row: 2)
            textureEsquinaInA4 = terrain.textureForColumn(column: 6, row: 2)
            
            textureEsquinaOutA1 = terrain.textureForColumn(column: 11, row: 9)
            textureEsquinaOutA2 = terrain.textureForColumn(column: 9, row: 9)
            textureEsquinaOutA3 = terrain.textureForColumn(column: 9, row: 11)
            textureEsquinaOutA4 = terrain.textureForColumn(column: 11, row: 11)
            //
            
            textureEntrada1 = terrain.textureForColumn(column: 7, row: 9)
            textureEntrada2 = terrain.textureForColumn(column: 8, row: 9)
            textureEntrada3 = terrain.textureForColumn(column: 7, row: 10)
            textureEntrada4 = terrain.textureForColumn(column: 8, row: 10)
            textureEntrada5 = terrain.textureForColumn(column: 7, row: 11)
            textureEntrada6 = terrain.textureForColumn(column: 8, row: 11)
        case 2:

            textureBosque1 = trees.textureForColumn(column: 2, row: 0)
            textureBosque2 = trees.textureForColumn(column: 3, row: 0)
            textureBosque3 = trees.textureForColumn(column: 2, row: 1)
            textureBosque4 = trees.textureForColumn(column: 3, row: 1)
            
            textureArbol1 = trees.textureForColumn(column: 0, row: 0)
            textureArbol2 = trees.textureForColumn(column: 1, row: 0)
            textureArbol3 = trees.textureForColumn(column: 0, row: 1)
            textureArbol4 = trees.textureForColumn(column: 1, row: 1)
            
        default:
            textureCentro1 = ground.textureForColumn(column: 1, row: 3)
            textureCentro2 = ground.textureForColumn(column: 0, row: 5)
            textureCentro3 = ground.textureForColumn(column: 1, row: 5)
            textureCentro4 = ground.textureForColumn(column: 2, row: 5)
        }
        
    }
    
    func setPhysicsBody(llave: Character, x: CGFloat, y: CGFloat){
        // switch case para las texturas y los phyisics bodies, dependiendo de la letra
        // en linea[col], se tiene un tile o un conjunto apilado de tiles
        switch llave{
        case "w":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 1.0, yScale: 0.8, center: CGPoint(x: 0, y: 0))) //superior wall
        case "l":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 0.3, yScale: 1.0, center: CGPoint(x: -10, y: 0))) //left wall
        case "/":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 0.3, yScale: 1.0, center: CGPoint(x: 10, y: 0))) //right wall
        case "m":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 1.0, yScale: 0.4, center: CGPoint(x: 0, y: -25))) //inferior wall
        case "r":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 1.0, yScale: 0.8, center: CGPoint(x: 0, y: 0)))
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 0.3, yScale: 0.8, center: CGPoint(x: -10, y: 0)))
        case "z":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 1.0, yScale: 0.8, center: CGPoint(x: 0, y: 0)))
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 0.3, yScale: 0.8, center: CGPoint(x: 10, y: 0)))
        case "c":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 1.0, yScale: 0.4, center: CGPoint(x: 0, y: -25)))
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 0.3, yScale: 1.0, center: CGPoint(x: -10, y: 0)))
        case "j":
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 1.0, yScale: 0.4, center: CGPoint(x: 0, y: -25)))
            map.addChild(setPhysicsBody(tipo: 1, posX: x, posY: y, xScale: 0.3, yScale: 1.0, center: CGPoint(x: 10, y: 0)))
        case "0":
            map.addChild(setPhysicsBody(tipo: 2, posX: x, posY: y, xScale: 1.0, yScale: 1.4, center: CGPoint(x: 0, y: 0)))
        case ":":
            map.addChild(setPhysicsBody(tipo: 2, posX: x, posY: y, xScale: 2.5, yScale: 1.4, center: CGPoint(x: 0, y: 0)))
        default:
            break
        }
    }
    
    func selectTile(llave: Character, x: CGFloat, y: CGFloat){
        
        // switch case para las texturas y los phyisics bodies, dependiendo de la letra
        // en linea[col], se tiene un tile o un conjunto apilado de tiles
        switch llave{
        case "x":
            let tileTexture = textureVacio
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y) // cada tile se posiciona en las coordenadas
            //calculadas anteriormente
            tileNode.zPosition = 2  // la posicion en z ayuda a determinar que tiles estan
            // por encima o por debajo de otros
            map.addChild(tileNode) // una vez creado un tile, este se agrega al objeto mapa
        case "r":
            let tileTexture = textureEsquinaOut2
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            map.addChild(tileNode)
        case "R":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureEsquinaIn2
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
            
        case "w":
            // como hay distintas versiones para este tile se utiliza una funcion random
            let num:Int = Int(arc4random_uniform(2))
            let tileTexture: SKTexture
            switch (num){
            case 0:
                tileTexture = textureBordeInf1!
            case 1:
                tileTexture = textureBordeInf2!
                
            default:
                tileTexture = textureBordeInf1!
            }
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            map.addChild(tileNode)
        case "W":
            let tileTexture = textureBordeInfA!
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            map.addChild(tileNode)
        case "z":
            let tileTexture = textureEsquinaOut1
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            map.addChild(tileNode)
        case "Z":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureEsquinaIn1
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "(":
            // A partir de este punto la mayoria de las casillas estan compuestas por
            //dos o mas tiles apilados, con diferentes profundidades en el eje z
            map.addChild(setTile(tileTexture: textureBordeRight!, position: CGPoint(x: x, y: y), zPosition: 2))
            // esta funcion ademas de la poscion del
            // tile en x y y, recibe la posicion en
            // z, ya que el mismo tile sera utilizado
            // en distinas profundidades mas adelante
            map.addChild(setTile(tileTexture: textureCentroPared2!, position: CGPoint(x: x, y: y), zPosition: -1.1))
            
        case "0":
            map.addChild(setTile(tileTexture: textureCentroPared2!, position: CGPoint(x: x, y: y), zPosition: -1.1))
        case ")":
            map.addChild(setTile(tileTexture: textureBordeLeft!, position: CGPoint(x: x, y: y), zPosition: 2))
            map.addChild(setTile(tileTexture: textureCentroPared2!, position: CGPoint(x: x, y: y), zPosition: -1.1))
        case "[":
            map.addChild(setBase(position: CGPoint(x: x, y: y)))
            map.addChild(setTile(tileTexture: textureBordeRight!, position: CGPoint(x: x, y: y), zPosition: 2))
            map.addChild(setFloor(CGPoint(x: x, y: y)))
        case "]":
            map.addChild(setBase(position:  CGPoint(x: x, y: y)))
            map.addChild(setTile(tileTexture: textureBordeLeft!, position: CGPoint(x: x, y: y), zPosition: 2))
            map.addChild(setFloor(CGPoint(x: x, y: y)))
        case "-":
            map.addChild(setBase(position: CGPoint(x: x, y: y)))
            map.addChild(setFloor(CGPoint(x: x, y: y)))
        case "l":
            map.addChild(setTile(tileTexture: textureBordeRight!, position: CGPoint(x: x, y: y), zPosition: 2))
            map.addChild(setFloor(CGPoint(x: x, y: y)))
        case "/":
            map.addChild(setTile(tileTexture: textureBordeLeft!, position: CGPoint(x: x, y: y), zPosition: 2))
            map.addChild(setFloor(CGPoint(x: x, y: y)))
        case "c":
            let tileTexture = textureEsquinaOut3
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
            map.addChild(setTile(tileTexture: textureBordeSup1!, position: CGPoint(x: x, y: y), zPosition: -1.1))
            map.addChild(setTile(tileTexture: textureBordeRight!, position: CGPoint(x: x, y: y), zPosition: -1.2))
            map.addChild(setFloor(CGPoint(x: x, y: y)))
        case "j":
            let tileTexture = textureEsquinaOut4
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
            map.addChild(setTile(tileTexture: textureBordeLeft!, position: CGPoint(x: x, y: y), zPosition: -1.1))
            map.addChild(setTile(tileTexture: textureBordeSup1!, position: CGPoint(x: x, y: y), zPosition: -1.2))
            map.addChild(setFloor(CGPoint(x: x, y: y)))
        case "m":
            
            map.addChild(setTile(tileTexture: textureBordeSup1!, position: CGPoint(x: x, y: y), zPosition: 2))
            
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
        case "q":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureBosque1
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
            
        case "e":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureBosque2
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "a":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureBosque3
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "s":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
            let tileTexture = textureBosque4
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "1":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
            let tileTexture = textureArbol1
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "2":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
            let tileTexture = textureArbol2
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "3":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
            let tileTexture = textureArbol3
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "4":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureArbol4
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "5":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            var tileTexture = textureArbol1
            var tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0.5
            map.addChild(tileNode)
            
            tileTexture = textureCentroPared2
            tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "6":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
            var tileTexture = textureArbol2
            var tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0.5
            map.addChild(tileNode)
            
            tileTexture = textureCentroPared2
            tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "7":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
            let tileTexture = textureArbol2
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 2
            map.addChild(tileNode)
        case "8":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            var tileTexture = textureArbol4
            var tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0.5
            map.addChild(tileNode)
            
            tileTexture = textureBasePared2
            tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "t":
            let tileTexture = textureEntrada1
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "y":
            let tileTexture = textureEntrada2
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "g":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureEntrada3
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "h":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureEntrada4
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "b":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureEntrada5
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "n":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureEntrada6
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "I":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureBordeRightA
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "i":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureEsquinaInA4
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
        case "u":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureCentroPared3
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
            let tileTexture2 = textureArbol1
            let tileNode2 = SKSpriteNode(texture: tileTexture2)
            tileNode2.position = CGPoint(x: x, y: y)
            tileNode2.zPosition = 2
            map.addChild(tileNode2)
        case "k":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureBasePared3
            let tileNode = SKSpriteNode(texture: tileTexture)
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = 0
            map.addChild(tileNode)
            let tileTexture2 = textureArbol3
            let tileNode2 = SKSpriteNode(texture: tileTexture2)
            tileNode2.position = CGPoint(x: x, y: y)
            tileNode2.zPosition = 2
            map.addChild(tileNode2)
        case ":":
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            let tileTexture = textureVacio
            let tileNode = SKSpriteNode(texture: tileTexture)
            /*tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width*2.5, height: tileTexture!.size().height))
            tileNode.physicsBody!.isDynamic = false
            tileNode.physicsBody!.categoryBitMask = caveEntrance
            tileNode.physicsBody!.contactTestBitMask = playerCategory
            tileNode.physicsBody!.collisionBitMask = 0*/
            tileNode.position = CGPoint(x: x, y: y)
            tileNode.zPosition = -2
            map.addChild(tileNode)
        default:
            
            map.addChild(setFloor(CGPoint(x: x, y: y)))
            
        }
        
    }
    
    //El Constructor recibe una cadena que representa el mapa, una cadena que representa los physicsbody del mapa
    //y el nombre de la hoja de sprites del terreno a utilizar
    init(bitmap: String, physicBitmap: String ,spritesheet: String){
        ground = SpriteSheet(image: UIImage(named: spritesheet)!, rows: 6, columns: 3)
        loadSprites(tipoMapa: 0)
        terrain = SpriteSheet(image: UIImage(named: "\(spritesheet)_terrain")!, rows: 12, columns: 12)
        loadSprites(tipoMapa: 1)
        trees = SpriteSheet(image: UIImage(named: "trees")!, rows:4,  columns:4)
        loadSprites(tipoMapa: 2)
        
        //La cadena se descompone en renglones y el mapas se guarda como una arreglo de cadenas
        let mapTiles = bitmap.split(separator: "\n")
        let bodies = physicBitmap.split(separator: "\n")
        
        let tileSize = CGSize(width: terrain.getSpriteWidth(), height: terrain.getSpriteHeight()) //Los tiles tienen tamaño fijo de 32x32
        //Se obtienen las dimensiones del mapa a partir del arreglo que contiene las cadenas
        let columns = mapTiles[0].count  // num de elem de un renglon
        let rows = mapTiles.count    // num de renglones = num de elementos del arreglo
        
        let halfWidth = CGFloat(columns) / 2.0 * tileSize.width //Valor del centro del mapa en x en pixeles
        let halfHeight = CGFloat(rows) / 2.0 * tileSize.height  //Valor del centro del mapa en y en pixeles
        
        //ciclos for anidados para recorrer la matriz del mapa
        // el ciclo externo recorre las lineas
        for row in 0..<rows {
            // se guarda en una cadena la linea actual, para posteriormente recorrerla
            let linea = Array(mapTiles[row])
            let lineaInf = Array(bodies[row])
            //print(arreglo[row]) // esto es solo para ver como se va leyendo el archivo
            
            // el ciclo interno recorre las columnas
            for col in 0..<columns {
                
                //se obtiene la posicion en x y y en pixeles del tile
                let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width/2)
                let y = CGFloat((rows-1)-row) * tileSize.height - halfHeight + (tileSize.height/2)
                _ = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                //es importante recordar que los tiles se posicionan a partir de su centro.
                
                // switch case para las texturas y los phyisics bodies, dependiendo de la letra
                // en linea[col], se tiene un tile o un conjunto apilado de tiles
                selectTile(llave: linea[col], x: x, y: y)
                setPhysicsBody(llave: lineaInf[col], x: x, y: y)
                
            }
        }
        
    }
    
    //El Constructor recibe una cadena que representa el mapa y el nombre de la hoja de sprites del terreno a utilizar
    init(bitmap: String, spritesheet: String){
        
        ground = SpriteSheet(image: UIImage(named: spritesheet)!, rows: 6, columns: 3)
        loadSprites(tipoMapa: 0)
        terrain = SpriteSheet(image: UIImage(named: "\(spritesheet)_terrain")!, rows: 12, columns: 12)
        loadSprites(tipoMapa: 1)
        trees = SpriteSheet(image: UIImage(named: "trees")!, rows:4,  columns:4)
        loadSprites(tipoMapa: 2)
        
        
        //La cadena se descompone en renglones y mapasse guarda como una arreglo de cadenas
        let arreglo = bitmap.split(separator: "\n")
        let tileSize = CGSize(width: 32, height: 32) //Los tiles tienen tamaño fijo de 32x32
        //Se obtienen las dimensiones del mapa a partir del arreglo que contiene las cadenas
        let columns = arreglo[0].count  // num de elem de un renglon
        let rows = arreglo.count    // num de renglones = num de elementos del arreglo
        let halfWidth = CGFloat(columns) / 2.0 * tileSize.width //Valor del centro del mapa en x en pixeles
        let halfHeight = CGFloat(rows) / 2.0 * tileSize.height  //Valor del centro del mapa en y en pixeles
        
        //createFireAnimations()
        //animateFire()
    
        //ciclos for anidados para recorrer la matriz del mapa
        // el ciclo externo recorre las lineas
        for row in 0..<rows {
            // se guarda en una cadena la linea actual, para posteriormente recorrerla
            let linea = Array(arreglo[row])
            //print(arreglo[row]) // esto es solo para ver como se va leyendo el archivo
            
            // el ciclo interno recorre las columnas
            for col in 0..<columns {
                
                //se obtiene la posicion en x y y en pixeles del tile
                let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width/2)
                let y = CGFloat((rows-1)-row) * tileSize.height - halfHeight + (tileSize.height/2)
                _ = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                //es importante recordar que los tiles se posicionan a partir de su centro.
                
                // switch case para las texturas y los phyisics bodies, dependiendo de la letra
                // en linea[col], se tiene un tile o un conjunto apilado de tiles
                selectTile(llave: linea[col], x: x, y: y)
            }
        }
        
    }
    
    func setFloor(_ position: CGPoint) -> SKSpriteNode{
        
        let num:Int = Int(arc4random_uniform(10))
        let tileTexture: SKTexture
        
        switch (num){
        case 0...2:
            tileTexture = textureCentro1!
        case 3...5:
            tileTexture = textureCentro4!
        case 6...8:
            tileTexture = textureCentro3!
        case 9:
            tileTexture = textureCentro2!
            
        default:
            tileTexture = textureCentro1!
            
        }
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.position = position
        tileNode.zPosition = -1
        
        return tileNode
        
    }
    
    func setPhysicsBody(tipo: Int, posX: CGFloat, posY: CGFloat, xScale: CGFloat, yScale: CGFloat, center: CGPoint) -> SKSpriteNode{
        let tileTexture = textureVacio!
        let tileNode = SKSpriteNode(texture: tileTexture)
        switch tipo {
        case 1:
            tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture.size().width*xScale, height: tileTexture.size().height*yScale), center: center)
            tileNode.physicsBody!.categoryBitMask = WallCategory
        case 2:
            tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture.size().width*xScale, height: tileTexture.size().height*yScale), center: center)
            tileNode.physicsBody!.categoryBitMask = caveEntrance
        default:
            tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture.size().width*xScale, height: tileTexture.size().height*yScale), center: center)
            tileNode.physicsBody!.categoryBitMask = WallCategory
        }
        
        tileNode.physicsBody!.isDynamic = false // se crea un volumen estatico, no es afectado por colisiones pero su puede afectar a otros
                                                // cuerpos
        tileNode.physicsBody!.collisionBitMask = playerCategory
        tileNode.position = CGPoint(x: posX, y: posY)
        tileNode.zPosition = -2
        return tileNode
    }
    
    func setBase(position: CGPoint) -> SKSpriteNode{
        let tileTexture = textureBasePared2
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.position = position
        tileNode.zPosition = 0
        
        return tileNode
    }
    
    
    func createFireAnimations() {
        let bonfireAnimation = SKTextureAtlas(named: "bonfire")
        for i in 1...3 {
            let bonfireOff = "bonfireOff-\(i)"
            bonfireOffAnimation.append(bonfireAnimation.textureNamed(bonfireOff))
            let bonfireOn = "bonfireOn-\(i)"
            bonfireOnAnimation.append(bonfireAnimation.textureNamed(bonfireOn))
        }
    }
    
    func setTile(tileTexture: SKTexture, position: CGPoint, zPosition: CGFloat) -> SKSpriteNode{
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.position = position
        tileNode.zPosition = zPosition
        return tileNode
        
    }
    
    func animateFire() {
        bonfire = SKSpriteNode(imageNamed: "bonfireOff-1")
        bonfire.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(40))
        bonfire.physicsBody?.categoryBitMask = fireCategory
        bonfire.physicsBody?.contactTestBitMask = playerCategory
        bonfire.physicsBody?.collisionBitMask = 0
        bonfire.run(SKAction.repeatForever(SKAction.animate(with: bonfireOffAnimation, timePerFrame: 0.1)))
        bonfire.xScale = 0.3
        bonfire.yScale = 0.3
        bonfire.position = CGPoint(x: 0.0, y: 0.0)
        bonfire.zPosition = 0.5
        map.addChild(bonfire)
    }
    
    
}
