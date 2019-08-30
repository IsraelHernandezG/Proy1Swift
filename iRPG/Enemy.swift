//
//  Enemy.swift
//  iRPG
//
//  Created by Ing Pipin on 4/16/19.
//  Copyright © 2019 Israel. All rights reserved.
//
import Foundation
import SpriteKit

class Enemy {
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
    
    var invocacion: [SKTexture] = []
    var circuloMagico = SKTexture()
    var vacio = SKTexture()
   
    //Velocidad enemigo
    var velocidad: CGFloat = 2.0

    //var orientacionPersonaje: Int = 3
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
    var Enemigo = SKNode()
    var avatarEnemy = SKSpriteNode()
    //animaciones
    var circulo = SKSpriteNode()
    var magia = SKSpriteNode()
    
    //Equipo del enemigo
    var equipEnemy: [Equip] = []
    
    var distanciaMin: CGFloat = 100.0
    
    //vida
    var enemyHP = SKSpriteNode()
    var vida = 200.0
    var vidaMax = 200.0
    var isAlive: Bool  = false
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
    //los objetos con los que puede interactuar el personaje usaran este mecanismo
    let interactionCategory: UInt32 = 0x01 << 28
    let enemyArmCategory: UInt32 = 0x01 << 29
    //
    let fireCategory: UInt32 = 0x01 << 28
    //EnemyCategory
    var enemyCategory: UInt32 = 0x01 << 8
    
    var deltaX: CGFloat = 0.0
    var deltaY: CGFloat = 0.0
    
    var orientaCaminata = 3
    
    var enemyClass = ""
    
