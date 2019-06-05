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
    
    // Map Tiles
    var textureVacio : SKTexture?
    var textureBase1 : SKTexture?
    var textureBase2 : SKTexture?
    var textureBase3 : SKTexture?
    var textureBorde1 : SKTexture?
    var textureBorde2 : SKTexture?
    var textureBorde3 : SKTexture?
    var textureBorde4 : SKTexture?
    var textureBorde5 : SKTexture?
    var textureBorde9 : SKTexture?
    var textureEsquina : SKTexture?
    var textureEsquina2 : SKTexture?
    var textureEsquina3 : SKTexture?
    var textureEsquina4 : SKTexture?
    var textureEsquina5 : SKTexture?
    var textureEsquina6 : SKTexture?
    var textureEsquina7 : SKTexture?
    var textureEsquina8 : SKTexture?
    var texturePared1 : SKTexture?
    var texturePared2 : SKTexture?
    var texturePared3 : SKTexture?
    var textureCentro1 : SKTexture?
    var textureCentro2 : SKTexture?
    var textureCentro3 : SKTexture?
    var textureCentro4 : SKTexture?
    
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
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
    
    
    init(){
    }
    
    init(_ size: Int){
        let tileSize = CGSize(width: 32, height: 32)
        let columns = size// num de elem de un renglon
        let rows = size // num de renglones = num de elementos del arreglo
        let halfWidth = CGFloat(columns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(rows) / 2.0 * tileSize.height
        
        for row in 0..<rows {
            for col in 0..<columns {
                let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width/2)
                let y = CGFloat((rows-1)-row) * tileSize.height - halfHeight + (tileSize.height/2)
                _ = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                map.addChild(setFloor(CGPoint(x: x, y: y)))
            }
        }
    }
            
    
    //El Constructor recibe una cadena
    init(_ bitmap: String, _ spritesheet: String){
        let sheet=SpriteSheet(image: UIImage(named: spritesheet)!, rows: 6, columns: 11)
        
        textureVacio = sheet.textureForColumn(column: 1, row: 1)
        textureBase1 = sheet.textureForColumn(column: 0, row: 4)
        textureBase2 = sheet.textureForColumn(column: 1, row: 4)
        textureBase3 = sheet.textureForColumn(column: 2, row: 4)
        textureBorde1 = sheet.textureForColumn(column: 1, row: 0)
        textureBorde2 = sheet.textureForColumn(column: 0, row: 1)
        textureBorde3 = sheet.textureForColumn(column: 2, row: 1)
        textureBorde4 = sheet.textureForColumn(column: 1, row: 2)
        textureBorde5 = sheet.textureForColumn(column: 4, row: 4)
        textureBorde9 = sheet.textureForColumn(column: 3, row: 4)
        textureEsquina = sheet.textureForColumn(column: 0, row: 0)
        textureEsquina2 = sheet.textureForColumn(column: 2, row: 0)
        textureEsquina3 = sheet.textureForColumn(column: 0, row: 2)
        textureEsquina4 = sheet.textureForColumn(column: 2, row: 2)
        textureEsquina5 = sheet.textureForColumn(column: 3, row: 0)
        textureEsquina6 = sheet.textureForColumn(column: 4, row: 0)
        textureEsquina7 = sheet.textureForColumn(column: 3, row: 1)
        textureEsquina8 = sheet.textureForColumn(column: 4, row: 1)
        texturePared1 = sheet.textureForColumn(column: 0, row: 3)
        texturePared2 = sheet.textureForColumn(column: 1, row: 3)
        texturePared3 = sheet.textureForColumn(column: 2, row: 3)
        textureCentro1 = sheet.textureForColumn(column: 9, row: 3)
        textureCentro2 = sheet.textureForColumn(column: 8, row: 5)
        textureCentro3 = sheet.textureForColumn(column: 9, row: 5)
        textureCentro4 = sheet.textureForColumn(column: 10, row: 5)
        
        //La cadena se descompone en renglones y mapasse guarda como una arreglo de cadenas
        let arreglo = bitmap.split(separator: "\n")
        let tileSize = CGSize(width: 32, height: 32) //Los tiles tienen tamaño fijo de 32x32
        //Se obtienen las dimensiones del mapa a partir del arreglo que contiene las cadenas
        let columns = arreglo[0].count  // num de elem de un renglon
        let rows = arreglo.count    // num de renglones = num de elementos del arreglo
        let halfWidth = CGFloat(columns) / 2.0 * tileSize.width //Valor del centro del mapa en x en pixeles
        let halfHeight = CGFloat(rows) / 2.0 * tileSize.height  //Valor del centro del mapa en y en pixeles
        
        createFireAnimations()
        animateFire()
        
        //ciclos for anidados para recorrer la matriz del mapa
        // el ciclo externo recorre las lineas
        for row in 0..<rows {
            // se guarda en una cadena la linea actual, para posteriormente recorrerla
            let linea = Array(arreglo[row])
            print(arreglo[row]) // esto es solo para ver como se va leyendo el archivo
            
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
                    let tileTexture = textureEsquina8
                    let tileNode = SKSpriteNode(texture: tileTexture)
                    tileNode.position = CGPoint(x: x, y: y)
                    map.addChild(tileNode)
                case "w":
                    // como hay distintas versiones para este tile se utiliza una funcion random
                    let num:Int = Int(arc4random_uniform(2))
                    let tileTexture: SKTexture
                    switch (num){
                    case 0:
                        tileTexture = textureBorde4!
                    case 1:
                        tileTexture = textureBorde5!
                        
                    default:
                        tileTexture = textureBorde4!
                    }
                    let tileNode = SKSpriteNode(texture: tileTexture)
                    tileNode.position = CGPoint(x: x, y: y)
                    map.addChild(tileNode)
                case "z":
                    let tileTexture = textureEsquina7
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
                    let tileTexture = textureEsquina6
                    let tileNode = SKSpriteNode(texture: tileTexture)
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.zPosition = 2
                    map.addChild(tileNode)
                    map.addChild(setWallInf(CGPoint(x: x, y: y),-1.1))
                    map.addChild(setLeftWall(CGPoint(x: x, y: y),-1.2))
                    map.addChild(setFloor(CGPoint(x: x, y: y)))
                case "j":
                    let tileTexture = textureEsquina5
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
        
        let tileTexture = textureBorde3
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
        
        let tileTexture = textureBorde2
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
        
        let tileTexture = texturePared2
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
        let tileTexture = textureBase2
        let tileNode = SKSpriteNode(texture: tileTexture)
        tileNode.position = CGPoint(x: position.x, y: position.y)
        tileNode.zPosition = 0
        
        return tileNode
    }
    
    func setWallInf(_ position: CGPoint, _ prof: CGFloat) -> SKSpriteNode{
        let tileTexture = textureBorde1
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
        bonfire.position = CGPoint(x: 80, y: 40)
        bonfire.zPosition = 1
        map.addChild(bonfire)
    }
    
    
}
