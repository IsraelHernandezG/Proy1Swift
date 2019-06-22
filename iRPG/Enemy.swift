//
//  Enemy.swift
//  iRPG
//
//  Created by Ing Pipin on 4/16/19.
//  Copyright © 2019 Israel. All rights reserved.
//
import Foundation
import SpriteKit

open class Enemy {
    // Texturas enemy
    var enemyViewN: SKTexture = SKTexture()
    var enemyViewS: SKTexture = SKTexture()
    var enemyViewE: SKTexture = SKTexture()
    var enemyViewW: SKTexture = SKTexture()
    
    var enemyWalkingFramesN: [SKTexture] = []
    var enemyWalkingFramesS: [SKTexture] = []
    var enemyWalkingFramesE: [SKTexture] = []
    var enemyWalkingFramesW: [SKTexture] = []
    
    var enemyAtackN: [SKTexture] = []
    var enemyAtackS: [SKTexture] = []
    var enemyAtackE: [SKTexture] = []
    var enemyAtackW: [SKTexture] = []
    
    var deadEnemy: [SKTexture] = []
   
    //Velocidad enemigo
    var velocidadXp: CGFloat = 1.0
    var velocidadXm: CGFloat = 1.0
    var velocidadYp: CGFloat = 1.0
    var velocidadYm: CGFloat = 1.0
    var velocidad: CGFloat = 1.0

    //var orientacionPersonaje: Int = 3
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
    var Enemigo = SKNode()
    var avatarEnemy = SKSpriteNode()
    
    //Equipo del enemigo
    var equipEnemy: [Equip] = []
    
    //vida
    var vida = 200.0
    var vidaMax = 200.0
    var isAlive: Bool  = true
    var isAtack: Bool = false
    var stop: Bool = false
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //PlayerCategory
    let playerCategory: UInt32 = 0x01 << 0
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
    //ArmsCategory
    let armsCategory: UInt32 = 0x01 << 6
    //EnemyCategories >= 6
    var enemyCategory: UInt32 = 0x01 << 8 //default
    
    var enemyxPosition: CGFloat = 0.0
    var enemyyPosition: CGFloat = 0.0
    
    var orientaCaminata = 3
    
