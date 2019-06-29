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
    
    var itemFire: [SKTexture] = []
   
    //Velocidad enemigo
    var velocidad: CGFloat = 2.0

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
    let WallCategory: UInt32 = 0x01 << 31
    // Cave Entrance
    let caveEntrance: UInt32 = 0x01 << 30
    //ArmsCategory
    //ArmsCategory
    let playerArmCategory: UInt32 = 0x01 << 1
    let enemyArmCategory: UInt32 = 0x01 << 29
    //
    let fireCategory: UInt32 = 0x01 << 28
    //EnemyCategory
    var enemyCategory: UInt32 = 0x01 << 8
    
    var enemyxPosition: CGFloat = 0.0
    var enemyyPosition: CGFloat = 0.0
    
    var orientaCaminata = 3
    
    init(position: CGPoint, tipo: String, clase: String, categoria: UInt32){
        
        enemyCategory = 0x01 << 8 + categoria //esto permite tener hasta 256 enemigos en el mismo mapa
        
        createAnimations(tipo: tipo, clase : clase)
        
        avatarEnemy = SKSpriteNode(texture: enemyViewS) //textura inicial del enemigo
        // se añade un physicsbody al jugador para detectar colisiones
        avatarEnemy.physicsBody = SKPhysicsBody(texture: enemyViewS, size: avatarEnemy.size)
        avatarEnemy.physicsBody!.categoryBitMask = enemyCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarEnemy.physicsBody!.contactTestBitMask = playerCategory
        avatarEnemy.physicsBody!.collisionBitMask = WallCategory
        // estas configuraciones tambien son necesarias
        avatarEnemy.physicsBody!.isDynamic=true
        avatarEnemy.zPosition = 0.9
        
        //barra de vida del enemigo, solo debe aparacer cuando es golpeado
        let fillBarSheet = SpriteSheet(image: UIImage(named: "fill_bars_GUI")!, rows: 4, columns: 4)
        
        let enemyHP = SKSpriteNode(texture: fillBarSheet.textureForColumn(column: 1, row: 1))
        enemyHP.name = "enemyHP"
        enemyHP.yScale = 0.2
        enemyHP.xScale = 4.0
        enemyHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        enemyHP.position = CGPoint(x: avatarEnemy.position.x-enemyHP.size.width/2, y: avatarEnemy.position.y + 21)
        enemyHP.zPosition = avatarEnemy.zPosition
        
        Enemigo.addChild(enemyHP)
        
        //Equipo del jugador
        equipEnemy.append(Equip(tipo: "weapon", nombre: "short_sword"))
    
        equipEnemy[0].equipNode.zPosition = avatarEnemy.zPosition + 0.6 //weapon
        
        if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                Enemigo.addChild(equipEnemy[i-1].equipNode)
            }
        }
        
        //item del enemigo
        let drop = SKSpriteNode(texture: itemFire[0])
        drop.name = "drop"
        drop.alpha = 0.0
        drop.zPosition = 1.0
        drop.xScale = 1.5
        drop.yScale = 1.5
        Enemigo.addChild(drop)
        
        //Juntando elementos del enemigo
        Enemigo.addChild(avatarEnemy)
 
        Enemigo.position = position
        Enemigo.setScale(escala)
        
    }
    
    func dropItem(){
        Enemigo.childNode(withName: "drop")!.run(SKAction.repeatForever(SKAction.animate(with: itemFire, timePerFrame: 0.2)))
        Enemigo.childNode(withName: "drop")!.run(SKAction.fadeAlpha(by: 1.0, duration: 1.0))

    }
    
    func setWeaponPhysicsBody(){
        
         let temp = SKPhysicsBody(texture: equipEnemy[equipEnemy.count-1].equipNode.texture!, size: equipEnemy[equipEnemy.count-1].equipNode.size)
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody = temp
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.categoryBitMask = enemyArmCategory // categoria del jugador
            // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.contactTestBitMask = WallCategory | playerCategory
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.collisionBitMask = 0 // esta opcion debe estar en 0
            // estas configuraciones tambien son necesarias
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.isDynamic=true
       
    }
    
    
    init(){
    }
    
    func createAnimations(tipo: String, clase: String) {
        
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
        
        let fireSheet = SpriteSheet(image: UIImage(named: "fuegofatuo")!, rows: 3, columns: 4)
        
        itemFire.append(fireSheet.textureForColumn(column: 0, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 1, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 2, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 3, row: 0))
        itemFire.append(fireSheet.textureForColumn(column: 0, row: 1))
        itemFire.append(fireSheet.textureForColumn(column: 1, row: 1))
        itemFire.append(fireSheet.textureForColumn(column: 2, row: 1))
        itemFire.append(fireSheet.textureForColumn(column: 3, row: 1))
        
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
            if (distancia >= 100.0 && distancia < 1200.0) {
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
            Enemigo.run(SKAction.moveBy(x: CGFloat(1)*velocidad, y: CGFloat(0), duration: 0.1))
        case 2: //W
            Enemigo.run(SKAction.moveBy(x: CGFloat(-1)*velocidad, y: CGFloat(0), duration: 0.1))
        case 3: //S
            Enemigo.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(-1)*velocidad, duration: 0.1))
        case 4: //E
            Enemigo.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(1)*velocidad, duration: 0.1))

        default:
            break
        }
    }
    
    func damage(){
        // normalizando la vida del jugador al rango de [0,1]
        let lifeEnemy = CGFloat(vida*1.0/vidaMax)
        if(lifeEnemy >= 0.0){
            //Redimencionando la barra de vida de acuerdo a la vida del jugador
            Enemigo.childNode(withName: "enemyHP")?.run(SKAction.resize(toWidth: 10.0 * lifeEnemy, duration: 0.1))
        }
        
    }
    
}