    init(position: CGPoint, tipo: String, clase: String, categoria: UInt32){
        
        /*if (enemyClass == "warrior" || enemyClass == "spearman"){
         distanciaMin = 100.0
         }else{
         distanciaMin = 400.0
         }*/
        
        enemyCategory = 0x01 << 8 + categoria //esto permite tener hasta 256 enemigos en el mismo mapa
        
        createAnimations(tipo: tipo, clase : clase)
        
        enemyClass = clase
        
        avatarEnemy = SKSpriteNode(texture: enemyViewS) //textura inicial del enemigo
        // se añade un physicsbody al jugador para detectar colisiones
        avatarEnemy.physicsBody = SKPhysicsBody(texture: enemyViewS, size: avatarEnemy.size)
        avatarEnemy.physicsBody!.categoryBitMask = enemyCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarEnemy.physicsBody!.contactTestBitMask = playerCategory
        avatarEnemy.physicsBody!.collisionBitMask = WallCategory
        // estas configuraciones tambien son necesarias
        avatarEnemy.physicsBody!.isDynamic=true
        avatarEnemy.alpha = 1.0
        avatarEnemy.zPosition = 0.9
        
        //barra de vida del enemigo, solo debe aparacer cuando es golpeado
        var fillBarSheet = SpriteSheet(image: UIImage(named: "fill_bars_GUI")!, rows: 4, columns: 4)
        
        enemyHP = SKSpriteNode(texture: fillBarSheet.textureForColumn(column: 1, row: 1))
        enemyHP.name = "enemyHP"
        enemyHP.yScale = 0.2
        enemyHP.xScale = 4.0
        enemyHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        enemyHP.position = CGPoint(x: avatarEnemy.position.x-enemyHP.size.width/2, y: avatarEnemy.position.y + 21)
        enemyHP.alpha = 0.0
        enemyHP.zPosition = avatarEnemy.zPosition
        
        Enemigo.addChild(enemyHP)
        
        //Equipo del enemigo dependiendo de su clase
        switch clase {
        case "warrior":
            equipEnemy.append(Equip(genero: "male", arma: "sword"))
            equipEnemy[0].equipNode.zPosition = avatarEnemy.zPosition + 0.6 //weapon
        case "archer":
            equipEnemy.append(Equip(genero: "male", arma: "bow"))
            equipEnemy[0].equipNode.zPosition = avatarEnemy.zPosition + 0.6 //weapon
        case "spearman":
            equipEnemy.append(Equip(genero: "male", arma: "spear"))
            equipEnemy[0].equipNode.zPosition = avatarEnemy.zPosition + 0.6 //weapon
        default:
            break
        }
        
        if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                Enemigo.addChild(equipEnemy[i-1].equipNode)
            }
        }
        
        //agregando los nodos de las animaciones
        circulo = SKSpriteNode(texture: circuloMagico)
        circulo.alpha = 0.0
        circulo.xScale = 1.5
        circulo.yScale = 1.5
        circulo.position = CGPoint(x: 0.0, y: -avatarEnemy.size.height*0.4)
        circulo.zPosition = 0.1
        
        magia = SKSpriteNode(texture: vacio)
        magia.zPosition = 0.99
        
        Enemigo.addChild(circulo)
        Enemigo.addChild(magia)
        
        //Juntando elementos del enemigo
        Enemigo.addChild(avatarEnemy)
 
        Enemigo.position = position
        Enemigo.setScale(escala)
        
    }
    
    func invocarEnemigo(){
        let apareceCirculo = SKAction.fadeAlpha(to: 1.0, duration: 1.0)
        let desapareceCirculo = SKAction.fadeAlpha(to: -1.0, duration: 1.0)
        let activateMagia = SKAction.animate(with: invocacion, timePerFrame: 0.1)
        let activate = SKAction.run {
            self.isAlive = true
        }
        let apareceEnemigo = SKAction.run {
            self.avatarEnemy.run(SKAction.fadeAlpha(to: 1.0, duration: 1.0))
            self.magia.run(activateMagia)
        }
        
        let secuencia1 = SKAction.sequence([apareceCirculo,apareceEnemigo,apareceCirculo,desapareceCirculo,activate])
        circulo.run(secuencia1)
        
        
    }
    
    
    func setWeaponPhysicsBody(){
        
        if (enemyClass == "warrior" || enemyClass == "spearman"){
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody = SKPhysicsBody(texture: equipEnemy[equipEnemy.count-1].equipNode.texture!, size: equipEnemy[equipEnemy.count-1].equipNode.size)
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.categoryBitMask = enemyArmCategory // categoria del jugador
            // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.contactTestBitMask = WallCategory | playerCategory
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.collisionBitMask = 0 // esta opcion debe estar en 0
            // estas configuraciones tambien son necesarias
            equipEnemy[equipEnemy.count-1].equipNode.physicsBody?.isDynamic=true
        }
       
    }
    
    
    init(){
    }
    
    func createAnimations(tipo: String, clase: String) {
        
        var sheet=SpriteSheet(image: UIImage(named: "\(tipo)")!, rows: 21, columns: 13)
        
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
        case "spearman":
            for i in 0...7 {
                enemyAtackN.append(sheet.textureForColumn(column: i, row: 4))
                enemyAtackW.append(sheet.textureForColumn(column: i, row: 5))
                enemyAtackS.append(sheet.textureForColumn(column: i, row: 6))
                enemyAtackE.append(sheet.textureForColumn(column: i, row: 7))
            }
            enemyAtackN.append(sheet.textureForColumn(column: 0, row: 4))
            enemyAtackW.append(sheet.textureForColumn(column: 0, row: 5))
            enemyAtackS.append(sheet.textureForColumn(column: 0, row: 6))
            enemyAtackE.append(sheet.textureForColumn(column: 0, row: 7))
        default:
            break
        }
        
        for i in 0...5 {
            deadEnemy.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        var animationsSheet = SpriteSheet(image: UIImage(named: "animaciones")!, rows: 7, columns: 18)
        
        circuloMagico = SKTexture(imageNamed: "magicCircle")
        vacio = SKTexture(imageNamed: "default")
        
        for i in 0...13{
            invocacion.append(animationsSheet.textureForColumn(column: i, row: 0))
        }
        invocacion.append(vacio)
        
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
        let timer = SKAction.fadeAlpha(to: 1.0, duration: 0.6)
       
        switch orientaCaminata {
        case 4:
           avatarEnemy.run(SKAction.sequence([SKAction.animate(with: enemyAtackN, timePerFrame: 0.1),timer]))
           
           if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].equipAttackN, timePerFrame: 0.1))
            }
           }
           
            
        case 2:
            //avatarEnemy.run(SKAction.animate(with: enemyAtackW, timePerFrame: 0.1))
            avatarEnemy.run(SKAction.sequence([SKAction.animate(with: enemyAtackW, timePerFrame: 0.1),timer]))
            
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].equipAttackW, timePerFrame: 0.1))
                }
            }
            
        case 3:
           //avatarEnemy.run(SKAction.animate(with: enemyAtackS, timePerFrame: 0.1))
           avatarEnemy.run(SKAction.sequence([SKAction.animate(with: enemyAtackS, timePerFrame: 0.1),timer]))
           
           if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].equipAttackS, timePerFrame: 0.1))
            }
            }
        case 1:
            //avatarEnemy.run(SKAction.animate(with: enemyAtackE, timePerFrame: 0.1))
            avatarEnemy.run(SKAction.sequence([SKAction.animate(with: enemyAtackE, timePerFrame: 0.1),timer]))
            
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
        case 1: // N
            avatarEnemy.run(SKAction.setTexture(enemyViewN))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.setTexture(equipEnemy[i-1].equipN!))
                }
            }
        case 2: // W
            avatarEnemy.run(SKAction.setTexture(enemyViewW))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.setTexture(equipEnemy[i-1].equipW!))
                }
            }
        case 3: // S
            avatarEnemy.run(SKAction.setTexture(enemyViewS))
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.setTexture(equipEnemy[i-1].equipS!))
                }
            }
        case 4: // E
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
            
            deltaX = selfPosition.x - playerPosition.x
            deltaY = selfPosition.y - playerPosition.y
            
            let distancia = ((playerPosition.x-selfPosition.x)*(playerPosition.x-selfPosition.x)+(playerPosition.y-selfPosition.y)*(playerPosition.y-selfPosition.y)).squareRoot()
            //movimiento del enemigo
            if (velocidad != 0.0){ //Mientras que el enemigo esta en movimiento reproducir las animaciones de caminata
                isAtack = false
                
                if avatarEnemy.hasActions()==false{
                    animateMove()
                }
                //Control de la orientacion del enemigo
                if (deltaY < 0) && (abs(deltaY) > abs(deltaX)) //vista al W
                {
                    if orientaCaminata != 4{ //unicamente cuando hay un cambio de direccion se resetea la animacion
                        orientaCaminata = 4
                        animateMove()
                    }
                    
                }else if (deltaX < 0) && (abs(deltaX) > abs(deltaY)) //vista al N
                {
                    if orientaCaminata != 1{
                        orientaCaminata = 1
                        animateMove()
                    }
                }else if (deltaY > 0) && ( abs(deltaY) > abs(deltaX) ) //vista al E
                {
                    if orientaCaminata != 3{
                        orientaCaminata = 3
                        animateMove()
                    }
                }else if (deltaX > 0) && (abs(deltaX) > abs(deltaY)) // vista al W
                {
                    if orientaCaminata != 2{
                        orientaCaminata = 2
                        animateMove()
                    }
                }
                
            }else{
                if isAtack == true {
                    setWeaponPhysicsBody()
                }
                if (avatarEnemy.hasActions()==false && distancia < distanciaMin){
                    atack()
                }else if (avatarEnemy.hasActions()==false && distancia > distanciaMin){
                    orientarPersonaje()
                }
            }
            
            //Control del movimiento del enemigo
            //dependiendo de la clase del enemigo, cambian los rangos de ataque
           
            if (distancia >= distanciaMin && distancia < 1200.0) {
                velocidad = 1.0
                stop = false
                followPlayer(x: deltaX, y: deltaY) // desplaza al enemigo
            }else{
                velocidad = 0.0
                if(stop == false){
                    stop = true
                    resetpersonaje()
                }
            }
        }
    }
    
    func muerteEnemigo() -> Bool{
        var droping = false
        if isAlive == true {
            isAlive = false
            resetpersonaje()
            
            let muerte = SKAction.animate(with: deadEnemy, timePerFrame: 0.1)
            let desvanece = SKAction.fadeAlpha(by: -1.0, duration: 2.0)
            let remover = SKAction.run {
                //liberar texturas
                //self.avatarEnemy.texture = nil
                self.Enemigo.removeFromParent()
                self.avatarEnemy = SKSpriteNode(texture: self.enemyViewS)
            }
            let secuencia = SKAction.sequence([muerte,desvanece,remover])
    
            
            avatarEnemy.run(secuencia)
            
            if equipEnemy.count >= 1 {
                for i in 1...equipEnemy.count {
                    equipEnemy[i-1].equipNode.run(SKAction.animate(with: equipEnemy[i-1].deadequip, timePerFrame: 0.1))
                }
            }
            
            let proba = Int(arc4random_uniform(7)%4)
            
            if proba == 1 {
                droping = true
            }
        }
        return droping
    }
    
    func resetpersonaje(){
        avatarEnemy.removeAllActions()
        if equipEnemy.count >= 1 {
            for i in 1...equipEnemy.count {
                equipEnemy[i-1].equipNode.removeAllActions()
            }
        }
    }
    func followPlayer(x: CGFloat, y: CGFloat){
        
        let angulo = atan(Double(x/y))
        
        let dx = sin(angulo)
        let dy = cos(angulo)
        
        if y < 0{
            Enemigo.run(SKAction.moveBy(x: CGFloat(dx)*velocidad, y: CGFloat(dy)*velocidad, duration: 0.1))
        }else{
            Enemigo.run(SKAction.moveBy(x: CGFloat(-dx)*velocidad, y: CGFloat(-dy)*velocidad, duration: 0.1))
        }
        
    }
    
    func damage(){
       
        if enemyHP.alpha == 0.0{
            enemyHP.run(SKAction.fadeAlpha(to: 1.0, duration: 0.1))
        }
        
        // normalizando la vida del jugador al rango de [0,1]
        let lifeEnemy = CGFloat(vida*1.0/vidaMax)
        if(lifeEnemy >= 0.0){
            //Redimencionando la barra de vida de acuerdo a la vida del jugador
            Enemigo.childNode(withName: "enemyHP")?.run(SKAction.resize(toWidth: 10.0 * lifeEnemy, duration: 0.1))
        }
        
    }
    
    func getPosition() -> CGPoint{
        return Enemigo.position
    }
    
}