    init(position: CGPoint, tipo: String, clase: String, categoria: UInt32){
        
        enemyCategory = 0x01 << 8+categoria
        
        createAnimations(tipo: tipo, clase : clase)
        
        avatarEnemy = SKSpriteNode(texture: enemyViewS) //textura inicial del enemigo
        // se añade un physicsbody al jugador para detectar colisiones
        avatarEnemy.physicsBody = SKPhysicsBody(texture: enemyViewS, size: avatarEnemy.size)
        avatarEnemy.physicsBody!.categoryBitMask = enemyCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarEnemy.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | playerCategory
        avatarEnemy.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        avatarEnemy.physicsBody!.isDynamic=true
        avatarEnemy.zPosition = 0.9
        
        //Equipo del jugador
        equipEnemy.append(Equip(tipo: "weapon", nombre: "short_sword"))
    
        equipEnemy[0].equipNode.zPosition = avatarEnemy.zPosition + 0.6 //weapon
        
        if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                Enemigo.addChild(equipEnemy[i-1].equipNode)
            }
        }
        
        //Juntando elementos del enemigo
        Enemigo.addChild(avatarEnemy)
 
        Enemigo.position = position
        Enemigo.setScale(escala)
        
    }
    
    func setWeaponPhysicsBody(){
        
         let temp = SKPhysicsBody(texture: equipEnemy[equipEnemy.count-1].equipNode.texture!, size: equipEnemy[equipEnemy.count-1].equipNode.size)
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody = temp
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.categoryBitMask = armsCategory // categoria del jugador
            // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | playerCategory
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.collisionBitMask = 0 // esta opcion debe estar en 0
            // estas configuraciones tambien son necesarias
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.isDynamic=true
       
    }
    
    
    init(){
    }
    
    func createAnimations(tipo: String, clase: String) {
        
       // let enemyAtlas = SKTextureAtlas(named: "enemies")
        //let sheet=SpriteSheet2(texture: enemyAtlas.textureNamed("\(tipo)"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "\(tipo)")!, rows: 21, columns: 13)
        
        
        enemyViewN = sheet.textureForColumn(column: 0, row: 0)
        enemyViewW = sheet.textureForColumn(column: 0, row: 1)
        enemyViewS = sheet.textureForColumn(column: 0, row: 2)
        enemyViewE = sheet.textureForColumn(column: 0, row: 3)
        
        
        for i in 1...8 {
            //Body
            enemyWalkingFramesN.append(sheet.textureForColumn(column: i, row: 8))
            enemyWalkingFramesW.append(sheet.textureForColumn(column: i, row: 9))
            enemyWalkingFramesS.append(sheet.textureForColumn(column: i, row: 10))
            enemyWalkingFramesE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        //si la clase del enemigo es warrior se agrega la animacion de corte y el objeto espada
        switch clase {
        case "warrior":
            for i in 0...5 {
                enemyAtackN.append(sheet.textureForColumn(column: i, row: 12))
                enemyAtackW.append(sheet.textureForColumn(column: i, row: 13))
                enemyAtackS.append(sheet.textureForColumn(column: i, row: 14))
                enemyAtackE.append(sheet.textureForColumn(column: i, row: 15))
            }
            enemyAtackN.append(sheet.textureForColumn(column: 0, row: 12))
            enemyAtackW.append(sheet.textureForColumn(column: 0, row: 13))
            enemyAtackS.append(sheet.textureForColumn(column: 0, row: 14))
            enemyAtackE.append(sheet.textureForColumn(column: 0, row: 15))
        case "sorcerer":
            for i in 0...6 {
                enemyAtackN.append(sheet.textureForColumn(column: i, row: 0))
                enemyAtackW.append(sheet.textureForColumn(column: i, row: 1))
                enemyAtackS.append(sheet.textureForColumn(column: i, row: 2))
                enemyAtackE.append(sheet.textureForColumn(column: i, row: 3))
            }
            enemyAtackN.append(sheet.textureForColumn(column: 0, row: 0))
            enemyAtackW.append(sheet.textureForColumn(column: 0, row: 1))
            enemyAtackS.append(sheet.textureForColumn(column: 0, row: 2))
            enemyAtackE.append(sheet.textureForColumn(column: 0, row: 3))
        case "archer":
            for i in 0...12 {
                enemyAtackN.append(sheet.textureForColumn(column: i, row: 16))
                enemyAtackW.append(sheet.textureForColumn(column: i, row: 17))
                enemyAtackS.append(sheet.textureForColumn(column: i, row: 18))
                enemyAtackE.append(sheet.textureForColumn(column: i, row: 19))
            }
            enemyAtackN.append(sheet.textureForColumn(column: 0, row: 16))
            enemyAtackW.append(sheet.textureForColumn(column: 0, row: 17))
            enemyAtackS.append(sheet.textureForColumn(column: 0, row: 18))
            enemyAtackE.append(sheet.textureForColumn(column: 0, row: 19))
            
        default:
            print("clase no contemplada")
        }
        
        for i in 0...5 {
            deadEnemy.append(sheet.textureForColumn(column: i, row: 20))
        }
    }
    
    func animateMove() {
        switch orientaCaminata {
        case 1:
            avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: enemyWalkingFramesE,timePerFrame: 0.1)))
            
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipEnemy[i-1].equipMoveE, timePerFrame: 0.1)))
                }
            }
        case 2:
            avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: enemyWalkingFramesW,timePerFrame: 0.1)))
            
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipEnemy[i-1].equipMoveW, timePerFrame: 0.1)))
                }
            }
            
        case 3:
            avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: enemyWalkingFramesS,timePerFrame: 0.1)))
            
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipEnemy[i-1].equipMoveS, timePerFrame: 0.1)))
                }
            }
            
        case 4:
           avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: enemyWalkingFramesN,timePerFrame: 0.1)))
            
           if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                equipEnemy[i-1].equipNode.run(SKAction.repeatForever(SKAction.animate(with: equipEnemy[i-1].equipMoveN, timePerFrame: 0.1)))
            }
            }
            
        default:
            break
        }
        
    }
    
    func atack(){
        isAtack = true
        switch orientaCaminata {
        case 4:
           avatarEnemy.run(SKAction.animate(with: enemyAtackN, timePerFrame: 0.1))
           
           if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].equipAttackN, timePerFrame: 0.1))
            }
           }
           
            
        case 2:
            avatarEnemy.run(SKAction.animate(with: enemyAtackW, timePerFrame: 0.1))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].equipAttackW, timePerFrame: 0.1))
                }
            }
            
        case 3:
           avatarEnemy.run(SKAction.animate(with: enemyAtackS, timePerFrame: 0.1))
           if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].equipAttackS, timePerFrame: 0.1))
            }
            }
        case 1:
            avatarEnemy.run(SKAction.animate(with: enemyAtackE, timePerFrame: 0.1))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].equipAttackE, timePerFrame: 0.1))
                }
            }
        default:
            break
        }
        //orientarPersonaje()
    }
    
    
    func orientarPersonaje() {
        //resetpersonaje()
        switch orientaCaminata {
        case 1:
            avatarEnemy.run(SKAction.setTexture(enemyViewN))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.setTexture(equipEnemy[i-1].equipN!))
                }
            }
        case 2:
            avatarEnemy.run(SKAction.setTexture(enemyViewW))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.setTexture(equipEnemy[i-1].equipW!))
                }
            }
        case 3:
            avatarEnemy.run(SKAction.setTexture(enemyViewS))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.setTexture(equipEnemy[i-1].equipS!))
                }
            }
        case 4:
            avatarEnemy.run(SKAction.setTexture(enemyViewE))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.setTexture(equipEnemy[i-1].equipE!))
                }
            }
        default:
            
            break
        }
        
    }
    
    func enemyplay(selfPosition: CGPoint, playerPosition: CGPoint){
        if (isAlive==true){
            
            if (velocidad != 0.0){
                isAtack = false
            }
            
            if isAtack == true {
                setWeaponPhysicsBody()
            }
            
            enemyxPosition = selfPosition.x - playerPosition.x
            enemyyPosition = selfPosition.y - playerPosition.y
            
            let distancia = ((playerPosition.x-selfPosition.x)*(playerPosition.x-selfPosition.x)+(playerPosition.y-selfPosition.y)*(playerPosition.y-selfPosition.y)).squareRoot()
            //print(distancia)
            //print("dx: \(enemyMob1.enemyxPosition), dy: \(enemyMob1.enemyyPosition)")
            //print("orinetation: \(enemyMob1.orientaCaminata)")
            
            
            //movimiento del enemigo
            if (velocidad > 0.0 ){ //Mientras que el enemigo esta en movimiento reproducir las animaciones de caminata
                if avatarEnemy.hasActions()==false{
                    animateMove()
                }
                //Control de la orientacion del enemigo
                if (enemyxPosition <= 0) && (enemyyPosition <= 0) //vista al N
                {
                    if orientaCaminata != 4{ //unicamente cuando hay un cambio de direccion se resetea la animacion
                        orientaCaminata = 4
                        animateMove()
                    }
                    
                } else if (enemyxPosition <= 0) && ( enemyyPosition >= 0) //vista al E
                {
                    if orientaCaminata != 1{
                        orientaCaminata = 1
                        animateMove()
                    }
                }else if (enemyxPosition >= 0) && ( enemyyPosition <= 0) //vista al W
                {
                    if orientaCaminata != 2{
                        orientaCaminata = 2
                        animateMove()
                    }
                }else if (enemyxPosition >= 0) && ( enemyyPosition >= 0) // vista al S
                {
                    if orientaCaminata != 3{
                        orientaCaminata = 3
                        animateMove()
                    }
                }
                
            }else if (velocidad == 0.0){
                if (avatarEnemy.hasActions()==false && distancia < 100.0){
                    atack()
                }else if (avatarEnemy.hasActions()==false && distancia > 100.0){
                    orientarPersonaje()
                }
            }
            
            //Control del movimiento del enemigo
            if (distancia >= 100.0 && distancia < 400.0) {
                velocidad = 1.0
                stop = false
                followPlayer() // desplaza al enemigo
            }else{
                velocidad = 0.0
                if(stop == false){
                    stop = true
                    resetpersonaje()
                }
            }
        }
    }
    
    
    
    func muertePersonaje(){
        if isAlive == true {
            resetpersonaje()
            avatarEnemy.run(SKAction.animate(with: deadEnemy, timePerFrame: 0.1))
           
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].deadequip, timePerFrame: 0.1))
                }
            }
            
            isAlive = false
        }
    }
    
    func resetpersonaje(){
        avatarEnemy.removeAllActions()
        if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                equipEnemy[i-1].equipNode.removeAllActions()
            }
        }
        
    }
    func followPlayer(){
    
             
        switch orientaCaminata {
        case 1: //N
            Enemigo.run(SKAction.moveBy(x: CGFloat(1)*velocidad*velocidadXp, y: CGFloat(0), duration: 0.1))
        case 2: //W
            Enemigo.run(SKAction.moveBy(x: CGFloat(-1)*velocidad*velocidadXm, y: CGFloat(0), duration: 0.1))
        case 3: //S
            Enemigo.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(-1)*velocidad*velocidadYm, duration: 0.1))
        case 4: //E
            Enemigo.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(1)*velocidad*velocidadYp, duration: 0.1))

        default:
            break
        }
        
    }
    
}
