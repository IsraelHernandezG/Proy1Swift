//
//  GameUI.swift
//  iRPG
//
//  Created by Israel on 3/11/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class GameUI {
    
    //Camera
    //var cam: SKCameraNode?
    // Menu
    var interfaz = SKNode()
    var contextoMenu = SKNode()
    var statusBar = SKNode()  // Las barras de estado estan compuestas por varios sprites, por lo que
                                // se crea un objeto que los contendra a todos
    var ventana1 = SKNode()
    var ventana2 = SKNode()
    var ventana3 = SKNode()
    var ventana4 = SKNode()
    
    // UI Textures
    let textureHud = SKTexture(image: UIImage(named: "Hud")!)
    
    let textureRightHPBar = SKTexture(image: UIImage(named: "HPRightBar")!)
    let textureRightSPBar = SKTexture(image: UIImage(named: "SPRightBar")!)
    let textureRightMPBar = SKTexture(image: UIImage(named: "MPRightBar")!)
    let textureCenterBar = SKTexture(image: UIImage(named: "CenterBar")!)
    
    let textureLeftHP = SKTexture(image: UIImage(named: "leftHP")!)
    let textureRightHP = SKTexture(image: UIImage(named: "rightHP")!)
    let textureCenterHP = SKTexture(image: UIImage(named: "centerHP")!)
    
    let textureLeftSP = SKTexture(image: UIImage(named: "leftSP")!)
    let textureRightSP = SKTexture(image: UIImage(named: "rightSP")!)
    let textureCenterSP = SKTexture(image: UIImage(named: "centerSP")!)
    
    let textureMenuButton = SKTexture(image: UIImage(named: "menuButton")!)
    let textureMenuButtonPressed = SKTexture(image: UIImage(named: "menuButtonPressed")!)
    
    let textureButtonUp = SKTexture(image: UIImage(named: "shadedLightUp")!)
    let textureButtonDown = SKTexture(image: UIImage(named: "shadedLightDown")!)
    let textureButtonLeft = SKTexture(image: UIImage(named: "shadedLightLeft")!)
    let textureButtonRight = SKTexture(image: UIImage(named: "shadedLightRight")!)
    
    let textureButtonUpPres = SKTexture(image: UIImage(named: "shadedLightUpPressed")!)
    let textureButtonDownPres = SKTexture(image: UIImage(named: "shadedLightDownPressed")!)
    let textureButtonLeftPres = SKTexture(image: UIImage(named: "shadedLightLeftPressed")!)
    let textureButtonRightPres = SKTexture(image: UIImage(named: "shadedLightRightPressed")!)
    
    // Elementos del Menu
    let textureMenuTitleLeft = SKTexture(image: UIImage(named: "botonMenuIzq1")!)
    let textureMenuTitleCenter = SKTexture(image: UIImage(named: "menuText1")!)
    let textureMenuTitleRight = SKTexture(image: UIImage(named: "menuTextDer1")!)
    let textureHorizontalButton = SKTexture(image: UIImage(named: "menuBotonID")!)
    let textureTop1 =  SKTexture(image: UIImage(named: "Frame1")!)
    let textureTop2 =  SKTexture(image: UIImage(named: "Frame2")!)
    let textureTop3 =  SKTexture(image: UIImage(named: "Frame3")!)
    let textureMiddle1 =  SKTexture(image: UIImage(named: "menuMedio1")!)
    let textureMiddle2 =  SKTexture(image: UIImage(named: "menuMedio2")!)
    let textureMiddle3 =  SKTexture(image: UIImage(named: "menuMedio3")!)
    let textureBottom1 =  SKTexture(image: UIImage(named: "menuBot1")!)
    let textureBottom2 =  SKTexture(image: UIImage(named: "menuBot2")!)
    let textureBottom3 =  SKTexture(image: UIImage(named: "menuBot3")!)
    //botones
    let textureBotonAzulFijo =  SKTexture(image: UIImage(named: "botonAzulFijo")!)
    
    let textureMenuWinButton = SKTexture(image: UIImage(named: "botonRojo")!)
    let textureMenuWinButtonPres = SKTexture(image: UIImage(named: "botonRojoPress")!)
    let textureMenuButtonRight = SKTexture(image: UIImage(named: "buttonSettings")!)
    let textureMenuButtonCenter = SKTexture(image: UIImage(named: "CenterGenButton")!)
    let textureMenuButtonLeft = SKTexture(image: UIImage(named: "equipmentButton")!)
    let textureMenuButtonRightPress = SKTexture(image: UIImage(named: "buttonSettingsPress")!)
    let textureMenuButtonCenterPress = SKTexture(image: UIImage(named: "CenterGenButtonPress")!)
    let textureMenuButtonLeftPress = SKTexture(image: UIImage(named: "equipmentButtonPress")!)
    //Labels
    var labelName = SKLabelNode()
    
    //Escalas para los objetos
    let barScale: CGFloat = 2.0
    var lifePlayer: CGFloat  = 1.0
    var staminaPlayer: CGFloat  = 1.0
    
    
    
   
    
    //Carga de las imagenes del joystick
    var joystickStickImageEnabled = true {
        didSet {
            let image = joystickStickImageEnabled ? UIImage(named: "shadedLightStick") : nil
            rotateAnalogStick.stick.image = image
        }
    }
    
    var joystickSubstrateImageEnabled = true {
        didSet {
            let image = joystickSubstrateImageEnabled ? UIImage(named: "shadedLightSubstrate") : nil
            rotateAnalogStick.substrate.image = image
        }
    }
    //Creacion del Joystick
    let rotateAnalogStick = AnalogJoystick(diameter: 160) // from Class
    
    
    init(){
        
    }
    
    
    open func createStatusBar(_ ventana: CGRect){
        
        // Status Bars
        let originBar = SKSpriteNode(texture: textureHud)
        originBar.zPosition = 3
        originBar.xScale = barScale
        originBar.yScale = barScale
        originBar.position = CGPoint(x: -ventana.maxX+100, y: ventana.maxY-80)
        statusBar.addChild(originBar) // despues de que se crea cada sprite con su correspondiente textura,
                                    // dimensiones y posicion se agrega al nodo principal lifebar
        
        //Life bar
        let centerHPBar = SKSpriteNode(texture: textureCenterBar)
        centerHPBar.zPosition = 3
        centerHPBar.xScale = barScale * 2 // crear variable aparte
        centerHPBar.yScale = barScale
        centerHPBar.anchorPoint = CGPoint(x: 0, y: 0.5) // se cambia el punto de anclaje de los sprites
                                                        // del centro al extremo izquierdo del sprite, para
                                                        // cuando se escalen los objetos, su punto de origen
                                                        // no se modifique
        centerHPBar.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y+40)
        statusBar.addChild(centerHPBar)
        let rightHPBar = SKSpriteNode(texture: textureRightHPBar)
        rightHPBar.zPosition = 3
        rightHPBar.xScale = barScale
        rightHPBar.yScale = barScale
        rightHPBar.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightHPBar.position = CGPoint(x: centerHPBar.position.x + centerHPBar.size.width, y: centerHPBar.position.y)
        statusBar.addChild(rightHPBar)
        let leftHP = SKSpriteNode(texture: textureLeftHP)
        leftHP.zPosition = 3.1
        leftHP.xScale = barScale
        leftHP.yScale = barScale
        leftHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        leftHP.position = CGPoint(x: centerHPBar.position.x-3, y: centerHPBar.position.y)
        statusBar.addChild(leftHP)
        let centerHP = SKSpriteNode(texture: textureCenterHP)
        centerHP.zPosition = 3.1
        centerHP.xScale = barScale * 4.0 * lifePlayer //crear variable aparte
        centerHP.yScale = barScale
        centerHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerHP.position = CGPoint(x: leftHP.position.x + leftHP.size.width/2, y: leftHP.position.y)
        statusBar.addChild(centerHP)
        let rightHP = SKSpriteNode(texture: textureRightHP)
        rightHP.zPosition = 3.1
        rightHP.xScale = barScale
        rightHP.yScale = barScale
        rightHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightHP.position = CGPoint(x: centerHP.position.x + centerHP.size.width, y: centerHP.position.y)
        statusBar.addChild(rightHP)
        //Stamina Bar
        let centerBar2 = SKSpriteNode(texture: textureCenterBar)
        centerBar2.zPosition = 3
        centerBar2.xScale = barScale * 1.5 // crear variable aparte
        centerBar2.yScale = barScale
        centerBar2.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerBar2.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y)
        statusBar.addChild(centerBar2)
        let rightBar2 = SKSpriteNode(texture: textureRightSPBar)
        rightBar2.zPosition = 3
        rightBar2.xScale = barScale
        rightBar2.yScale = barScale
        rightBar2.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightBar2.position = CGPoint(x: centerBar2.position.x + centerBar2.size.width, y: centerBar2.position.y)
        statusBar.addChild(rightBar2)
        
        let leftSP = SKSpriteNode(texture: textureLeftSP)
        leftSP.zPosition = 3.1
        leftSP.xScale = barScale
        leftSP.yScale = barScale
        leftSP.anchorPoint = CGPoint(x: 0, y: 0.5)
        leftSP.position = CGPoint(x: centerBar2.position.x-3, y: centerBar2.position.y)
        statusBar.addChild(leftSP)
        let centerSP = SKSpriteNode(texture: textureCenterSP)
        centerSP.zPosition = 3.1
        centerSP.xScale = barScale * 2.8 * staminaPlayer //crear variable aparte
        centerSP.yScale = barScale
        centerSP.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerSP.position = CGPoint(x: leftSP.position.x + leftSP.size.width/2, y: leftSP.position.y)
        statusBar.addChild(centerSP)
        let rightSP = SKSpriteNode(texture: textureRightSP)
        rightSP.zPosition = 3.1
        rightSP.xScale = barScale
        rightSP.yScale = barScale
        rightSP.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightSP.position = CGPoint(x: centerSP.position.x + centerSP.size.width, y: centerSP.position.y)
        statusBar.addChild(rightSP)
        // Mana Bar
        let centerBar3 = SKSpriteNode(texture: textureCenterBar)
        centerBar3.zPosition = 3
        centerBar3.xScale = barScale * 1.5 // crear variable aparte
        centerBar3.yScale = barScale
        centerBar3.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerBar3.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y-40)
        statusBar.addChild(centerBar3)
        let rightBar3 = SKSpriteNode(texture: textureRightMPBar)
        rightBar3.zPosition = 3
        rightBar3.xScale = barScale
        rightBar3.yScale = barScale
        rightBar3.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightBar3.position = CGPoint(x: centerBar3.position.x + centerBar3.size.width, y: centerBar3.position.y)
        statusBar.addChild(rightBar3)
        
        
    }
    
    open func createUI(_ ventana: CGRect){
        
        //Menu Button
        let menuButton = SKSpriteNode(texture: textureMenuButton)
        menuButton.name = "Menu"
        menuButton.zPosition = 3
        menuButton.xScale = 2
        menuButton.yScale = 2
        menuButton.position = CGPoint(x: ventana.maxX-80, y: ventana.maxY-80)
        interfaz.addChild(menuButton)
        
        // Action Buttons
        let buttonUp = SKSpriteNode(texture: textureButtonUp)
        buttonUp.name = "Arriba"
        buttonUp.zPosition = 3
        buttonUp.xScale = 1.2
        buttonUp.yScale = 1.2
        buttonUp.position = CGPoint(x: ventana.maxX-150, y: -ventana.maxY+190)
        interfaz.addChild(buttonUp)
        
        let buttonDown = SKSpriteNode(texture: textureButtonDown)
        buttonDown.name = "Abajo"
        buttonDown.zPosition = 3
        buttonDown.xScale = 1.2
        buttonDown.yScale = 1.2
        buttonDown.position = CGPoint(x: buttonUp.position.x, y: buttonUp.position.y-110)
        interfaz.addChild(buttonDown)
        
        let buttonRight = SKSpriteNode(texture: textureButtonRight)
        buttonRight.name = "Der"
        buttonRight.zPosition = 3
        buttonRight.xScale = 1.2
        buttonRight.yScale = 1.2
        buttonRight.position = CGPoint(x: buttonUp.position.x+50, y: buttonUp.position.y-55)
        interfaz.addChild(buttonRight)
        
        let buttonLeft = SKSpriteNode(texture: textureButtonLeft)
        buttonLeft.name = "Izq"
        buttonLeft.zPosition = 3
        buttonLeft.xScale = 1.2
        buttonLeft.yScale = 1.2
        buttonLeft.position = CGPoint(x: buttonUp.position.x-50, y: buttonUp.position.y-55)
        interfaz.addChild(buttonLeft)
        
        
        //Joystick
        rotateAnalogStick.position = CGPoint(x:-ventana.maxX+rotateAnalogStick.radius+65, y:-ventana.maxY+rotateAnalogStick.radius+65)
        rotateAnalogStick.zPosition = 3
        interfaz.addChild(rotateAnalogStick)
        
        createStatusBar(ventana)
        interfaz.addChild(statusBar)

    }
   
    open func createMenu(_ ventana: CGRect){
        
        let escalaMenu = CGFloat(2.4)

        //Encabezado Menu (Estatico)
        let TopMenu1 = SKSpriteNode(texture: textureTop1)
        TopMenu1.zPosition = 4
        TopMenu1.xScale = escalaMenu
        TopMenu1.yScale = escalaMenu
        TopMenu1.position = CGPoint(x: -ventana.maxX+180, y: ventana.maxY-80)
        contextoMenu.addChild(TopMenu1)
        
        let TopMenu2 = SKSpriteNode(texture: textureTop2)
        TopMenu2.zPosition = 4
        TopMenu2.xScale = escalaMenu * 10
        TopMenu2.yScale = escalaMenu
        TopMenu2.anchorPoint = CGPoint(x: 0, y: 0.5)
        TopMenu2.position = CGPoint(x: TopMenu1.position.x+TopMenu1.size.width/2, y: TopMenu1.position.y)
        contextoMenu.addChild(TopMenu2)
        
        let TopMenu3 = SKSpriteNode(texture: textureTop3)
        TopMenu3.zPosition = 4
        TopMenu3.xScale = escalaMenu
        TopMenu3.yScale = escalaMenu
        TopMenu3.anchorPoint = CGPoint(x: 0, y: 0.5)
        TopMenu3.position = CGPoint(x: TopMenu2.position.x+TopMenu2.size.width, y: TopMenu2.position.y)
        contextoMenu.addChild(TopMenu3)
        // Title Bar
        let MenuTitleLeft = SKSpriteNode(texture: textureMenuTitleLeft)
        MenuTitleLeft.zPosition = 4.1
        MenuTitleLeft.xScale = escalaMenu
        MenuTitleLeft.yScale = escalaMenu
        MenuTitleLeft.anchorPoint = CGPoint(x: 0, y: 0.0)
        MenuTitleLeft.position = CGPoint(x: TopMenu1.position.x-16, y: TopMenu1.position.y+2)
        contextoMenu.addChild(MenuTitleLeft)
        let MenuTitleCenter = SKSpriteNode(texture: textureMenuTitleCenter)
        MenuTitleCenter.zPosition = 4.1
        MenuTitleCenter.xScale = escalaMenu * 2
        MenuTitleCenter.yScale = escalaMenu
        MenuTitleCenter.anchorPoint = CGPoint(x: 0, y: 0)
        MenuTitleCenter.position = CGPoint(x: MenuTitleLeft.position.x+MenuTitleLeft.size.width, y: MenuTitleLeft.position.y)
        contextoMenu.addChild(MenuTitleCenter)
        let MenuTitleRight = SKSpriteNode(texture: textureMenuTitleRight)
        MenuTitleRight.zPosition = 4.1
        MenuTitleRight.xScale = escalaMenu
        MenuTitleRight.yScale = escalaMenu
        MenuTitleRight.anchorPoint = CGPoint(x: 0, y: 0)
        MenuTitleRight.position = CGPoint(x: MenuTitleCenter.position.x+MenuTitleCenter.size.width, y: MenuTitleCenter.position.y)
        contextoMenu.addChild(MenuTitleRight)
        // Button Title Bar
        let MenuTitleButton = SKSpriteNode(texture: textureBotonAzulFijo)
        MenuTitleButton.zPosition = 4.2
        MenuTitleButton.xScale = escalaMenu
        MenuTitleButton.yScale = escalaMenu
        MenuTitleButton.anchorPoint = CGPoint(x: 0, y: 0)
        MenuTitleButton.position = CGPoint(x: MenuTitleLeft.position.x+12, y: MenuTitleLeft.position.y+14)
        contextoMenu.addChild(MenuTitleButton)
        // Button Close Menu
        let MenuCloseFrame = SKSpriteNode(texture: textureHorizontalButton)
        MenuCloseFrame.zPosition = 4.1
        MenuCloseFrame.xScale = escalaMenu
        MenuCloseFrame.yScale = escalaMenu
        MenuCloseFrame.anchorPoint = CGPoint(x: 0, y: 0)
        MenuCloseFrame.position = CGPoint(x: TopMenu3.position.x-8, y: TopMenu3.position.y+2)
        contextoMenu.addChild(MenuCloseFrame)
        
        let MenuCloseButton = SKSpriteNode(texture: textureMenuWinButton)
        MenuCloseButton.name = "MenuWin"
        MenuCloseButton.zPosition = 4.2
        MenuCloseButton.xScale = escalaMenu
        MenuCloseButton.yScale = escalaMenu
        MenuCloseButton.anchorPoint = CGPoint(x: 0, y: 0)
        MenuCloseButton.position = CGPoint(x: TopMenu3.position.x+4, y: TopMenu3.position.y+14)
        contextoMenu.addChild(MenuCloseButton)
        
        let menuBottom1 = SKSpriteNode(texture: textureBottom1)
        menuBottom1.zPosition = 3.9
        menuBottom1.xScale = escalaMenu
        menuBottom1.yScale = escalaMenu
        menuBottom1.position = CGPoint(x: TopMenu1.position.x, y: TopMenu1.position.y-TopMenu1.size.width/2)
        contextoMenu.addChild(menuBottom1)
        let menuBottom2 = SKSpriteNode(texture: textureBottom2)
        menuBottom2.zPosition = 3.9
        menuBottom2.xScale = escalaMenu * 10
        menuBottom2.yScale = escalaMenu
        menuBottom2.anchorPoint = CGPoint(x: 0, y: 0.5)
        menuBottom2.position = CGPoint(x: menuBottom1.position.x+menuBottom1.size.width/2, y: menuBottom1.position.y)
        contextoMenu.addChild(menuBottom2)
        let menuBottom3 = SKSpriteNode(texture: textureBottom3)
        menuBottom3.zPosition = 4.1
        menuBottom3.xScale = escalaMenu
        menuBottom3.yScale = escalaMenu
        menuBottom3.anchorPoint = CGPoint(x: 0, y: 0.5)
        menuBottom3.position = CGPoint(x: menuBottom2.position.x+menuBottom2.size.width, y: menuBottom2.position.y)
        contextoMenu.addChild(menuBottom3)
        
        // Botones de Navegacion
        let MenuButton1 = SKSpriteNode(texture: textureMenuButtonRight)
        MenuButton1.name = "MenuButton1"
        MenuButton1.zPosition = 4.2
        MenuButton1.xScale = escalaMenu * 3/4
        MenuButton1.yScale = escalaMenu * 3/4
        MenuButton1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton1.position = CGPoint(x: menuBottom3.position.x, y: menuBottom3.position.y+8)
        contextoMenu.addChild(MenuButton1)
        let MenuButton2 = SKSpriteNode(texture: textureMenuButtonCenter)
        MenuButton2.name = "MenuButton2"
        MenuButton2.zPosition = 4.2
        MenuButton2.xScale = escalaMenu
        MenuButton2.yScale = escalaMenu
        MenuButton2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton2.position = CGPoint(x: MenuButton1.position.x-MenuButton1.size.width, y: MenuButton1.position.y)
        contextoMenu.addChild(MenuButton2)
        let MenuButton3 = SKSpriteNode(texture: textureMenuButtonCenter)
        MenuButton3.name = "MenuButton3"
        MenuButton3.zPosition = 4.2
        MenuButton3.xScale = escalaMenu
        MenuButton3.yScale = escalaMenu
        MenuButton3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton3.position = CGPoint(x: MenuButton2.position.x-MenuButton2.size.width, y: MenuButton2.position.y)
        contextoMenu.addChild(MenuButton3)
        
        
        
        let MenuButton4 = SKSpriteNode(texture: textureMenuButtonLeftPress)
        MenuButton4.name = "MenuButton4"
        MenuButton4.zPosition = 4.2
        MenuButton4.xScale = escalaMenu * 3/4
        MenuButton4.yScale = escalaMenu * 3/4
        MenuButton4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton4.position = CGPoint(x: MenuButton3.position.x-MenuButton3.size.width, y: MenuButton3.position.y)
        contextoMenu.addChild(MenuButton4)
        
        //Etiqueta del menu
        let labelMenu = SKLabelNode(text: "Player 1")
        labelMenu.zPosition = 4.3
        labelMenu.fontSize = 30
        //labelMenu.fontName = "Romulus"
        labelMenu.fontName = "Alagard"
        labelMenu.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelMenu.position = CGPoint(x: MenuTitleCenter.position.x+50, y: MenuTitleCenter.position.y+20)
        contextoMenu.addChild(labelMenu)
        
        // Nombre del menu
        labelName = SKLabelNode(text: "Equipo")
        labelName.zPosition = 4.3
        labelName.fontSize = 58
        labelName.fontName = "Alagard"
        labelName.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        // labelName.text = "Intentario"
        labelName.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelName.position = CGPoint(x: menuBottom1.position.x, y: menuBottom1.position.y-10)
        contextoMenu.addChild(labelName)
        
        
        /* for family in UIFont.familyNames.sorted() {
         let names = UIFont.fontNames(forFamilyName: family)
         print("Family: \(family) Font names: \(names)")
         }*/
        
        //Ventana Intentario de Equipo
        let ventana1Top1 = SKSpriteNode(texture: textureTop1)
        ventana1Top1.zPosition = 4
        ventana1Top1.xScale = escalaMenu
        ventana1Top1.yScale = escalaMenu
        ventana1Top1.position = CGPoint(x: -ventana.maxX+180, y: ventana.maxY-210)
        ventana1.addChild(ventana1Top1)
        
        let ventana1Top2 = SKSpriteNode(texture: textureTop2)
        ventana1Top2.zPosition = 4
        ventana1Top2.xScale = escalaMenu * 4
        ventana1Top2.yScale = escalaMenu
        ventana1Top2.anchorPoint = CGPoint(x: 0, y: 0.5)
        ventana1Top2.position = CGPoint(x: ventana1Top1.position.x+ventana1Top1.size.width/2, y: ventana1Top1.position.y)
        ventana1.addChild(ventana1Top2)
        
        let ventana1Top3 = SKSpriteNode(texture: textureTop3)
        ventana1Top3.zPosition = 4
        ventana1Top3.xScale = escalaMenu
        ventana1Top3.yScale = escalaMenu
        ventana1Top3.anchorPoint = CGPoint(x: 0, y: 0.5)
        ventana1Top3.position = CGPoint(x: ventana1Top2.position.x+ventana1Top2.size.width, y: ventana1Top2.position.y)
        ventana1.addChild(ventana1Top3)
        
        let ventana1Middle1 = SKSpriteNode(texture: textureMiddle1)
        ventana1Middle1.zPosition = 4.1
        ventana1Middle1.xScale = escalaMenu
        ventana1Middle1.yScale = escalaMenu * 4
        ventana1Middle1.anchorPoint = CGPoint(x: 0.5, y: 1)
        ventana1Middle1.position = CGPoint(x: ventana1Top1.position.x, y: ventana1Top1.position.y-ventana1Top1.size.width/2)
        ventana1.addChild(ventana1Middle1)
        let ventana1Middle2 = SKSpriteNode(texture: textureMiddle2)
        ventana1Middle2.zPosition = 4.1
        ventana1Middle2.xScale = escalaMenu * 4
        ventana1Middle2.yScale = escalaMenu * 4
        ventana1Middle2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Middle2.position = CGPoint(x: ventana1Middle1.position.x+ventana1Middle1.size.width/2, y: ventana1Middle1.position.y)
        ventana1.addChild(ventana1Middle2)
        let ventana1Middle3 = SKSpriteNode(texture: textureMiddle3)
        ventana1Middle3.zPosition = 4.1
        ventana1Middle3.xScale = escalaMenu
        ventana1Middle3.yScale = escalaMenu * 4
        ventana1Middle3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Middle3.position = CGPoint(x: ventana1Middle2.position.x+ventana1Middle2.size.width, y: ventana1Middle2.position.y)
        ventana1.addChild(ventana1Middle3)
        
        let ventana1Bottom1 = SKSpriteNode(texture: textureBottom1)
        ventana1Bottom1.zPosition = 4.1
        ventana1Bottom1.xScale = escalaMenu
        ventana1Bottom1.yScale = escalaMenu
        ventana1Bottom1.anchorPoint = CGPoint(x: 0.5, y: 1)
        ventana1Bottom1.position = CGPoint(x: ventana1Middle1.position.x, y: ventana1Middle1.position.y-4*ventana1Middle1.size.width)
        ventana1.addChild(ventana1Bottom1)
        let ventana1Bottom2 = SKSpriteNode(texture: textureBottom2)
        ventana1Bottom2.zPosition = 4.1
        ventana1Bottom2.xScale = escalaMenu * 4
        ventana1Bottom2.yScale = escalaMenu
        ventana1Bottom2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Bottom2.position = CGPoint(x: ventana1Bottom1.position.x+ventana1Bottom1.size.width/2, y: ventana1Bottom1.position.y)
        ventana1.addChild(ventana1Bottom2)
        let ventana1Bottom3 = SKSpriteNode(texture: textureBottom3)
        ventana1Bottom3.zPosition = 4.1
        ventana1Bottom3.xScale = escalaMenu
        ventana1Bottom3.yScale = escalaMenu
        ventana1Bottom3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Bottom3.position = CGPoint(x: ventana1Bottom2.position.x+ventana1Bottom2.size.width, y: ventana1Bottom2.position.y)
        ventana1.addChild(ventana1Bottom3)
        
        //Ventana Equipo ranuras
        let ventana2Top3 = SKSpriteNode(texture: textureTop3)
        ventana2Top3.zPosition = 4
        ventana2Top3.xScale = escalaMenu
        ventana2Top3.yScale = escalaMenu
        ventana2Top3.anchorPoint = CGPoint(x: 0, y: 0.5)
        ventana2Top3.position = CGPoint(x: menuBottom3.position.x, y: ventana.maxY-210)
        ventana1.addChild(ventana2Top3)
        
        let ventana2Top2 = SKSpriteNode(texture: textureTop2)
        ventana2Top2.zPosition = 4
        ventana2Top2.xScale = escalaMenu * 3
        ventana2Top2.yScale = escalaMenu
        ventana2Top2.anchorPoint = CGPoint(x: 1, y: 0.5)
        ventana2Top2.position = CGPoint(x: ventana2Top3.position.x, y: ventana2Top3.position.y)
        ventana1.addChild(ventana2Top2)
        
        let ventana2Top1 = SKSpriteNode(texture: textureTop1)
        ventana2Top1.zPosition = 4
        ventana2Top1.xScale = escalaMenu
        ventana2Top1.yScale = escalaMenu
        ventana2Top1.anchorPoint = CGPoint(x: 1, y: 0.5)
        ventana2Top1.position = CGPoint(x: ventana2Top2.position.x-ventana2Top2.size.width, y: ventana2Top2.position.y)
        ventana1.addChild(ventana2Top1)
        
        let ventana2Middle1 = SKSpriteNode(texture: textureMiddle1)
        ventana2Middle1.zPosition = 4.1
        ventana2Middle1.xScale = escalaMenu
        ventana2Middle1.yScale = escalaMenu * 4
        ventana2Middle1.anchorPoint = CGPoint(x: 1, y: 1)
        ventana2Middle1.position = CGPoint(x: ventana2Top1.position.x, y: ventana2Top1.position.y-ventana2Top1.size.width/2)
        ventana1.addChild(ventana2Middle1)
        let ventana2Middle2 = SKSpriteNode(texture: textureMiddle2)
        ventana2Middle2.zPosition = 4.1
        ventana2Middle2.xScale = escalaMenu * 3
        ventana2Middle2.yScale = escalaMenu * 4
        ventana2Middle2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Middle2.position = CGPoint(x: ventana2Middle1.position.x, y: ventana2Middle1.position.y)
        ventana1.addChild(ventana2Middle2)
        let ventana2Middle3 = SKSpriteNode(texture: textureMiddle3)
        ventana2Middle3.zPosition = 4.1
        ventana2Middle3.xScale = escalaMenu
        ventana2Middle3.yScale = escalaMenu * 4
        ventana2Middle3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Middle3.position = CGPoint(x: ventana2Middle2.position.x+ventana2Middle2.size.width, y: ventana2Middle2.position.y)
        ventana1.addChild(ventana2Middle3)
        
        let ventana2Bottom1 = SKSpriteNode(texture: textureBottom1)
        ventana2Bottom1.zPosition = 4.1
        ventana2Bottom1.xScale = escalaMenu
        ventana2Bottom1.yScale = escalaMenu
        ventana2Bottom1.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom1.position = CGPoint(x: ventana2Middle1.position.x-ventana2Middle1.size.width, y: ventana2Middle1.position.y-4*ventana2Middle1.size.width)
        ventana1.addChild(ventana2Bottom1)
        let ventana2Bottom2 = SKSpriteNode(texture: textureBottom2)
        ventana2Bottom2.zPosition = 4.1
        ventana2Bottom2.xScale = escalaMenu * 3
        ventana2Bottom2.yScale = escalaMenu
        ventana2Bottom2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom2.position = CGPoint(x: ventana2Bottom1.position.x+ventana2Middle1.size.width, y: ventana2Bottom1.position.y)
        ventana1.addChild(ventana2Bottom2)
        let ventana2Bottom3 = SKSpriteNode(texture: textureBottom3)
        ventana2Bottom3.zPosition = 4.1
        ventana2Bottom3.xScale = escalaMenu
        ventana2Bottom3.yScale = escalaMenu
        ventana2Bottom3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom3.position = CGPoint(x: ventana2Bottom2.position.x+ventana2Bottom2.size.width, y: ventana2Bottom2.position.y)
        ventana1.addChild(ventana2Bottom3)
        
        
        lanzaMenuEquip()
        
        
        
        
    }
    
    open func lanzaMenuEquip(){
        contextoMenu.addChild(ventana1)
        //contextoMenu.addChild(ventana2)
    
    }
    
    open func cierraMenuEquip(){
        ventana1.removeFromParent()
        //ventana2.removeFromParent()
    }
    
    
}
