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
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
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
            
    
    //El Constructor recibe una cadena
    init(bitmap: String, spritesheet: String, mapa: Int){
        
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
                switch linea[col]{
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
                    map.addChild(tileNode)
                case "(":
                    // A partir de este punto la mayoria de las casillas estan compuestas por
                    //dos o mas tiles apilados, con diferentes profundidades en el eje z
                    map.addChild(setLeftWall(CGPoint(x: x, y: y),2)) // esta funcion ademas de la poscion del
                                                                     // tile en x y y, recibe la posicion en
                                                                     // z, ya que el mismo tile sera utilizado
                                                                     // en distinas profundidades mas adelante
                    map.addChild(setWall(CGPoint(x: x, y: y)))      // esta funcion solo recibe la posicion en
                                                                    // x y y, ya que aunque se usa en distintas
                                                                    // ocasiones, no varia nunca su posicion en z
                case "0":
                    map.addChild(setWall(CGPoint(x: x, y: y)))
                case ")":
                    map.addChild(setRightWall(CGPoint(x: x, y: y),2))
                    map.addChild(setWall(CGPoint(x: x, y: y)))
                case "[":
                    map.addChild(setBase(CGPoint(x: x, y: y)))
                    map.addChild(setLeftWall(CGPoint(x: x, y: y),2))
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "]":
                    map.addChild(setBase(CGPoint(x: x, y: y)))
                    map.addChild(setRightWall(CGPoint(x: x, y: y),2))
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "-":
                    map.addChild(setBase(CGPoint(x: x, y: y)))
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "l":
                    map.addChild(setLeftWall(CGPoint(x: x, y: y),2))
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "/":
                    map.addChild(setRightWall(CGPoint(x: x, y: y),2))
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "c":
                    let tileTexture = textureEsquinaOut3
                    let tileNode = SKSpriteNode(texture: tileTexture)
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.zPosition = 2
                    map.addChild(tileNode)
                    map.addChild(setWallInf(CGPoint(x: x, y: y),-1.1))
                    map.addChild(setLeftWall(CGPoint(x: x, y: y),-1.2))
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "j":
                    let tileTexture = textureEsquinaOut4
                    let tileNode = SKSpriteNode(texture: tileTexture)
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.zPosition = 2
                    map.addChild(tileNode)
                    
                    map.addChild(setRightWall(CGPoint(x: x, y: y),-1.1))
                    map.addChild(setWallInf(CGPoint(x: x, y: y),-1.2))
                    
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "m":
                    
                    map.addChild(setWallInf(CGPoint(x: x, y: y),2))
                    
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
                    tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width, height: tileTexture!.size().height*1.4))
                    tileNode.physicsBody!.isDynamic = false
                    tileNode.physicsBody!.categoryBitMask = caveEntrance
                    tileNode.physicsBody!.contactTestBitMask = playerCategory
                    tileNode.physicsBody!.collisionBitMask = 0
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.zPosition = 0
                    map.addChild(tileNode)
                case "y":
                    let tileTexture = textureEntrada2
                    let tileNode = SKSpriteNode(texture: tileTexture)
                    tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width, height: tileTexture!.size().height*1.4))
                    tileNode.physicsBody!.isDynamic = false
                    tileNode.physicsBody!.categoryBitMask = caveEntrance
                    tileNode.physicsBody!.contactTestBitMask = playerCategory
                    tileNode.physicsBody!.collisionBitMask = 0
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
                    tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width*2.5, height: tileTexture!.size().height))
                    tileNode.physicsBody!.isDynamic = false
                    tileNode.physicsBody!.categoryBitMask = caveEntrance
                    tileNode.physicsBody!.contactTestBitMask = playerCategory
                    tileNode.physicsBody!.collisionBitMask = 0
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.zPosition = -2
                    map.addChild(tileNode)
                default:
                    
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                    
                }
                
                
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
        tileNode.position = CGPoint(x: position.x, y: position.y)
        tileNode.zPosition = -1
        
        return tileNode
        
    }
    
    func setLeftWall(_ position: CGPoint, _ prof: CGFloat) -> SKSpriteNode{
        
        let tileTexture = textureBordeRight
        let tileNode = SKSpriteNode(texture: tileTexture)
        // Se añande un physicsbody al tile
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width*0.3, height: tileTexture!.size().height), center: CGPoint(x: -10, y: 0))
        tileNode.physicsBody!.isDynamic = false // es necesario que sea falso esta propiedad
        // dependiendo del categorybitmask se crearan diferentes efectos de colisiones
        tileNode.physicsBody!.categoryBitMask = Wall2Category
        tileNode.physicsBody!.contactTestBitMask = playerCategory   // esta propiedad indica los objetos
                                                                    // con los que colisionara este tile
        tileNode.physicsBody!.collisionBitMask = 0                  // esta propiedad debe ser 0
        tileNode.position = CGPoint(x: position.x, y: position.y)
        tileNode.zPosition = prof
        return tileNode
    }
    
    func setRightWall(_ position: CGPoint, _ prof: CGFloat) -> SKSpriteNode{
        
        let tileTexture = textureBordeLeft
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width*0.3, height: tileTexture!.size().height), center: CGPoint(x: 10, y: 0))
        tileNode.physicsBody!.isDynamic = false
        tileNode.physicsBody!.categoryBitMask = Wall3Category
        tileNode.physicsBody!.contactTestBitMask = playerCategory
        tileNode.physicsBody!.collisionBitMask = 0
        tileNode.position = CGPoint(x: position.x, y: position.y)
        tileNode.zPosition = prof
        return tileNode
    }
    
    func setWall(_ position: CGPoint) -> SKSpriteNode{
        
        let tileTexture = textureCentroPared2
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width, height: tileTexture!.size().height*0.8))
        tileNode.physicsBody!.isDynamic = false
        tileNode.physicsBody!.categoryBitMask = Wall1Category
        tileNode.physicsBody!.contactTestBitMask = playerCategory
        tileNode.physicsBody!.collisionBitMask = 0
        tileNode.position = CGPoint(x: position.x, y: position.y)
        tileNode.zPosition = 0
        return tileNode
        
    }
    
    
    func setBase(_ position: CGPoint) -> SKSpriteNode{
        let tileTexture = textureBasePared2
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.position = CGPoint(x: position.x, y: position.y)
        tileNode.zPosition = 0
        
        return tileNode
    }
    
    func setWallInf(_ position: CGPoint, _ prof: CGFloat) -> SKSpriteNode{
        let tileTexture = textureBordeSup1
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture!.size().width, height: tileTexture!.size().height*0.4), center: CGPoint(x: 0, y: -25))
        tileNode.physicsBody!.isDynamic = false
        tileNode.physicsBody!.categoryBitMask = Wall4Category
        tileNode.physicsBody!.contactTestBitMask = playerCategory
        tileNode.physicsBody!.collisionBitMask = 0
        tileNode.position = CGPoint(x: position.x, y: position.y)
        tileNode.zPosition = prof
        
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
        bonfire.zPosition = 1
        map.addChild(bonfire)
    }
    
    
}
