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
    let textureMenuTitle = SKTexture(image: UIImage(named: "botonMenuIzq1")!)
    let textureMenuTitleLeft = SKTexture(image: UIImage(named: "menuBar2")!)
    let textureMenuTitleLeftPress = SKTexture(image: UIImage(named: "menuBar1")!)
    let textureMenuTitleCenter = SKTexture(image: UIImage(named: "menuText2")!)
    let textureMenuTitleCenterPress = SKTexture(image: UIImage(named: "menuText1")!)
    let textureMenuTitleRight = SKTexture(image: UIImage(named: "menuTextDer2")!)
    let textureMenuTitleRightPress = SKTexture(image: UIImage(named: "menuTextDer1")!)
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
    //Ranura Inventario
    let textureRanura1 = SKTexture(image: UIImage(named: "ranuraItemSquare")!)
    let textureRanura1Press = SKTexture(image: UIImage(named: "ranuraItemSquarePress")!)
    let textureRanura2 = SKTexture(image: UIImage(named: "ranuraItemLeft")!)
    let textureRanura2Press = SKTexture(image: UIImage(named: "ranuraItemLeftPress")!)
    let textureRanura3 = SKTexture(image: UIImage(named: "ranuraItemCenter")!)
    let textureRanura3Press = SKTexture(image: UIImage(named: "ranuraItemCenterPress")!)
    let textureRanura4 = SKTexture(image: UIImage(named: "ranuraItemRight")!)
    let textureRanura4Press = SKTexture(image: UIImage(named: "ranuraItemRightPress")!)
    
    //Ranuras Equipo
    let textureRanuraArmor = SKTexture(image: UIImage(named: "ranuraArmor")!)
    let textureRanuraArmorPress = SKTexture(image: UIImage(named: "ranuraArmorPress")!)
    let textureRanuraHelmet = SKTexture(image: UIImage(named: "ranuraHelmet")!)
    let textureRanuraHelmetPress = SKTexture(image: UIImage(named: "ranuraHelmetPress")!)
    let textureRanuraWeapon = SKTexture(image: UIImage(named: "ranuraWeapon")!)
    let textureRanuraWeaponPress = SKTexture(image: UIImage(named: "ranuraWeaponPress")!)
    let textureRanuraShield = SKTexture(image: UIImage(named: "ranuraShield")!)
    let textureRanuraShieldPress = SKTexture(image: UIImage(named: "ranuraShieldPress")!)
    let textureRanuraGraves = SKTexture(image: UIImage(named: "ranuraGraves")!)
    let textureRanuraGravesPress = SKTexture(image: UIImage(named: "ranuraGravesPress")!)
    let textureRanuraAmulet = SKTexture(image: UIImage(named: "ranuraAmulet")!)
    let textureRanuraAmuletPress = SKTexture(image: UIImage(named: "ranuraAmuletPress")!)
    let textureRanuraRing = SKTexture(image: UIImage(named: "ranuraRing")!)
    let textureRanuraRingPress = SKTexture(image: UIImage(named: "ranuraRingPress")!)
    //Labels
    var labelName = SKLabelNode()
    var labelEquip = SKLabelNode()
    //Escalas para los objetos
    let barScale: CGFloat = 2.0
    var lifePlayer: CGFloat = 1.0
    var staminaPlayer: CGFloat = 1.0
    let escalaMenu: CGFloat = 2.4
    
    // banderas
    var banderaEquipo = 0
    

    
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
        leftHP.xScale = barScale * 0
        leftHP.yScale = barScale
        leftHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        leftHP.position = CGPoint(x: centerHPBar.position.x-3, y: centerHPBar.position.y)
        statusBar.addChild(leftHP)
        let centerHP = SKSpriteNode(texture: textureCenterHP)
        centerHP.name = "lifeBar"
        centerHP.zPosition = 3.1
        centerHP.xScale = barScale * 5.0 * lifePlayer //crear variable aparte
        centerHP.yScale = barScale
        centerHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerHP.position = CGPoint(x: leftHP.position.x + leftHP.size.width/2, y: leftHP.position.y)
        statusBar.addChild(centerHP)
        let rightHP = SKSpriteNode(texture: textureRightHP)
        rightHP.zPosition = 3.1
        rightHP.xScale = barScale * 0.0
        rightHP.yScale = barScale
        rightHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightHP.position = CGPoint(x: centerHP.position.x + centerHP.size.width, y: centerHP.position.y)
        statusBar.addChild(rightHP)
        //Stamina Bar
        let centerBar2 = SKSpriteNode(texture: textureCenterBar)
        centerBar2.zPosition = 3
        centerBar2.xScale = barScale * 1.4 // crear variable aparte
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
        centerSP.xScale = barScale * 3.0 * staminaPlayer //crear variable aparte
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
        let MenuTitleLeft = SKSpriteNode(texture: textureMenuTitle)
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
        
        createEquipWindow(ventana, menuBottom3.position)
        
        
    }
    
    open func createEquipWindow(_ ventana: CGRect, _ position: CGPoint){
        
        //ventana1.name = "ventana1"
        
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
        ventana1Middle1.zPosition = 4
        ventana1Middle1.xScale = escalaMenu
        ventana1Middle1.yScale = escalaMenu * 4.3
        ventana1Middle1.anchorPoint = CGPoint(x: 0.5, y: 1)
        ventana1Middle1.position = CGPoint(x: ventana1Top1.position.x, y: ventana1Top1.position.y-ventana1Top1.size.width/2)
        ventana1.addChild(ventana1Middle1)
        let ventana1Middle2 = SKSpriteNode(texture: textureMiddle2)
        ventana1Middle2.zPosition = 4
        ventana1Middle2.xScale = escalaMenu * 4
        ventana1Middle2.yScale = escalaMenu * 4.3
        ventana1Middle2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Middle2.position = CGPoint(x: ventana1Middle1.position.x+ventana1Middle1.size.width/2, y: ventana1Middle1.position.y)
        ventana1.addChild(ventana1Middle2)
        let ventana1Middle3 = SKSpriteNode(texture: textureMiddle3)
        ventana1Middle3.zPosition = 4
        ventana1Middle3.xScale = escalaMenu
        ventana1Middle3.yScale = escalaMenu * 4.3
        ventana1Middle3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Middle3.position = CGPoint(x: ventana1Middle2.position.x+ventana1Middle2.size.width, y: ventana1Middle2.position.y)
        ventana1.addChild(ventana1Middle3)
        
        let ventana1Bottom1 = SKSpriteNode(texture: textureBottom1)
        ventana1Bottom1.zPosition = 4
        ventana1Bottom1.xScale = escalaMenu
        ventana1Bottom1.yScale = escalaMenu
        ventana1Bottom1.anchorPoint = CGPoint(x: 0.5, y: 1)
        ventana1Bottom1.position = CGPoint(x: ventana1Middle1.position.x, y: ventana1Middle1.position.y-ventana1Middle1.size.height)
        ventana1.addChild(ventana1Bottom1)
        let ventana1Bottom2 = SKSpriteNode(texture: textureBottom2)
        ventana1Bottom2.zPosition = 4
        ventana1Bottom2.xScale = escalaMenu * 4
        ventana1Bottom2.yScale = escalaMenu
        ventana1Bottom2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Bottom2.position = CGPoint(x: ventana1Bottom1.position.x+ventana1Bottom1.size.width/2, y: ventana1Bottom1.position.y)
        ventana1.addChild(ventana1Bottom2)
        let ventana1Bottom3 = SKSpriteNode(texture: textureBottom3)
        ventana1Bottom3.zPosition = 4
        ventana1Bottom3.xScale = escalaMenu
        ventana1Bottom3.yScale = escalaMenu
        ventana1Bottom3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Bottom3.position = CGPoint(x: ventana1Bottom2.position.x+ventana1Bottom2.size.width, y: ventana1Bottom2.position.y)
        ventana1.addChild(ventana1Bottom3)
        
        // Boton Equipar/Desequipar item
        let buttonEquipLeft = SKSpriteNode(texture: textureMenuTitleLeft)
        buttonEquipLeft.name = "botonEquip1"
        buttonEquipLeft.zPosition = 4.3
        buttonEquipLeft.xScale = escalaMenu
        buttonEquipLeft.yScale = escalaMenu
        buttonEquipLeft.position = CGPoint(x: ventana1Bottom1.position.x+ventana1Bottom1.size.width/4, y: ventana1Bottom1.position.y-ventana1Bottom1.size.height+5)
        ventana1.addChild(buttonEquipLeft)
        
        let buttonEquipCenter = SKSpriteNode(texture: textureMenuTitleCenter)
        buttonEquipCenter.name = "botonEquip2"
        buttonEquipCenter.zPosition = 4.3
        buttonEquipCenter.xScale = escalaMenu * 2
        buttonEquipCenter.yScale = escalaMenu
        buttonEquipCenter.anchorPoint = CGPoint(x: 0, y: 0.5)
        buttonEquipCenter.position = CGPoint(x: buttonEquipLeft.position.x+buttonEquipLeft.size.width/2, y: buttonEquipLeft.position.y)
        ventana1.addChild(buttonEquipCenter)
        
        let buttonEquipRight = SKSpriteNode(texture: textureMenuTitleRight)
        buttonEquipRight.name = "botonEquip3"
        buttonEquipRight.zPosition = 4.3
        buttonEquipRight.xScale = escalaMenu
        buttonEquipRight.yScale = escalaMenu
        buttonEquipRight.anchorPoint = CGPoint(x: 0, y: 0.5)
        buttonEquipRight.position = CGPoint(x: buttonEquipCenter.position.x+buttonEquipCenter.size.width, y: buttonEquipCenter.position.y)
        ventana1.addChild(buttonEquipRight)
        
        // label Equipar/Desequipar item
        labelEquip = SKLabelNode(text: "Equipar")
        labelEquip.name = "labelBoton"
        labelEquip.zPosition = 4.4
        labelEquip.fontSize = 30
        labelEquip.fontName = "Alagard"
        labelEquip.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        // labelName.text = "Intentario"
        labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelEquip.position = CGPoint(x: buttonEquipCenter.position.x, y: buttonEquipCenter.position.y-10)
        ventana1.addChild(labelEquip)
        
        
        //Leer de una archivo los objetos del personaje y obtener los elementos para contruir el inventario
        //Ranura 1
        let ranura1Square = SKSpriteNode(texture: textureRanura1)
        ranura1Square.zPosition = 4.1
        ranura1Square.xScale = escalaMenu
        ranura1Square.yScale = escalaMenu
        ranura1Square.position = CGPoint(x: ventana1Top1.position.x+ventana1Top1.size.width/2, y: ventana1Top1.position.y-ventana1Top1.size.width/2)
        ventana1.addChild(ranura1Square)
        
        let ranura1Left = SKSpriteNode(texture: textureRanura2)
        ranura1Left.name = "ranura0"
        ranura1Left.zPosition = 4.1
        ranura1Left.xScale = escalaMenu
        ranura1Left.yScale = escalaMenu
        ranura1Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Left.position = CGPoint(x: ranura1Square.position.x+ranura1Square.size.width/2, y: ranura1Square.position.y)
        ventana1.addChild(ranura1Left)
        
        let ranura1Center = SKSpriteNode(texture: textureRanura3)
        ranura1Center.name = "ranura1"
        ranura1Center.zPosition = 4.1
        ranura1Center.xScale = escalaMenu * 6
        ranura1Center.yScale = escalaMenu
        ranura1Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Center.position = CGPoint(x: ranura1Left.position.x+ranura1Left.size.width/2, y: ranura1Left.position.y)
        ventana1.addChild(ranura1Center)
        
        let ranura1Right = SKSpriteNode(texture: textureRanura4)
        ranura1Right.name = "ranura2"
        ranura1Right.zPosition = 4.1
        ranura1Right.xScale = escalaMenu
        ranura1Right.yScale = escalaMenu
        ranura1Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Right.position = CGPoint(x: ranura1Center.position.x+ranura1Center.size.width, y: ranura1Center.position.y)
        ventana1.addChild(ranura1Right)
        
        //ranura 2
        let ranura2Square = SKSpriteNode(texture: textureRanura1)
        ranura2Square.zPosition = 4.1
        ranura2Square.xScale = escalaMenu
        ranura2Square.yScale = escalaMenu
        ranura2Square.position = CGPoint(x: ranura1Square.position.x, y: ranura1Square.position.y-ranura1Square.size.width-8)
        ventana1.addChild(ranura2Square)
        
        let ranura2Left = SKSpriteNode(texture: textureRanura2)
        ranura2Left.name = "ranura3"
        ranura2Left.zPosition = 4.1
        ranura2Left.xScale = escalaMenu
        ranura2Left.yScale = escalaMenu
        ranura2Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Left.position = CGPoint(x: ranura2Square.position.x+ranura2Square.size.width/2, y: ranura2Square.position.y)
        ventana1.addChild(ranura2Left)
        
        let ranura2Center = SKSpriteNode(texture: textureRanura3)
        ranura2Center.name = "ranura4"
        ranura2Center.zPosition = 4.1
        ranura2Center.xScale = escalaMenu * 6
        ranura2Center.yScale = escalaMenu
        ranura2Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Center.position = CGPoint(x: ranura2Left.position.x+ranura2Left.size.width/2, y: ranura2Left.position.y)
        ventana1.addChild(ranura2Center)
        
        let ranura2Right = SKSpriteNode(texture: textureRanura4)
        ranura2Right.name = "ranura5"
        ranura2Right.zPosition = 4.1
        ranura2Right.xScale = escalaMenu
        ranura2Right.yScale = escalaMenu
        ranura2Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Right.position = CGPoint(x: ranura2Center.position.x+ranura2Center.size.width, y: ranura2Center.position.y)
        ventana1.addChild(ranura2Right)
        
        //ranura 3
        let ranura3Square = SKSpriteNode(texture: textureRanura1)
        ranura3Square.zPosition = 4.1
        ranura3Square.xScale = escalaMenu
        ranura3Square.yScale = escalaMenu
        ranura3Square.position = CGPoint(x: ranura2Square.position.x, y: ranura2Square.position.y-ranura2Square.size.width-8)
        ventana1.addChild(ranura3Square)
        
        let ranura3Left = SKSpriteNode(texture: textureRanura2)
        ranura3Left.name = "ranura6"
        ranura3Left.zPosition = 4.1
        ranura3Left.xScale = escalaMenu
        ranura3Left.yScale = escalaMenu
        ranura3Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Left.position = CGPoint(x: ranura3Square.position.x+ranura3Square.size.width/2, y: ranura3Square.position.y)
        ventana1.addChild(ranura3Left)
        
        let ranura3Center = SKSpriteNode(texture: textureRanura3)
        ranura3Center.name = "ranura7"
        ranura3Center.zPosition = 4.1
        ranura3Center.xScale = escalaMenu * 6
        ranura3Center.yScale = escalaMenu
        ranura3Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Center.position = CGPoint(x: ranura3Left.position.x+ranura3Left.size.width/2, y: ranura3Left.position.y)
        ventana1.addChild(ranura3Center)
        
        let ranura3Right = SKSpriteNode(texture: textureRanura4)
        ranura3Right.name = "ranura8"
        ranura3Right.zPosition = 4.1
        ranura3Right.xScale = escalaMenu
        ranura3Right.yScale = escalaMenu
        ranura3Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Right.position = CGPoint(x: ranura3Center.position.x+ranura3Center.size.width, y: ranura3Center.position.y)
        ventana1.addChild(ranura3Right)
        
        //ranura 4
        let ranura4Square = SKSpriteNode(texture: textureRanura1)
        ranura4Square.zPosition = 4.1
        ranura4Square.xScale = escalaMenu
        ranura4Square.yScale = escalaMenu
        ranura4Square.position = CGPoint(x: ranura3Square.position.x, y: ranura3Square.position.y-ranura3Square.size.width-8)
        ventana1.addChild(ranura4Square)
        
        let ranura4Left = SKSpriteNode(texture: textureRanura2)
        ranura4Left.name = "ranura9"
        ranura4Left.zPosition = 4.1
        ranura4Left.xScale = escalaMenu
        ranura4Left.yScale = escalaMenu
        ranura4Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Left.position = CGPoint(x: ranura4Square.position.x+ranura4Square.size.width/2, y: ranura4Square.position.y)
        ventana1.addChild(ranura4Left)
        
        let ranura4Center = SKSpriteNode(texture: textureRanura3)
        ranura4Center.name = "ranura10"
        ranura4Center.zPosition = 4.1
        ranura4Center.xScale = escalaMenu * 6
        ranura4Center.yScale = escalaMenu
        ranura4Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Center.position = CGPoint(x: ranura4Left.position.x+ranura4Left.size.width/2, y: ranura4Left.position.y)
        ventana1.addChild(ranura4Center)
        
        let ranura4Right = SKSpriteNode(texture: textureRanura4)
        ranura4Right.name = "ranura11"
        ranura4Right.zPosition = 4.1
        ranura4Right.xScale = escalaMenu
        ranura4Right.yScale = escalaMenu
        ranura4Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Right.position = CGPoint(x: ranura4Center.position.x+ranura4Center.size.width, y: ranura4Center.position.y)
        ventana1.addChild(ranura4Right)
        
        
        
        //Ventana Equipo ranuras
        let ventana2Top3 = SKSpriteNode(texture: textureTop3)
        ventana2Top3.zPosition = 4
        ventana2Top3.xScale = escalaMenu
        ventana2Top3.yScale = escalaMenu
        ventana2Top3.anchorPoint = CGPoint(x: 0, y: 0.5)
        ventana2Top3.position = CGPoint(x: position.x, y: ventana.maxY-210)
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
        ventana2Middle1.zPosition = 4
        ventana2Middle1.xScale = escalaMenu
        ventana2Middle1.yScale = escalaMenu * 4.3
        ventana2Middle1.anchorPoint = CGPoint(x: 1, y: 1)
        ventana2Middle1.position = CGPoint(x: ventana2Top1.position.x, y: ventana2Top1.position.y-ventana2Top1.size.width/2)
        ventana1.addChild(ventana2Middle1)
        let ventana2Middle2 = SKSpriteNode(texture: textureMiddle2)
        ventana2Middle2.zPosition = 4
        ventana2Middle2.xScale = escalaMenu * 3
        ventana2Middle2.yScale = escalaMenu * 4.3
        ventana2Middle2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Middle2.position = CGPoint(x: ventana2Middle1.position.x, y: ventana2Middle1.position.y)
        ventana1.addChild(ventana2Middle2)
        let ventana2Middle3 = SKSpriteNode(texture: textureMiddle3)
        ventana2Middle3.zPosition = 4
        ventana2Middle3.xScale = escalaMenu
        ventana2Middle3.yScale = escalaMenu * 4.3
        ventana2Middle3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Middle3.position = CGPoint(x: ventana2Middle2.position.x+ventana2Middle2.size.width, y: ventana2Middle2.position.y)
        ventana1.addChild(ventana2Middle3)
        
        let ventana2Bottom1 = SKSpriteNode(texture: textureBottom1)
        ventana2Bottom1.zPosition = 4
        ventana2Bottom1.xScale = escalaMenu
        ventana2Bottom1.yScale = escalaMenu
        ventana2Bottom1.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom1.position = CGPoint(x: ventana2Middle1.position.x-ventana2Middle1.size.width, y: ventana2Middle1.position.y-ventana2Middle1.size.height)
        ventana1.addChild(ventana2Bottom1)
        let ventana2Bottom2 = SKSpriteNode(texture: textureBottom2)
        ventana2Bottom2.zPosition = 4
        ventana2Bottom2.xScale = escalaMenu * 3
        ventana2Bottom2.yScale = escalaMenu
        ventana2Bottom2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom2.position = CGPoint(x: ventana2Bottom1.position.x+ventana2Middle1.size.width, y: ventana2Bottom1.position.y)
        ventana1.addChild(ventana2Bottom2)
        let ventana2Bottom3 = SKSpriteNode(texture: textureBottom3)
        ventana2Bottom3.zPosition = 4
        ventana2Bottom3.xScale = escalaMenu
        ventana2Bottom3.yScale = escalaMenu
        ventana2Bottom3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom3.position = CGPoint(x: ventana2Bottom2.position.x+ventana2Bottom2.size.width, y: ventana2Bottom2.position.y)
        ventana1.addChild(ventana2Bottom3)
        
        //Ranuras del Equipo
        let ranuraHelmet = SKSpriteNode(texture: textureRanuraHelmetPress)
        ranuraHelmet.name = "helmet"
        ranuraHelmet.zPosition = 4.1
        ranuraHelmet.xScale = escalaMenu
        ranuraHelmet.yScale = escalaMenu
        ranuraHelmet.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraHelmet.position = CGPoint(x: ventana2Top2.position.x-ventana2Top2.size.height+8, y: ventana2Top2.position.y-ventana2Top2.size.height/2)
        ventana1.addChild(ranuraHelmet)
        
        let ranuraAmulet = SKSpriteNode(texture: textureRanuraAmulet)
        ranuraAmulet.name = "amulet"
        ranuraAmulet.zPosition = 4.1
        ranuraAmulet.xScale = escalaMenu
        ranuraAmulet.yScale = escalaMenu
        ranuraAmulet.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraAmulet.position = CGPoint(x: ranuraHelmet.position.x+ranuraHelmet.size.width+12, y: ranuraHelmet.position.y-ranuraHelmet.size.height/2)
        ventana1.addChild(ranuraAmulet)
        
        let ranuraArmor = SKSpriteNode(texture: textureRanuraArmor)
        ranuraArmor.name = "armor"
        ranuraArmor.zPosition = 4.1
        ranuraArmor.xScale = escalaMenu
        ranuraArmor.yScale = escalaMenu
        ranuraArmor.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraArmor.position = CGPoint(x: ranuraHelmet.position.x, y: ranuraHelmet.position.y-ranuraHelmet.size.height-12)
        ventana1.addChild(ranuraArmor)
        
        let ranuraWeapon = SKSpriteNode(texture: textureRanuraWeapon)
        ranuraWeapon.name = "weapon"
        ranuraWeapon.zPosition = 4.1
        ranuraWeapon.xScale = escalaMenu
        ranuraWeapon.yScale = escalaMenu
        ranuraWeapon.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraWeapon.position = CGPoint(x: ranuraArmor.position.x-ranuraArmor.size.width-12, y: ranuraArmor.position.y-ranuraArmor.size.height/2)
        ventana1.addChild(ranuraWeapon)
        
        let ranuraShield = SKSpriteNode(texture: textureRanuraShield)
        ranuraShield.name = "shield"
        ranuraShield.zPosition = 4.1
        ranuraShield.xScale = escalaMenu
        ranuraShield.yScale = escalaMenu
        ranuraShield.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraShield.position = CGPoint(x: ranuraArmor.position.x+ranuraArmor.size.width+12, y: ranuraArmor.position.y-ranuraArmor.size.height/2)
        ventana1.addChild(ranuraShield)
        
        let ranuraGraves = SKSpriteNode(texture: textureRanuraGraves)
        ranuraGraves.name = "graves"
        ranuraGraves.zPosition = 4.1
        ranuraGraves.xScale = escalaMenu
        ranuraGraves.yScale = escalaMenu
        ranuraGraves.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraGraves.position = CGPoint(x: ranuraArmor.position.x, y: ranuraArmor.position.y-ranuraArmor.size.height-12)
        ventana1.addChild(ranuraGraves)
        
        let ranuraRing2 = SKSpriteNode(texture: textureRanuraRing)
        ranuraRing2.name = "ring2"
        ranuraRing2.zPosition = 4.1
        ranuraRing2.xScale = escalaMenu
        ranuraRing2.yScale = escalaMenu
        ranuraRing2.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraRing2.position = CGPoint(x: ranuraGraves.position.x, y: ranuraGraves.position.y-ranuraGraves.size.height-16)
        ventana1.addChild(ranuraRing2)
        
        let ranuraRing1 = SKSpriteNode(texture: textureRanuraRing)
        ranuraRing1.name = "ring1"
        ranuraRing1.zPosition = 4.1
        ranuraRing1.xScale = escalaMenu
        ranuraRing1.yScale = escalaMenu
        ranuraRing1.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraRing1.position = CGPoint(x: ranuraRing2.position.x-ranuraRing2.size.width-12, y: ranuraRing2.position.y)
        ventana1.addChild(ranuraRing1)
        
        let ranuraRing3 = SKSpriteNode(texture: textureRanuraRing)
        ranuraRing3.name = "ring3"
        ranuraRing3.zPosition = 4.1
        ranuraRing3.xScale = escalaMenu
        ranuraRing3.yScale = escalaMenu
        ranuraRing3.anchorPoint = CGPoint(x: 1, y: 0.5)
        ranuraRing3.position = CGPoint(x: ranuraRing2.position.x+ranuraRing2.size.width+12, y: ranuraRing2.position.y)
        ventana1.addChild(ranuraRing3)
        
        lanzaMenuEquip()
        
    }
    
    open func ventanaEmergente(){
        
    }
    
    
    open func equiparItem(){
        ventana1.childNode(withName: "botonEquip1")?.run(SKAction.setTexture(textureMenuTitleLeft))
        ventana1.childNode(withName: "botonEquip2")?.run(SKAction.setTexture(textureMenuTitleCenter))
        ventana1.childNode(withName: "botonEquip3")?.run(SKAction.setTexture(textureMenuTitleRight))
        labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        
        if (banderaEquipo == 0){
             labelEquip.text = "Desequipar"
            banderaEquipo = 1
        }else{
             labelEquip.text = "Equipar"
            banderaEquipo = 0
        }
       
        
        
    }
    
    
    func damage(_ vida: Double){
        // normalizando la vida del jugador al rando de [0,1]
        lifePlayer = CGFloat(vida*1.0/100)
        
        if(lifePlayer >= 0.0){
            //Redimencionando la barra de vida de acuerdo a la vida del jugador
            statusBar.childNode(withName: "lifeBar")?.run(SKAction.resize(toWidth: barScale * 5.0 * lifePlayer, duration: 0.1))
        }
    }
    
    func healt(_ vida: Double){
        lifePlayer = CGFloat(vida*1.0/100)
        statusBar.childNode(withName: "lifeBar")?.run(SKAction.resize(toWidth: barScale * 5.0 * lifePlayer, duration: 1.0))
    }
    
    
    open func lanzaMenuEquip(){
        //
        contextoMenu.addChild(ventana1)
    
    }
    
    open func cierraMenuEquip(){
        ventana1.removeFromParent()
    }
    
    open func selEquip(_ numRanura: Int){
        resetEquip()
        switch numRanura {
        case 1:
            ventana1.childNode(withName: "helmet")?.run(SKAction.setTexture(textureRanuraHelmetPress))
        case 2:
            ventana1.childNode(withName: "amulet")?.run(SKAction.setTexture(textureRanuraAmuletPress))
        case 3:
            ventana1.childNode(withName: "armor")?.run(SKAction.setTexture(textureRanuraArmorPress))
        case 4:
            ventana1.childNode(withName: "weapon")?.run(SKAction.setTexture(textureRanuraWeaponPress))
        case 5:
            ventana1.childNode(withName: "shield")?.run(SKAction.setTexture(textureRanuraShieldPress))
        case 6:
            ventana1.childNode(withName: "graves")?.run(SKAction.setTexture(textureRanuraGravesPress))
        case 7:
            ventana1.childNode(withName: "ring1")?.run(SKAction.setTexture(textureRanuraRingPress))
        case 8:
            ventana1.childNode(withName: "ring2")?.run(SKAction.setTexture(textureRanuraRingPress))
        case 9:
            ventana1.childNode(withName: "ring3")?.run(SKAction.setTexture(textureRanuraRingPress))
        default:
            print("default")
            //
        }
        
    }
    
    open func resetEquip(){
        ventana1.childNode(withName: "helmet")?.run(SKAction.setTexture(textureRanuraHelmet))
        ventana1.childNode(withName: "amulet")?.run(SKAction.setTexture(textureRanuraAmulet))
        ventana1.childNode(withName: "armor")?.run(SKAction.setTexture(textureRanuraArmor))
        ventana1.childNode(withName: "weapon")?.run(SKAction.setTexture(textureRanuraWeapon))
        ventana1.childNode(withName: "shield")?.run(SKAction.setTexture(textureRanuraShield))
        ventana1.childNode(withName: "graves")?.run(SKAction.setTexture(textureRanuraGraves))
        ventana1.childNode(withName: "ring1")?.run(SKAction.setTexture(textureRanuraRing))
        ventana1.childNode(withName: "ring2")?.run(SKAction.setTexture(textureRanuraRing))
        ventana1.childNode(withName: "ring3")?.run(SKAction.setTexture(textureRanuraRing))
    }
    
    
    open func ranuraSel(_ numRanura: Int){
        resetRanura()
        switch numRanura {
        case 1:
            ventana1.childNode(withName: "ranura0")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura1")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura2")?.run(SKAction.setTexture(textureRanura4Press))
        case 2:
            ventana1.childNode(withName: "ranura3")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura4")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura5")?.run(SKAction.setTexture(textureRanura4Press))
        case 3:
            ventana1.childNode(withName: "ranura6")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura7")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura8")?.run(SKAction.setTexture(textureRanura4Press))
        case 4:
            ventana1.childNode(withName: "ranura9")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura10")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura11")?.run(SKAction.setTexture(textureRanura4Press))
        default:
            print("default")
            //
        }
        
    }
    
    open func resetRanura(){
        ventana1.childNode(withName: "ranura0")?.run(SKAction.setTexture(textureRanura2))
        ventana1.childNode(withName: "ranura1")?.run(SKAction.setTexture(textureRanura3))
        ventana1.childNode(withName: "ranura2")?.run(SKAction.setTexture(textureRanura4))
        ventana1.childNode(withName: "ranura3")?.run(SKAction.setTexture(textureRanura2))
        ventana1.childNode(withName: "ranura4")?.run(SKAction.setTexture(textureRanura3))
        ventana1.childNode(withName: "ranura5")?.run(SKAction.setTexture(textureRanura4))
        ventana1.childNode(withName: "ranura6")?.run(SKAction.setTexture(textureRanura2))
        ventana1.childNode(withName: "ranura7")?.run(SKAction.setTexture(textureRanura3))
        ventana1.childNode(withName: "ranura8")?.run(SKAction.setTexture(textureRanura4))
        ventana1.childNode(withName: "ranura9")?.run(SKAction.setTexture(textureRanura2))
        ventana1.childNode(withName: "ranura10")?.run(SKAction.setTexture(textureRanura3))
        ventana1.childNode(withName: "ranura11")?.run(SKAction.setTexture(textureRanura4))

    }
    
    
    
    
    
}
