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
    let textureVacio = SKTexture(image: UIImage(named: "vacio")!)
    let textureBase1 = SKTexture(image: UIImage(named: "base1")!)
    let textureBase2 = SKTexture(image: UIImage(named: "base2")!)
    let textureBase3 = SKTexture(image: UIImage(named: "base3")!)
    let textureBorde1 = SKTexture(image: UIImage(named: "borde1")!)
    let textureBorde2 = SKTexture(image: UIImage(named: "borde2")!)
    let textureBorde3 = SKTexture(image: UIImage(named: "borde3")!)
    let textureBorde4 = SKTexture(image: UIImage(named: "borde4")!)
    let textureBorde5 = SKTexture(image: UIImage(named: "borde5")!)
    let textureBorde9 = SKTexture(image: UIImage(named: "borde9")!)
    let textureEsquina1 = SKTexture(image: UIImage(named: "esquina1")!)
    let textureEsquina2 = SKTexture(image: UIImage(named: "esquina2")!)
    let textureEsquina3 = SKTexture(image: UIImage(named: "esquina3")!)
    let textureEsquina4 = SKTexture(image: UIImage(named: "esquina4")!)
    let textureEsquina5 = SKTexture(image: UIImage(named: "esquina5")!)
    let textureEsquina6 = SKTexture(image: UIImage(named: "esquina6")!)
    let textureEsquina7 = SKTexture(image: UIImage(named: "esquina7")!)
    let textureEsquina8 = SKTexture(image: UIImage(named: "esquina8")!)
    let texturePared1 = SKTexture(image: UIImage(named: "pared1")!)
    let texturePared2 = SKTexture(image: UIImage(named: "pared2")!)
    let texturePared3 = SKTexture(image: UIImage(named: "pared3")!)
    let textureCentro1 = SKTexture(image: UIImage(named: "Centro1")!)
    let textureCentro2 = SKTexture(image: UIImage(named: "Centro2")!)
    let textureCentro3 = SKTexture(image: UIImage(named: "Centro3")!)
    let textureCentro4 = SKTexture(image: UIImage(named: "Centro4")!)
    
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
    //Player Category:
    let playerCategory: UInt32 = 0x01 << 0
    
    //bonfire
    var bonfire = SKSpriteNode()
    var bonfireOffAnimation: [SKTexture] = []
    var bonfireOnAnimation: [SKTexture] = []
    var bonfireAnimation: [SKTexture] = []
    
    let map = SKNode()  // En este objeto se iran añadiendo los tiles para formar el mapa
    
    
    init(){
        
    }
    
    
    //El Constructor recibe una cadena
    init(_ bitmap: String){
        //La cadena se descompone en renglones y se guarda como una arreglo de cadenas
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
                        tileTexture = textureBorde4
                    case 1:
                        tileTexture = textureBorde5
                        
                    default:
                        tileTexture = textureBorde4
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
            tileTexture = textureCentro1
        case 3...5:
            tileTexture = textureCentro4
        case 6...8:
            tileTexture = textureCentro3
        case 9:
            tileTexture = textureCentro2
            
        default:
            tileTexture = textureCentro1
            
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
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture.size().width*0.3, height: tileTexture.size().height), center: CGPoint(x: -10, y: 0))
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
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture.size().width*0.3, height: tileTexture.size().height), center: CGPoint(x: 10, y: 0))
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
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture.size().width, height: tileTexture.size().height*0.8))
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
        tileNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tileTexture.size().width, height: tileTexture.size().height*0.4), center: CGPoint(x: 0, y: -25))
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
        bonfire.physicsBody?.categoryBitMask = 0
        bonfire.physicsBody?.collisionBitMask = 0
        bonfire.physicsBody?.contactTestBitMask = 0
        bonfire.run(SKAction.repeatForever(SKAction.animate(with: bonfireOffAnimation, timePerFrame: 0.1)))
        bonfire.xScale = 0.3
        bonfire.yScale = 0.3
        bonfire.position = CGPoint(x: 0, y: 0)
        bonfire.zPosition = 1
        map.addChild(bonfire)
    }
    
    
}
