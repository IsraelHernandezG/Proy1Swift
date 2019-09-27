//
//  GameUI.swift
//  iRPG
//
//  Created by Israel on 3/11/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

struct GameUI {
    
    // Menu
    var interfaz = SKNode()
    var contextoMenu = SKNode()
    var statusBar = SKNode()  // Las barras de estado estan compuestas por varios sprites, por lo que
                                // se crea un objeto que los contendra a todos
    var ventana1 = SKNode()
    var ventana2 = SKNode()
    var ventana3 = SKNode()
    var ventana4 = SKNode()
    
    var ventanaEmergente = SKNode()
    
    // UI elements status player
    let textureHud = SKTexture(image: UIImage(named: "Hud")!)
    
    let textureRightHPBar = SKTexture(image: UIImage(named: "HPRightBar")!)
    let textureRightSPBar = SKTexture(image: UIImage(named: "SPRightBar")!)
    let textureRightMPBar = SKTexture(image: UIImage(named: "MPRightBar")!)
    
    var textureCenterBar = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureCenterHP = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureCenterSP = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    
    // item shortcut
    var itemView : [SKTexture] = []
    
    //Controls
    var textureButtonUp = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureButtonDown = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureButtonLeft = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureButtonRight = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    
    var textureButtonUpPres = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureButtonDownPres = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureButtonLeftPres = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureButtonRightPres = SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    
    // Elementos del Menu
    let textureMenuTitle = SKTexture(image: UIImage(named: "botonMenuIzq1")!)
    let textureMenuTitleLeft = SKTexture(image: UIImage(named: "menuBar2")!)
    let textureMenuTitleLeftPress = SKTexture(image: UIImage(named: "menuBar1")!)
    let textureMenuTitleCenter = SKTexture(image: UIImage(named: "menuText2")!)
    let textureMenuTitleCenterPress = SKTexture(image: UIImage(named: "menuText1")!)
    let textureMenuTitleRight = SKTexture(image: UIImage(named: "menuTextDer2")!)
    let textureMenuTitleRightPress = SKTexture(image: UIImage(named: "menuTextDer1")!)
    let textureHorizontalButton = SKTexture(image: UIImage(named: "menuBotonID")!)
    // UI Frame
    var textureTop1 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureTop2 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureTop3 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureMiddle1 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureMiddle2 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureMiddle3 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureBottom1 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureBottom2 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    var textureBottom3 =  SKTexture(image: UIImage(imageLiteralResourceName: "default"))
    //botones
    let textureMenuButton = SKTexture(image: UIImage(named: "Icon_home")!)
    let textureMenuButtonPressed = SKTexture(image: UIImage(named: "Icon_home_p")!)
    
    let textureBotonAzulFijo =  SKTexture(image: UIImage(named: "botonAzulFijo")!)
    
    //Slider
    var textureSlideUp: SKTexture = SKTexture()
    var textureSlideDown: SKTexture = SKTexture()
    var textureSlideUpPress: SKTexture = SKTexture()
    var textureSlideDownPress: SKTexture = SKTexture()
    var textureSlideUpBlock: SKTexture = SKTexture()
    var textureSlideDownBlock: SKTexture = SKTexture()
    var textureSlideBar: SKTexture = SKTexture()
    var textureSlide: SKTexture = SKTexture()
    var valorMaxS: CGFloat = 0.0
    var valorMinS: CGFloat = 0.0
    var valorActualS: CGFloat = 0.0
    
    //botones submenus
    var textureMenuEquip: SKTexture = SKTexture()
    var textureMenuEquipPress: SKTexture = SKTexture()
    var textureMenuInventory: SKTexture = SKTexture()
    var textureMenuInventoryPress: SKTexture = SKTexture()
    var textureMenuStats: SKTexture = SKTexture()
    var textureMenuStatsPress: SKTexture = SKTexture()
    var textureMenuSettings: SKTexture = SKTexture()
    var textureMenuSettingsPress: SKTexture = SKTexture()
    
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
    //slider
    let textureLeftSliderDown = SKTexture(image: UIImage(named: "leftSliderDown")!)
    let textureLeftSliderTop = SKTexture(image: UIImage(named: "leftSliderTop")!)
    let textureLeftSliderCenter = SKTexture(image: UIImage(named: "leftSliderCenter")!)
    let textureLeftSlider = SKTexture(image: UIImage(named: "Slider")!)
    
    //Labels
    var labelItem = SKLabelNode()
    var labelVentana = SKLabelNode()
    var labelAceptar = SKLabelNode()
    var labelRechazar = SKLabelNode()
    var labelName = SKLabelNode()
    var labelEquip = SKLabelNode()
    var labelranura1 = SKLabelNode()
    var labelranura2 = SKLabelNode()
    var labelranura3 = SKLabelNode()
    var labelranura4 = SKLabelNode()
    var labelScore = SKLabelNode()
    var labelNivelPlayer = SKLabelNode()
    
    //Escalas para los objetos
    let barScale: CGFloat = 2.0
    var lifePlayer: CGFloat = 1.0
    var staminaPlayer: CGFloat = 1.0
    let escalaMenu: CGFloat = 2.4
    var escalaHP: CGFloat = 10.0
    var escalaSP: CGFloat = 5.0
    var escalaMP: CGFloat = 2.0
    
    //puntaje del jugador
    var scoreJugador : Int = 0
    
    var numItems : Int = 5
    
    // banderas
    var banderaEquipo = 0
    var banderaVentana = 0
    var ventanaOn: Bool = false
    
    //Items del Jugador
    var itemsPlayer: [[String]] = []
    //Items equipados del Jugador
    var itemsEquipedPlayer: [[String]] = []
    //
    var indexItem: Int = 0
    //
    let arrayEquip: [String] = ["leggings","armor","helmet","shield","weapon"]
    //
    var itemActual: String = ""
    var nomItemActual: String = ""
    var label1: String = ""
    var label2: String = ""
    var label3: String = ""
    var label4: String = ""
    //genero del jugador
    var generoP: String = ""
    
    //Carga de las imagenes del joystick
    var joystickStickImageEnabled = true {
        didSet {
            var stylesStick = SpriteSheet(image: UIImage(named: "stylesStick")!, rows: 4, columns: 4)
            
            //let image = joystickStickImageEnabled ? UIImage(named: "shadedLightStick") : nil
            
            rotateAnalogStick.stick.image = stylesStick.imageForColumn(column: 2, row: 1)
        }
    }
    
    var joystickSubstrateImageEnabled = true {
        didSet {
            var stylesSubstrate = SpriteSheet(image: UIImage(named: "stylesSubstrate")!, rows: 4, columns: 4)
        
            //let image = joystickSubstrateImageEnabled ? UIImage(named: "shadedLightSubstrate") : nil
            rotateAnalogStick.substrate.image = stylesSubstrate.imageForColumn(column: 2, row: 1)
        }
    }
    //Creacion del Joystick
    let rotateAnalogStick = AnalogJoystick(diameter: 190) // from Class
    
    
    init(){
        
        if let imagen = UIImage(named: "frame") {
            var frameSheet = SpriteSheet(image: imagen, rows: 3, columns: 3)
            
            textureTop1 =  frameSheet.textureForColumn(column: 0, row: 0)
            textureTop2 =  frameSheet.textureForColumn(column: 1, row: 0)
            textureTop3 =  frameSheet.textureForColumn(column: 2, row: 0)
            textureMiddle1 =  frameSheet.textureForColumn(column: 0, row: 1)
            textureMiddle2 =  frameSheet.textureForColumn(column: 1, row: 1)
            textureMiddle3 =  frameSheet.textureForColumn(column: 2, row: 1)
            textureBottom1 =  frameSheet.textureForColumn(column: 0, row: 2)
            textureBottom2 =  frameSheet.textureForColumn(column: 1, row: 2)
            textureBottom3 =  frameSheet.textureForColumn(column: 2, row: 2)
        }
        
        if let imagen = UIImage(named: "fill_bars_GUI") {
            var fillBarSheet = SpriteSheet(image: imagen, rows: 4, columns: 4)
            
            textureCenterBar = fillBarSheet.textureForColumn(column: 1, row: 0)
            textureCenterHP = fillBarSheet.textureForColumn(column: 1, row: 1)
            textureCenterSP = fillBarSheet.textureForColumn(column: 1, row: 2)
        }
        //Textures Controls
        if let imagen = UIImage(named: "stylesButtons") {
            //let stylesArrows = SpriteSheet(image: UIImage(named: "stylesArrows")!, rows: 8, columns: 8)
            var stylesButtons = SpriteSheet(image: imagen, rows: 8, columns: 8)
            
            
            textureButtonDown = stylesButtons.textureForColumn(column: 3, row: 6)
            textureButtonUp = stylesButtons.textureForColumn(column: 0, row: 6)
            textureButtonLeft = stylesButtons.textureForColumn(column: 1, row: 6)
            textureButtonRight = stylesButtons.textureForColumn(column: 2, row: 6)
            
            textureButtonDownPres = stylesButtons.textureForColumn(column: 3, row: 7)
            textureButtonUpPres = stylesButtons.textureForColumn(column: 0, row: 7)
            textureButtonLeftPres = stylesButtons.textureForColumn(column: 1, row: 7)
            textureButtonRightPres = stylesButtons.textureForColumn(column: 2, row: 7)
            
            
        }
        //Iconos potions
        if let imagen = UIImage(named: "potions") {
            var potionSheet = SpriteSheet(image: imagen, rows: 13, columns: 19)
            
            for i in 0...7 {
                //itemView.append(potionSheet.textureForColumn(column: 10+i, row: 5))
                itemView.append(potionSheet.textureForColumn(column: 1+i, row: 11))
            }
            
        }
        // Iconos Menus
        if let imagenIconos = UIImage(named: "Icons_menu") {
            var iconsMenus = SpriteSheet(image: imagenIconos, rows: 2, columns: 4)
            
            textureMenuEquip = iconsMenus.textureForColumn(column: 0, row: 0)
            textureMenuEquipPress = iconsMenus.textureForColumn(column: 0, row: 1)
            textureMenuInventory = iconsMenus.textureForColumn(column: 1, row: 0)
            textureMenuInventoryPress = iconsMenus.textureForColumn(column: 1, row: 1)
            textureMenuStats = iconsMenus.textureForColumn(column: 2, row: 0)
            textureMenuStatsPress = iconsMenus.textureForColumn(column: 2, row: 1)
            textureMenuSettings = iconsMenus.textureForColumn(column: 3, row: 0)
            textureMenuSettingsPress = iconsMenus.textureForColumn(column: 3, row: 1)
            
        }
        // Textures Slider
        
        if let imagenSlider = UIImage(named: "SliderC") {
            var texturesSlider = SpriteSheet(image: imagenSlider, rows: 3, columns: 3)
            
            textureSlideUp = texturesSlider.textureForColumn(column: 2, row: 1)
            textureSlideDown = texturesSlider.textureForColumn(column: 0, row: 1)
            textureSlideUpPress = texturesSlider.textureForColumn(column: 2, row: 2)
            textureSlideDownPress = texturesSlider.textureForColumn(column: 0, row: 2)
            textureSlideUpBlock = texturesSlider.textureForColumn(column: 2, row: 0)
            textureSlideDownBlock = texturesSlider.textureForColumn(column: 0, row: 0)
            textureSlide = texturesSlider.textureForColumn(column: 1, row: 1)
            textureSlideBar = texturesSlider.textureForColumn(column: 1, row: 0)
        }
        
    }
    
   
    
    mutating func createStatusBar(_ ventana: CGRect){
        
        // Status Bar HUD
        let originBar = SKSpriteNode(texture: textureHud)
        originBar.zPosition = 3
        originBar.xScale = barScale
        originBar.yScale = barScale
        originBar.position = CGPoint(x: -ventana.maxX+100, y: ventana.maxY-80)
        statusBar.addChild(originBar) // despues de que se crea cada sprite con su correspondiente textura,
                                    // dimensiones y posicion se agrega al nodo principal lifebar
        
        let itemV = SKSpriteNode(texture: itemView[0])
        itemV.zPosition = 4
        itemV.position = CGPoint(x: originBar.position.x-itemV.size.width+2, y: originBar.position.y+2)
        itemV.xScale = barScale * 1.5
        itemV.yScale = barScale * 1.5
        itemV.run(SKAction.repeatForever(SKAction.animate(with: itemView, timePerFrame: 0.2)))
        statusBar.addChild(itemV)
        
        labelItem = SKLabelNode(text: "\(numItems)")
        labelItem.name = "labelBoton"
        labelItem.zPosition = 4.1
        labelItem.fontSize = 36
        labelItem.fontName = "Alagard"
        labelItem.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        labelItem.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelItem.position = CGPoint(x: itemV.position.x, y: itemV.position.y-60)
        statusBar.addChild(labelItem)
        
        //Life bar
        let centerHPBar = SKSpriteNode(texture: textureCenterBar)
        centerHPBar.zPosition = 3
        centerHPBar.xScale = barScale * escalaHP
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
        rightHPBar.position = CGPoint(x: centerHPBar.position.x + centerHPBar.size.width-5, y: centerHPBar.position.y)
        statusBar.addChild(rightHPBar)
        let centerHP = SKSpriteNode(texture: textureCenterHP)
        centerHP.name = "lifeBar"
        centerHP.zPosition = 3.1
        centerHP.xScale = barScale  * escalaHP
        centerHP.yScale = barScale
        centerHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerHP.position = CGPoint(x: centerHPBar.position.x-3, y: centerHPBar.position.y)
        statusBar.addChild(centerHP)
        
        //Stamina Bar
        let centerBar2 = SKSpriteNode(texture: textureCenterBar)
        centerBar2.zPosition = 3
        centerBar2.xScale = barScale * escalaSP
        centerBar2.yScale = barScale
        centerBar2.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerBar2.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y)
        statusBar.addChild(centerBar2)
        let rightBar2 = SKSpriteNode(texture: textureRightSPBar)
        rightBar2.zPosition = 3
        rightBar2.xScale = barScale
        rightBar2.yScale = barScale
        rightBar2.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightBar2.position = CGPoint(x: centerBar2.position.x + centerBar2.size.width-5, y: centerBar2.position.y)
        statusBar.addChild(rightBar2)
        let centerSP = SKSpriteNode(texture: textureCenterSP)
        centerSP.zPosition = 3.1
        centerSP.name = "staminaBar"
        centerSP.xScale = barScale * escalaSP
        centerSP.yScale = barScale
        centerSP.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerSP.position = CGPoint(x: centerBar2.position.x-3, y: centerBar2.position.y)
        statusBar.addChild(centerSP)
        
        // Mana Bar
        let centerBar3 = SKSpriteNode(texture: textureCenterBar)
        centerBar3.zPosition = 3
        centerBar3.xScale = barScale * escalaMP
        centerBar3.yScale = barScale
        centerBar3.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerBar3.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y-40)
        statusBar.addChild(centerBar3)
        let rightBar3 = SKSpriteNode(texture: textureRightMPBar)
        rightBar3.zPosition = 3
        rightBar3.xScale = barScale
        rightBar3.yScale = barScale
        rightBar3.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightBar3.position = CGPoint(x: centerBar3.position.x + centerBar3.size.width-5, y: centerBar3.position.y)
        statusBar.addChild(rightBar3)
        
        
    }
    
    public mutating func createUI(ventana: CGRect){
        
        let scaleControls : CGFloat = 2.0
        
        //Menu Button
        let menuButton = SKSpriteNode(texture: textureMenuButton)
        menuButton.name = "Menu"
        menuButton.zPosition = 3
        menuButton.xScale = 2
        menuButton.yScale = 2
        menuButton.position = CGPoint(x: ventana.maxX-80, y: ventana.maxY-80)
        //menuButton.isUserInteractionEnabled = true
        interfaz.addChild(menuButton)
        
        // Controls
        let buttonUp = SKSpriteNode(texture: textureButtonUp)
        buttonUp.name = "Arriba"
        buttonUp.zPosition = 3
        buttonUp.xScale = scaleControls
        buttonUp.yScale = scaleControls
        buttonUp.position = CGPoint(x: ventana.maxX-250, y: ventana.midY)
        //interfaz.addChild(buttonUp)
        
        let buttonDown = SKSpriteNode(texture: textureButtonDown)
        buttonDown.name = "Abajo"
        buttonDown.zPosition = 3
        buttonDown.xScale = scaleControls
        buttonDown.yScale = scaleControls
        buttonDown.position = CGPoint(x: buttonUp.position.x, y: buttonUp.position.y-250)
        interfaz.addChild(buttonDown)
        
        let buttonRight = SKSpriteNode(texture: textureButtonRight)
        buttonRight.name = "Der"
        buttonRight.zPosition = 3
        buttonRight.xScale = scaleControls
        buttonRight.yScale = scaleControls
        buttonRight.position = CGPoint(x: buttonUp.position.x+130, y: buttonUp.position.y-130)
        interfaz.addChild(buttonRight)
        
        let buttonLeft = SKSpriteNode(texture: textureButtonLeft)
        buttonLeft.name = "Izq"
        buttonLeft.zPosition = 3
        buttonLeft.xScale = scaleControls
        buttonLeft.yScale = scaleControls
        buttonLeft.position = CGPoint(x: buttonUp.position.x-130, y: buttonUp.position.y-130)
        //interfaz.addChild(buttonLeft)
        
        /*
         // Controls
         let buttonUp = SKSpriteNode(texture: textureButtonUp)
         buttonUp.name = "Arriba"
         buttonUp.zPosition = 3
         buttonUp.xScale = scaleControls
         buttonUp.yScale = scaleControls
         buttonUp.position = CGPoint(x: ventana.maxX-170, y: -ventana.maxY+220)
         interfaz.addChild(buttonUp)
         
         let buttonDown = SKSpriteNode(texture: textureButtonDown)
         buttonDown.name = "Abajo"
         buttonDown.zPosition = 3
         buttonDown.xScale = scaleControls
         buttonDown.yScale = scaleControls
         buttonDown.position = CGPoint(x: buttonUp.position.x, y: buttonUp.position.y-130)
         interfaz.addChild(buttonDown)
         
         let buttonRight = SKSpriteNode(texture: textureButtonRight)
         buttonRight.name = "Der"
         buttonRight.zPosition = 3
         buttonRight.xScale = scaleControls
         buttonRight.yScale = scaleControls
         buttonRight.position = CGPoint(x: buttonUp.position.x+65, y: buttonUp.position.y-65)
         interfaz.addChild(buttonRight)
         
         let buttonLeft = SKSpriteNode(texture: textureButtonLeft)
         buttonLeft.name = "Izq"
         buttonLeft.zPosition = 3
         buttonLeft.xScale = scaleControls
         buttonLeft.yScale = scaleControls
         buttonLeft.position = CGPoint(x: buttonUp.position.x-65, y: buttonUp.position.y-65)
         interfaz.addChild(buttonLeft)
        */
        
        
        //Joystick
        rotateAnalogStick.position = CGPoint(x:-ventana.maxX+rotateAnalogStick.radius+90, y:-ventana.maxY+rotateAnalogStick.radius+90)
        rotateAnalogStick.zPosition = 3
        interfaz.addChild(rotateAnalogStick)
        
        createStatusBar(ventana)
        interfaz.addChild(statusBar)

    }
   
    mutating func createMenu(_ ventana: CGRect){
        
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
        
        //Menu Button
        let menuButton = SKSpriteNode(texture: textureMenuButton)
        menuButton.name = "MenuWin"
        menuButton.zPosition = 3
        menuButton.xScale = 2
        menuButton.yScale = 2
        menuButton.position = CGPoint(x: ventana.maxX-80, y: ventana.maxY-80)
        contextoMenu.addChild(menuButton)
        
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
        
        // Botones de Navegacion entre menus
        //menu Ajustes
        let MenuButton1 = SKSpriteNode(texture: textureMenuSettings)
        MenuButton1.name = "MenuButton1"
        MenuButton1.zPosition = 4.2
        MenuButton1.xScale = escalaMenu * 1.25
        MenuButton1.yScale = escalaMenu * 1.25
        MenuButton1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton1.position = CGPoint(x: menuBottom3.position.x+MenuButton1.size.width/2-6, y: menuBottom3.position.y+8)
        contextoMenu.addChild(MenuButton1)
        //menu Stats
        let MenuButton2 = SKSpriteNode(texture: textureMenuStats)
        MenuButton2.name = "MenuButton2"
        MenuButton2.zPosition = 4.2
        MenuButton2.xScale = escalaMenu * 1.25
        MenuButton2.yScale = escalaMenu * 1.25
        MenuButton2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton2.position = CGPoint(x: MenuButton1.position.x-MenuButton1.size.width, y: MenuButton1.position.y)
        contextoMenu.addChild(MenuButton2)
        //menu Inventario
        let MenuButton3 = SKSpriteNode(texture: textureMenuInventory)
        MenuButton3.name = "MenuButton3"
        MenuButton3.zPosition = 4.2
        MenuButton3.xScale = escalaMenu * 1.25
        MenuButton3.yScale = escalaMenu * 1.25
        MenuButton3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        MenuButton3.position = CGPoint(x: MenuButton2.position.x-MenuButton2.size.width, y: MenuButton2.position.y)
        contextoMenu.addChild(MenuButton3)
        // menu Equipo
        let MenuButton4 = SKSpriteNode(texture: textureMenuEquipPress)
        MenuButton4.name = "MenuButton4"
        MenuButton4.zPosition = 4.2
        MenuButton4.xScale = escalaMenu * 1.25
        MenuButton4.yScale = escalaMenu * 1.25
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
        labelName.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelName.position = CGPoint(x: menuBottom1.position.x, y: menuBottom1.position.y-10)
        contextoMenu.addChild(labelName)
        
        createEquipWindow(ventana, menuBottom3.position)
        createInventoryWindow(ventana: ventana, position: menuBottom3.position)
        
    }
    
    //Menu de Equipo
    mutating func createEquipWindow(_ ventana: CGRect, _ position: CGPoint){
        
        //ventana1.name = "ventana1"
        
        //Ventana Intentario de Equipo //******************************************************************************************************
        let ventana1Top1 = SKSpriteNode(texture: textureTop1)
        ventana1Top1.zPosition = 4
        ventana1Top1.xScale = escalaMenu
        ventana1Top1.yScale = escalaMenu
        ventana1Top1.position = CGPoint(x: -ventana.maxX+180, y: ventana.maxY-210)
        ventana1.addChild(ventana1Top1)
    
        let ventana1Top2 = SKSpriteNode(texture: textureTop2)
        ventana1Top2.zPosition = 4
        ventana1Top2.xScale = escalaMenu * 4.5
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
        ventana1Middle2.xScale = escalaMenu * 4.5
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
        ventana1Bottom2.xScale = escalaMenu * 4.5
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
        
        // Slider //*****************************************************************************************************************************
        let sliderUp = SKSpriteNode(texture: textureSlideUp)
        sliderUp.name = "sliderUp"
        sliderUp.zPosition = 4
        sliderUp.xScale = escalaMenu * 1.25
        sliderUp.yScale = escalaMenu * 1.25
        sliderUp.position = CGPoint(x: ventana1Top1.position.x-ventana1Top1.size.width/2-sliderUp.size.width/2, y: ventana1Top1.position.y)
        ventana1.addChild(sliderUp)
        
        let sliderBar = SKSpriteNode(texture: textureSlideBar)
        //sliderBar.name = "sliderBar"
        sliderBar.zPosition = 4
        sliderBar.xScale = escalaMenu * 1.25
        sliderBar.yScale = escalaMenu * 1.25 * 4
        sliderBar.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        sliderBar.position = CGPoint(x: sliderUp.position.x, y: sliderUp.position.y-sliderUp.size.height/2)
        ventana1.addChild(sliderBar)
        
        let sliderDown = SKSpriteNode(texture: textureSlideDown)
        sliderDown.name = "sliderDown"
        sliderDown.zPosition = 4
        sliderDown.xScale = escalaMenu * 1.25
        sliderDown.yScale = escalaMenu * 1.25
        sliderDown.position = CGPoint(x: sliderBar.position.x, y: sliderBar.position.y-sliderBar.size.height-sliderDown.size.height/2)
        ventana1.addChild(sliderDown)
        
        //
        let slider = SKSpriteNode(texture: textureSlide)
        slider.name = "slider"
        slider.zPosition = 4.3
        slider.xScale = escalaMenu * 1.25
        slider.yScale = escalaMenu * 1.25
    
        valorMaxS = sliderBar.position.y-slider.size.height/4
        valorActualS = valorMaxS
        valorMinS = sliderBar.position.y-sliderBar.size.height+slider.size.height/4
        
        slider.position = CGPoint(x: sliderBar.position.x, y: valorActualS)
        ventana1.addChild(slider)
        
        // Boton Equipar/Desequipar item //*****************************************************************************************************
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
        
        // label Equipar/Desequipar item //****************************************************************************************************
        labelEquip = SKLabelNode(text: "-")
        labelEquip.name = "labelBoton"
        labelEquip.zPosition = 4.4
        labelEquip.fontSize = 30
        labelEquip.fontName = "Alagard"
        labelEquip.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        // labelName.text = "Intentario"
        labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelEquip.position = CGPoint(x: buttonEquipCenter.position.x, y: buttonEquipCenter.position.y-10)
        ventana1.addChild(labelEquip)
        
    
        //Ranura 1 //****************************************************************************************************************************
        let ranura1Square = SKSpriteNode(texture: textureRanura1)
        ranura1Square.name = "ranuraA"
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
        ranura1Center.xScale = escalaMenu * 7.5
        ranura1Center.yScale = escalaMenu
        ranura1Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Center.position = CGPoint(x: ranura1Left.position.x+ranura1Left.size.width/2, y: ranura1Left.position.y)
        ventana1.addChild(ranura1Center)
        
        // label ranura item 1  //**************************************************************************************************************
        labelranura1 = SKLabelNode(text: "-")
        labelranura1.name = "labelranura1"
        labelranura1.zPosition = 4.4
        labelranura1.fontSize = 33
        labelranura1.fontName = "Alagard"
        labelranura1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura1.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura1.position = CGPoint(x: ranura1Left.position.x+ranura1Left.size.width/2, y: ranura1Left.position.y-12)
        
        let ranura1Right = SKSpriteNode(texture: textureRanura4)
        ranura1Right.name = "ranura2"
        ranura1Right.zPosition = 4.1
        ranura1Right.xScale = escalaMenu
        ranura1Right.yScale = escalaMenu
        ranura1Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Right.position = CGPoint(x: ranura1Center.position.x+ranura1Center.size.width, y: ranura1Center.position.y)
        ventana1.addChild(ranura1Right)
        
        //ranura 2 //****************************************************************************************************************************
        let ranura2Square = SKSpriteNode(texture: textureRanura1)
        ranura2Square.name = "ranuraB"
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
        ranura2Center.xScale = escalaMenu * 7.5
        ranura2Center.yScale = escalaMenu
        ranura2Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Center.position = CGPoint(x: ranura2Left.position.x+ranura2Left.size.width/2, y: ranura2Left.position.y)
        ventana1.addChild(ranura2Center)
        
        // label ranura item 2  //*************************************************************************************************************
        labelranura2 = SKLabelNode(text: "-")
        labelranura2.name = "labelranura2"
        labelranura2.zPosition = 4.4
        labelranura2.fontSize = 33
        labelranura2.fontName = "Alagard"
        labelranura2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura2.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura2.position = CGPoint(x: ranura2Left.position.x+ranura2Left.size.width/2, y: ranura2Left.position.y-12)
        
        let ranura2Right = SKSpriteNode(texture: textureRanura4)
        ranura2Right.name = "ranura5"
        ranura2Right.zPosition = 4.1
        ranura2Right.xScale = escalaMenu
        ranura2Right.yScale = escalaMenu
        ranura2Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Right.position = CGPoint(x: ranura2Center.position.x+ranura2Center.size.width, y: ranura2Center.position.y)
        ventana1.addChild(ranura2Right)
        
        //ranura 3 //****************************************************************************************************************************
        let ranura3Square = SKSpriteNode(texture: textureRanura1)
        ranura3Square.name = "ranuraC"
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
        ranura3Center.xScale = escalaMenu * 7.5
        ranura3Center.yScale = escalaMenu
        ranura3Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Center.position = CGPoint(x: ranura3Left.position.x+ranura3Left.size.width/2, y: ranura3Left.position.y)
        ventana1.addChild(ranura3Center)
        
        // label ranura item 3 //***************************************************************************************************************
        labelranura3 = SKLabelNode(text: "-")
        labelranura3.name = "labelranura3"
        labelranura3.zPosition = 4.4
        labelranura3.fontSize = 33
        labelranura3.fontName = "Alagard"
        labelranura3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura3.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura3.position = CGPoint(x: ranura3Left.position.x+ranura3Left.size.width/2, y: ranura3Left.position.y-12)
        
        let ranura3Right = SKSpriteNode(texture: textureRanura4)
        ranura3Right.name = "ranura8"
        ranura3Right.zPosition = 4.1
        ranura3Right.xScale = escalaMenu
        ranura3Right.yScale = escalaMenu
        ranura3Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Right.position = CGPoint(x: ranura3Center.position.x+ranura3Center.size.width, y: ranura3Center.position.y)
        ventana1.addChild(ranura3Right)
        
        //ranura 4 //****************************************************************************************************************************
        let ranura4Square = SKSpriteNode(texture: textureRanura1)
        ranura4Square.name = "ranuraD"
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
        ranura4Center.xScale = escalaMenu * 7.5
        ranura4Center.yScale = escalaMenu
        ranura4Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Center.position = CGPoint(x: ranura4Left.position.x+ranura4Left.size.width/2, y: ranura4Left.position.y)
        ventana1.addChild(ranura4Center)
        
        // label ranura item 3
        labelranura4 = SKLabelNode(text: "-")
        labelranura4.name = "labelranura4"
        labelranura4.zPosition = 4.4
        labelranura4.fontSize = 33
        labelranura4.fontName = "Alagard"
        labelranura4.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura4.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura4.position = CGPoint(x: ranura4Left.position.x+ranura4Left.size.width/2, y: ranura4Left.position.y-12)
        
        let ranura4Right = SKSpriteNode(texture: textureRanura4)
        ranura4Right.name = "ranura11"
        ranura4Right.zPosition = 4.1
        ranura4Right.xScale = escalaMenu
        ranura4Right.yScale = escalaMenu
        ranura4Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Right.position = CGPoint(x: ranura4Center.position.x+ranura4Center.size.width, y: ranura4Center.position.y)
        ventana1.addChild(ranura4Right)
        
        //Ventana 2 Equipo ranuras
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
    
    //ventana Inventario
    mutating func createInventoryWindow(ventana: CGRect, position: CGPoint){
        //Frame Intentario de Equipo
        let ventana1Top1 = SKSpriteNode(texture: textureTop1)
        ventana1Top1.zPosition = 4
        ventana1Top1.xScale = escalaMenu
        ventana1Top1.yScale = escalaMenu
        ventana1Top1.position = CGPoint(x: -ventana.maxX+180, y: ventana.maxY-210)
        ventana2.addChild(ventana1Top1)
        
        let ventana1Top2 = SKSpriteNode(texture: textureTop2)
        ventana1Top2.zPosition = 4
        ventana1Top2.xScale = escalaMenu * 4.5
        ventana1Top2.yScale = escalaMenu
        ventana1Top2.anchorPoint = CGPoint(x: 0, y: 0.5)
        ventana1Top2.position = CGPoint(x: ventana1Top1.position.x+ventana1Top1.size.width/2, y: ventana1Top1.position.y)
        ventana2.addChild(ventana1Top2)
        
        let ventana1Top3 = SKSpriteNode(texture: textureTop3)
        ventana1Top3.zPosition = 4
        ventana1Top3.xScale = escalaMenu
        ventana1Top3.yScale = escalaMenu
        ventana1Top3.anchorPoint = CGPoint(x: 0, y: 0.5)
        ventana1Top3.position = CGPoint(x: ventana1Top2.position.x+ventana1Top2.size.width, y: ventana1Top2.position.y)
        ventana2.addChild(ventana1Top3)
        
        let ventana1Middle1 = SKSpriteNode(texture: textureMiddle1)
        ventana1Middle1.zPosition = 4
        ventana1Middle1.xScale = escalaMenu
        ventana1Middle1.yScale = escalaMenu * 4.3
        ventana1Middle1.anchorPoint = CGPoint(x: 0.5, y: 1)
        ventana1Middle1.position = CGPoint(x: ventana1Top1.position.x, y: ventana1Top1.position.y-ventana1Top1.size.width/2)
        ventana2.addChild(ventana1Middle1)
        
        let ventana1Middle2 = SKSpriteNode(texture: textureMiddle2)
        ventana1Middle2.zPosition = 4
        ventana1Middle2.xScale = escalaMenu * 4.5
        ventana1Middle2.yScale = escalaMenu * 4.3
        ventana1Middle2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Middle2.position = CGPoint(x: ventana1Middle1.position.x+ventana1Middle1.size.width/2, y: ventana1Middle1.position.y)
        ventana2.addChild(ventana1Middle2)
        
        let ventana1Middle3 = SKSpriteNode(texture: textureMiddle3)
        ventana1Middle3.zPosition = 4
        ventana1Middle3.xScale = escalaMenu
        ventana1Middle3.yScale = escalaMenu * 4.3
        ventana1Middle3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Middle3.position = CGPoint(x: ventana1Middle2.position.x+ventana1Middle2.size.width, y: ventana1Middle2.position.y)
        ventana2.addChild(ventana1Middle3)
        
        let ventana1Bottom1 = SKSpriteNode(texture: textureBottom1)
        ventana1Bottom1.zPosition = 4
        ventana1Bottom1.xScale = escalaMenu
        ventana1Bottom1.yScale = escalaMenu
        ventana1Bottom1.anchorPoint = CGPoint(x: 0.5, y: 1)
        ventana1Bottom1.position = CGPoint(x: ventana1Middle1.position.x, y: ventana1Middle1.position.y-ventana1Middle1.size.height)
        ventana2.addChild(ventana1Bottom1)
        
        let ventana1Bottom2 = SKSpriteNode(texture: textureBottom2)
        ventana1Bottom2.zPosition = 4
        ventana1Bottom2.xScale = escalaMenu * 4.5
        ventana1Bottom2.yScale = escalaMenu
        ventana1Bottom2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Bottom2.position = CGPoint(x: ventana1Bottom1.position.x+ventana1Bottom1.size.width/2, y: ventana1Bottom1.position.y)
        ventana2.addChild(ventana1Bottom2)
        
        let ventana1Bottom3 = SKSpriteNode(texture: textureBottom3)
        ventana1Bottom3.zPosition = 4
        ventana1Bottom3.xScale = escalaMenu
        ventana1Bottom3.yScale = escalaMenu
        ventana1Bottom3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana1Bottom3.position = CGPoint(x: ventana1Bottom2.position.x+ventana1Bottom2.size.width, y: ventana1Bottom2.position.y)
        ventana2.addChild(ventana1Bottom3)
        
        //Ranuras
        //Ranura 1
        let ranura1Square = SKSpriteNode(texture: textureRanura1)
        ranura1Square.name = "ranuraA"
        ranura1Square.zPosition = 4.1
        ranura1Square.xScale = escalaMenu
        ranura1Square.yScale = escalaMenu
        ranura1Square.position = CGPoint(x: ventana1Top1.position.x+ventana1Top1.size.width/2, y: ventana1Top1.position.y-ventana1Top1.size.width/2)
        ventana2.addChild(ranura1Square)
        
        let ranura1Left = SKSpriteNode(texture: textureRanura2)
        ranura1Left.name = "ranura0"
        ranura1Left.zPosition = 4.1
        ranura1Left.xScale = escalaMenu
        ranura1Left.yScale = escalaMenu
        ranura1Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Left.position = CGPoint(x: ranura1Square.position.x+ranura1Square.size.width/2, y: ranura1Square.position.y)
        ventana2.addChild(ranura1Left)
        
        let ranura1Center = SKSpriteNode(texture: textureRanura3)
        ranura1Center.name = "ranura1"
        ranura1Center.zPosition = 4.1
        ranura1Center.xScale = escalaMenu * 7.5
        ranura1Center.yScale = escalaMenu
        ranura1Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Center.position = CGPoint(x: ranura1Left.position.x+ranura1Left.size.width/2, y: ranura1Left.position.y)
        ventana2.addChild(ranura1Center)
        
        // label ranura item 1
        labelranura1 = SKLabelNode(text: "-")
        labelranura1.name = "labelranura1"
        labelranura1.zPosition = 4.4
        labelranura1.fontSize = 33
        labelranura1.fontName = "Alagard"
        labelranura1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura1.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura1.position = CGPoint(x: ranura1Left.position.x+ranura1Left.size.width/2, y: ranura1Left.position.y-12)
        
        let ranura1Right = SKSpriteNode(texture: textureRanura4)
        ranura1Right.name = "ranura2"
        ranura1Right.zPosition = 4.1
        ranura1Right.xScale = escalaMenu
        ranura1Right.yScale = escalaMenu
        ranura1Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura1Right.position = CGPoint(x: ranura1Center.position.x+ranura1Center.size.width, y: ranura1Center.position.y)
        ventana2.addChild(ranura1Right)
        
        //ranura 2
        let ranura2Square = SKSpriteNode(texture: textureRanura1)
        ranura2Square.name = "ranuraB"
        ranura2Square.zPosition = 4.1
        ranura2Square.xScale = escalaMenu
        ranura2Square.yScale = escalaMenu
        ranura2Square.position = CGPoint(x: ranura1Square.position.x, y: ranura1Square.position.y-ranura1Square.size.width-8)
        ventana2.addChild(ranura2Square)
        
        let ranura2Left = SKSpriteNode(texture: textureRanura2)
        ranura2Left.name = "ranura3"
        ranura2Left.zPosition = 4.1
        ranura2Left.xScale = escalaMenu
        ranura2Left.yScale = escalaMenu
        ranura2Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Left.position = CGPoint(x: ranura2Square.position.x+ranura2Square.size.width/2, y: ranura2Square.position.y)
        ventana2.addChild(ranura2Left)
        
        let ranura2Center = SKSpriteNode(texture: textureRanura3)
        ranura2Center.name = "ranura4"
        ranura2Center.zPosition = 4.1
        ranura2Center.xScale = escalaMenu * 7.5
        ranura2Center.yScale = escalaMenu
        ranura2Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Center.position = CGPoint(x: ranura2Left.position.x+ranura2Left.size.width/2, y: ranura2Left.position.y)
        ventana2.addChild(ranura2Center)
        
        // label ranura item 2
        labelranura2 = SKLabelNode(text: "-")
        labelranura2.name = "labelranura2"
        labelranura2.zPosition = 4.4
        labelranura2.fontSize = 33
        labelranura2.fontName = "Alagard"
        labelranura2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura2.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura2.position = CGPoint(x: ranura2Left.position.x+ranura2Left.size.width/2, y: ranura2Left.position.y-12)
        
        let ranura2Right = SKSpriteNode(texture: textureRanura4)
        ranura2Right.name = "ranura5"
        ranura2Right.zPosition = 4.1
        ranura2Right.xScale = escalaMenu
        ranura2Right.yScale = escalaMenu
        ranura2Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura2Right.position = CGPoint(x: ranura2Center.position.x+ranura2Center.size.width, y: ranura2Center.position.y)
        ventana2.addChild(ranura2Right)
        
        //ranura 3
        let ranura3Square = SKSpriteNode(texture: textureRanura1)
        ranura3Square.name = "ranuraC"
        ranura3Square.zPosition = 4.1
        ranura3Square.xScale = escalaMenu
        ranura3Square.yScale = escalaMenu
        ranura3Square.position = CGPoint(x: ranura2Square.position.x, y: ranura2Square.position.y-ranura2Square.size.width-8)
        ventana2.addChild(ranura3Square)
        
        let ranura3Left = SKSpriteNode(texture: textureRanura2)
        ranura3Left.name = "ranura6"
        ranura3Left.zPosition = 4.1
        ranura3Left.xScale = escalaMenu
        ranura3Left.yScale = escalaMenu
        ranura3Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Left.position = CGPoint(x: ranura3Square.position.x+ranura3Square.size.width/2, y: ranura3Square.position.y)
        ventana2.addChild(ranura3Left)
        
        let ranura3Center = SKSpriteNode(texture: textureRanura3)
        ranura3Center.name = "ranura7"
        ranura3Center.zPosition = 4.1
        ranura3Center.xScale = escalaMenu * 7.5
        ranura3Center.yScale = escalaMenu
        ranura3Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Center.position = CGPoint(x: ranura3Left.position.x+ranura3Left.size.width/2, y: ranura3Left.position.y)
        ventana2.addChild(ranura3Center)
        
        // label ranura item 3
        labelranura3 = SKLabelNode(text: "-")
        labelranura3.name = "labelranura3"
        labelranura3.zPosition = 4.4
        labelranura3.fontSize = 33
        labelranura3.fontName = "Alagard"
        labelranura3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura3.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura3.position = CGPoint(x: ranura3Left.position.x+ranura3Left.size.width/2, y: ranura3Left.position.y-12)
        
        let ranura3Right = SKSpriteNode(texture: textureRanura4)
        ranura3Right.name = "ranura8"
        ranura3Right.zPosition = 4.1
        ranura3Right.xScale = escalaMenu
        ranura3Right.yScale = escalaMenu
        ranura3Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura3Right.position = CGPoint(x: ranura3Center.position.x+ranura3Center.size.width, y: ranura3Center.position.y)
        ventana2.addChild(ranura3Right)
        
        //ranura 4
        let ranura4Square = SKSpriteNode(texture: textureRanura1)
        ranura4Square.name = "ranuraD"
        ranura4Square.zPosition = 4.1
        ranura4Square.xScale = escalaMenu
        ranura4Square.yScale = escalaMenu
        ranura4Square.position = CGPoint(x: ranura3Square.position.x, y: ranura3Square.position.y-ranura3Square.size.width-8)
        ventana2.addChild(ranura4Square)
        
        let ranura4Left = SKSpriteNode(texture: textureRanura2)
        ranura4Left.name = "ranura9"
        ranura4Left.zPosition = 4.1
        ranura4Left.xScale = escalaMenu
        ranura4Left.yScale = escalaMenu
        ranura4Left.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Left.position = CGPoint(x: ranura4Square.position.x+ranura4Square.size.width/2, y: ranura4Square.position.y)
        ventana2.addChild(ranura4Left)
        
        let ranura4Center = SKSpriteNode(texture: textureRanura3)
        ranura4Center.name = "ranura10"
        ranura4Center.zPosition = 4.1
        ranura4Center.xScale = escalaMenu * 7.5
        ranura4Center.yScale = escalaMenu
        ranura4Center.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Center.position = CGPoint(x: ranura4Left.position.x+ranura4Left.size.width/2, y: ranura4Left.position.y)
        ventana2.addChild(ranura4Center)
        
        // label ranura item 3
        labelranura4 = SKLabelNode(text: "-")
        labelranura4.name = "labelranura4"
        labelranura4.zPosition = 4.4
        labelranura4.fontSize = 33
        labelranura4.fontName = "Alagard"
        labelranura4.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // Alineacion a la izquierda
        labelranura4.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        labelranura4.position = CGPoint(x: ranura4Left.position.x+ranura4Left.size.width/2, y: ranura4Left.position.y-12)
        
        let ranura4Right = SKSpriteNode(texture: textureRanura4)
        ranura4Right.name = "ranura11"
        ranura4Right.zPosition = 4.1
        ranura4Right.xScale = escalaMenu
        ranura4Right.yScale = escalaMenu
        ranura4Right.anchorPoint = CGPoint(x: 0, y: 0.5)
        ranura4Right.position = CGPoint(x: ranura4Center.position.x+ranura4Center.size.width, y: ranura4Center.position.y)
        ventana2.addChild(ranura4Right)
        
        //Frame informacion
        let ventana2Top3 = SKSpriteNode(texture: textureTop3)
        ventana2Top3.zPosition = 4
        ventana2Top3.xScale = escalaMenu
        ventana2Top3.yScale = escalaMenu
        ventana2Top3.anchorPoint = CGPoint(x: 0, y: 0.5)
        ventana2Top3.position = CGPoint(x: position.x, y: ventana.maxY-210)
        ventana2.addChild(ventana2Top3)
        
        let ventana2Top2 = SKSpriteNode(texture: textureTop2)
        ventana2Top2.zPosition = 4
        ventana2Top2.xScale = escalaMenu * 3
        ventana2Top2.yScale = escalaMenu
        ventana2Top2.anchorPoint = CGPoint(x: 1, y: 0.5)
        ventana2Top2.position = CGPoint(x: ventana2Top3.position.x, y: ventana2Top3.position.y)
        ventana2.addChild(ventana2Top2)
        
        let ventana2Top1 = SKSpriteNode(texture: textureTop1)
        ventana2Top1.zPosition = 4
        ventana2Top1.xScale = escalaMenu
        ventana2Top1.yScale = escalaMenu
        ventana2Top1.anchorPoint = CGPoint(x: 1, y: 0.5)
        ventana2Top1.position = CGPoint(x: ventana2Top2.position.x-ventana2Top2.size.width, y: ventana2Top2.position.y)
        ventana2.addChild(ventana2Top1)
        
        let ventana2Middle1 = SKSpriteNode(texture: textureMiddle1)
        ventana2Middle1.zPosition = 4
        ventana2Middle1.xScale = escalaMenu
        ventana2Middle1.yScale = escalaMenu * 4.3
        ventana2Middle1.anchorPoint = CGPoint(x: 1, y: 1)
        ventana2Middle1.position = CGPoint(x: ventana2Top1.position.x, y: ventana2Top1.position.y-ventana2Top1.size.width/2)
        ventana2.addChild(ventana2Middle1)
        let ventana2Middle2 = SKSpriteNode(texture: textureMiddle2)
        ventana2Middle2.zPosition = 4
        ventana2Middle2.xScale = escalaMenu * 3
        ventana2Middle2.yScale = escalaMenu * 4.3
        ventana2Middle2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Middle2.position = CGPoint(x: ventana2Middle1.position.x, y: ventana2Middle1.position.y)
        ventana2.addChild(ventana2Middle2)
        let ventana2Middle3 = SKSpriteNode(texture: textureMiddle3)
        ventana2Middle3.zPosition = 4
        ventana2Middle3.xScale = escalaMenu
        ventana2Middle3.yScale = escalaMenu * 4.3
        ventana2Middle3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Middle3.position = CGPoint(x: ventana2Middle2.position.x+ventana2Middle2.size.width, y: ventana2Middle2.position.y)
        ventana2.addChild(ventana2Middle3)
        
        let ventana2Bottom1 = SKSpriteNode(texture: textureBottom1)
        ventana2Bottom1.zPosition = 4
        ventana2Bottom1.xScale = escalaMenu
        ventana2Bottom1.yScale = escalaMenu
        ventana2Bottom1.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom1.position = CGPoint(x: ventana2Middle1.position.x-ventana2Middle1.size.width, y: ventana2Middle1.position.y-ventana2Middle1.size.height)
        ventana2.addChild(ventana2Bottom1)
        let ventana2Bottom2 = SKSpriteNode(texture: textureBottom2)
        ventana2Bottom2.zPosition = 4
        ventana2Bottom2.xScale = escalaMenu * 3
        ventana2Bottom2.yScale = escalaMenu
        ventana2Bottom2.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom2.position = CGPoint(x: ventana2Bottom1.position.x+ventana2Middle1.size.width, y: ventana2Bottom1.position.y)
        ventana2.addChild(ventana2Bottom2)
        let ventana2Bottom3 = SKSpriteNode(texture: textureBottom3)
        ventana2Bottom3.zPosition = 4
        ventana2Bottom3.xScale = escalaMenu
        ventana2Bottom3.yScale = escalaMenu
        ventana2Bottom3.anchorPoint = CGPoint(x: 0, y: 1)
        ventana2Bottom3.position = CGPoint(x: ventana2Bottom2.position.x+ventana2Bottom2.size.width, y: ventana2Bottom2.position.y)
        ventana2.addChild(ventana2Bottom3)
    }
    
    func controlVentana() -> Bool{
        return ventanaOn
    }
    
    func recogerObjeto(){
        labelVentana.text = "Posion Rec. Menor x1"
        labelAceptar.text = "Aceptar"
    }

    mutating func ventanaEmergente(tipo: Int, frame: CGRect, texto: String){
        //
        if ventanaOn == false{
            ventanaOn = true
            ventanaEmergente = SKNode() //resetear la ventana para su nuevo uso
            //Ventana Intentario de Equipo
            let ventana1Top1 = SKSpriteNode(texture: textureTop1)
            ventana1Top1.zPosition = 4
            ventana1Top1.xScale = escalaMenu
            ventana1Top1.yScale = escalaMenu
            ventana1Top1.position = CGPoint(x: frame.midX-240, y: -frame.maxY+210)
            ventanaEmergente.addChild(ventana1Top1)
            
            let ventana1Top2 = SKSpriteNode(texture: textureTop2)
            ventana1Top2.zPosition = 4
            ventana1Top2.xScale = escalaMenu * 5
            ventana1Top2.yScale = escalaMenu
            ventana1Top2.anchorPoint = CGPoint(x: 0, y: 0.5)
            ventana1Top2.position = CGPoint(x: ventana1Top1.position.x+ventana1Top1.size.width/2, y: ventana1Top1.position.y)
            ventanaEmergente.addChild(ventana1Top2)
            
            let ventana1Top3 = SKSpriteNode(texture: textureTop3)
            ventana1Top3.zPosition = 4
            ventana1Top3.xScale = escalaMenu
            ventana1Top3.yScale = escalaMenu
            ventana1Top3.anchorPoint = CGPoint(x: 0, y: 0.5)
            ventana1Top3.position = CGPoint(x: ventana1Top2.position.x+ventana1Top2.size.width, y: ventana1Top2.position.y)
            ventanaEmergente.addChild(ventana1Top3)
            
            let ventana1Bottom1 = SKSpriteNode(texture: textureBottom1)
            ventana1Bottom1.zPosition = 4
            ventana1Bottom1.xScale = escalaMenu
            ventana1Bottom1.yScale = escalaMenu
            ventana1Bottom1.anchorPoint = CGPoint(x: 0.5, y: 1)
            ventana1Bottom1.position = CGPoint(x: ventana1Top1.position.x, y: ventana1Top1.position.y-ventana1Top1.size.height/4)
            ventanaEmergente.addChild(ventana1Bottom1)
            let ventana1Bottom2 = SKSpriteNode(texture: textureBottom2)
            ventana1Bottom2.zPosition = 4
            ventana1Bottom2.xScale = escalaMenu * 5
            ventana1Bottom2.yScale = escalaMenu
            ventana1Bottom2.anchorPoint = CGPoint(x: 0, y: 1)
            ventana1Bottom2.position = CGPoint(x: ventana1Bottom1.position.x+ventana1Bottom1.size.width/2, y: ventana1Bottom1.position.y)
            ventanaEmergente.addChild(ventana1Bottom2)
            let ventana1Bottom3 = SKSpriteNode(texture: textureBottom3)
            ventana1Bottom3.zPosition = 4
            ventana1Bottom3.xScale = escalaMenu
            ventana1Bottom3.yScale = escalaMenu
            ventana1Bottom3.anchorPoint = CGPoint(x: 0, y: 1)
            ventana1Bottom3.position = CGPoint(x: ventana1Bottom2.position.x+ventana1Bottom2.size.width, y: ventana1Bottom2.position.y)
            ventanaEmergente.addChild(ventana1Bottom3)
            
            // label Equipar/Desequipar item
            labelVentana = SKLabelNode(text: texto)
            labelVentana.name = "labelVentana"
            labelVentana.zPosition = 4.4
            labelVentana.fontSize = 50
            labelVentana.fontName = "Alagard"
            labelVentana.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
            labelVentana.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
            labelVentana.position = CGPoint(x: ventana1Top2.position.x+ventana1Top2.size.width/2, y: ventana1Top2.position.y-40)
            ventanaEmergente.addChild(labelVentana)
            
            switch tipo {
            case 1:
                //ventana de informacion, un solo boton
                let buttonAceptLeft = SKSpriteNode(texture: textureMenuTitleLeft)
                buttonAceptLeft.name = "botonAcept1"
                buttonAceptLeft.zPosition = 4.3
                buttonAceptLeft.xScale = escalaMenu
                buttonAceptLeft.yScale = escalaMenu
                buttonAceptLeft.position = CGPoint(x: ventana1Bottom2.position.x+ventana1Bottom2.size.width/4, y: ventana1Bottom1.position.y-ventana1Bottom1.size.height+5)
                ventanaEmergente.addChild(buttonAceptLeft)
                
                let buttonAceptCenter = SKSpriteNode(texture: textureMenuTitleCenter)
                buttonAceptCenter.name = "botonAcept2"
                buttonAceptCenter.zPosition = 4.3
                buttonAceptCenter.xScale = escalaMenu * 2
                buttonAceptCenter.yScale = escalaMenu
                buttonAceptCenter.anchorPoint = CGPoint(x: 0, y: 0.5)
                buttonAceptCenter.position = CGPoint(x: buttonAceptLeft.position.x+buttonAceptLeft.size.width/2, y: buttonAceptLeft.position.y)
                ventanaEmergente.addChild(buttonAceptCenter)
                
                let buttonAceptRight = SKSpriteNode(texture: textureMenuTitleRight)
                buttonAceptRight.name = "botonAcept3"
                buttonAceptRight.zPosition = 4.3
                buttonAceptRight.xScale = escalaMenu
                buttonAceptRight.yScale = escalaMenu
                buttonAceptRight.anchorPoint = CGPoint(x: 0, y: 0.5)
                buttonAceptRight.position = CGPoint(x: buttonAceptCenter.position.x+buttonAceptCenter.size.width, y: buttonAceptCenter.position.y)
                ventanaEmergente.addChild(buttonAceptRight)
                
                labelAceptar = SKLabelNode(text: "Recoger")
                labelAceptar.name = "labelAceptar"
                labelAceptar.zPosition = 4.4
                labelAceptar.fontSize = 30
                labelAceptar.fontName = "Alagard"
                labelAceptar.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
                labelAceptar.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
                labelAceptar.position = CGPoint(x: buttonAceptCenter.position.x+buttonAceptCenter.size.width/2, y: buttonAceptCenter.position.y-10)
                ventanaEmergente.addChild(labelAceptar)
            case 2:
                //ventana de decision, se realiza una determinada accion dependiendo del jugador
                let buttonAceptLeft = SKSpriteNode(texture: textureMenuTitleLeft)
                buttonAceptLeft.name = "botonAcept1"
                buttonAceptLeft.zPosition = 4.3
                buttonAceptLeft.xScale = escalaMenu
                buttonAceptLeft.yScale = escalaMenu
                buttonAceptLeft.position = CGPoint(x: ventana1Bottom2.position.x, y: ventana1Bottom1.position.y-ventana1Bottom1.size.height+5)
                ventanaEmergente.addChild(buttonAceptLeft)
                
                let buttonAceptCenter = SKSpriteNode(texture: textureMenuTitleCenter)
                buttonAceptCenter.name = "botonAcept2"
                buttonAceptCenter.zPosition = 4.3
                buttonAceptCenter.xScale = escalaMenu * 1.5
                buttonAceptCenter.yScale = escalaMenu
                buttonAceptCenter.anchorPoint = CGPoint(x: 0, y: 0.5)
                buttonAceptCenter.position = CGPoint(x: buttonAceptLeft.position.x+buttonAceptLeft.size.width/2, y: buttonAceptLeft.position.y)
                ventanaEmergente.addChild(buttonAceptCenter)
                
                let buttonAceptRight = SKSpriteNode(texture: textureMenuTitleRight)
                buttonAceptRight.name = "botonAcept3"
                buttonAceptRight.zPosition = 4.3
                buttonAceptRight.xScale = escalaMenu
                buttonAceptRight.yScale = escalaMenu
                buttonAceptRight.anchorPoint = CGPoint(x: 0, y: 0.5)
                buttonAceptRight.position = CGPoint(x: buttonAceptCenter.position.x+buttonAceptCenter.size.width, y: buttonAceptCenter.position.y)
                ventanaEmergente.addChild(buttonAceptRight)
                
                labelAceptar = SKLabelNode(text: "Aceptar")
                labelAceptar.name = "labelAceptar"
                labelAceptar.zPosition = 4.4
                labelAceptar.fontSize = 30
                labelAceptar.fontName = "Alagard"
                labelAceptar.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
                labelAceptar.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
                labelAceptar.position = CGPoint(x: buttonAceptCenter.position.x+buttonAceptCenter.size.width/2, y: buttonAceptCenter.position.y-10)
                ventanaEmergente.addChild(labelAceptar)
                
                let buttonRechazarLeft = SKSpriteNode(texture: textureMenuTitleLeft)
                buttonRechazarLeft.name = "botonAcept1"
                buttonRechazarLeft.zPosition = 4.3
                buttonRechazarLeft.xScale = escalaMenu
                buttonRechazarLeft.yScale = escalaMenu
                buttonRechazarLeft.position = CGPoint(x: ventana1Bottom2.position.x+ventana1Bottom2.size.width*0.6, y: ventana1Bottom1.position.y-ventana1Bottom1.size.height+5)
                ventanaEmergente.addChild(buttonRechazarLeft)
                
                let buttonRechazarCenter = SKSpriteNode(texture: textureMenuTitleCenter)
                buttonRechazarCenter.name = "botonAcept2"
                buttonRechazarCenter.zPosition = 4.3
                buttonRechazarCenter.xScale = escalaMenu * 1.5
                buttonRechazarCenter.yScale = escalaMenu
                buttonRechazarCenter.anchorPoint = CGPoint(x: 0, y: 0.5)
                buttonRechazarCenter.position = CGPoint(x: buttonRechazarLeft.position.x+buttonRechazarLeft.size.width/2, y: buttonRechazarLeft.position.y)
                ventanaEmergente.addChild(buttonRechazarCenter)
                
                let buttonRechazarRight = SKSpriteNode(texture: textureMenuTitleRight)
                buttonRechazarRight.name = "botonAcept3"
                buttonRechazarRight.zPosition = 4.3
                buttonRechazarRight.xScale = escalaMenu
                buttonRechazarRight.yScale = escalaMenu
                buttonRechazarRight.anchorPoint = CGPoint(x: 0, y: 0.5)
                buttonRechazarRight.position = CGPoint(x: buttonRechazarCenter.position.x+buttonRechazarCenter.size.width, y: buttonRechazarCenter.position.y)
                ventanaEmergente.addChild(buttonRechazarRight)
                
                labelRechazar = SKLabelNode(text: "Rechazar")
                labelRechazar.name = "labelRechazar"
                labelRechazar.zPosition = 4.4
                labelRechazar.fontSize = 30
                labelRechazar.fontName = "Alagard"
                labelRechazar.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
                labelRechazar.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
                labelRechazar.position = CGPoint(x: buttonRechazarCenter.position.x+buttonRechazarCenter.size.width/2, y: buttonRechazarCenter.position.y-10)
                ventanaEmergente.addChild(labelRechazar)
            default:
                break
            }
            
            interfaz.addChild(ventanaEmergente)
            //banderaVentana = 1
        }
    }
    
    
    
    mutating func removeVentanaE(){
        if ventanaOn == true{
            
            ventanaEmergente.removeFromParent()
            //banderaVentana = 0
            ventanaOn = false
        }
    }
    
    
    func removeTableroScore(){
        labelScore.removeFromParent()
    }
    
    mutating func iniciaTableroScore(frame: CGRect){
        labelScore = SKLabelNode(text: "Score: \(scoreJugador)")
        labelScore.fontColor = UIColor(displayP3Red: CGFloat(0.9), green: CGFloat(0.9), blue: CGFloat(0.9), alpha: CGFloat(1.0))
        labelScore.zPosition = 4.4
        labelScore.fontSize = 50
        labelScore.fontName = "Alagard"
        labelScore.position = CGPoint(x: frame.midX, y: frame.maxY-80)
        
        interfaz.addChild(labelScore)
        
    }
    
    func actualizaScore(){
        labelScore.text = "Score: \(scoreJugador)"
    }
    
    
    mutating func damage(_ vida: Double, _ vidaMax: Double){
        // normalizando la vida del jugador al rango de [0,1]
        lifePlayer = CGFloat(vida*1.0/vidaMax)
        if(lifePlayer >= 0.0){
            //Redimencionando la barra de vida de acuerdo a la vida del jugador
            statusBar.childNode(withName: "lifeBar")?.run(SKAction.resize(toWidth: 10.0 * lifePlayer, duration: 0.1))
            //statusBar.childNode(withName: "lifeBar")?.run(SKAction.resize(byWidth: -0.01, height: 0.0, duration: 0.1))
        }
        
    }
    
    mutating func healt(vida: Double, vidaMax: Double){
        lifePlayer = CGFloat(vida*1.0/vidaMax)
        statusBar.childNode(withName: "lifeBar")?.run(SKAction.resize(toWidth: 10.0 * lifePlayer, duration: 0.3))
    }
    
    
    mutating func spendStamina(_ stamina: Double, _ staminaMax: Double){
        staminaPlayer = CGFloat(stamina*1.0/staminaMax)

        statusBar.childNode(withName: "staminaBar")?.run(SKAction.resize(toWidth: 10.0 * staminaPlayer, duration: 1.0))
    }
    
    mutating func restoreStamina(_ stamina: Double, _ staminaMax: Double){
        staminaPlayer = CGFloat(stamina*1.0/staminaMax)
        if(staminaPlayer <= CGFloat(staminaMax)){
            statusBar.childNode(withName: "staminaBar")?.run(SKAction.resize(toWidth: 10.0 * staminaPlayer, duration: 0.1))
        }
    }
    
    func lanzaMenuEquip(){
        if ventana1.parent == nil {
            contextoMenu.addChild(ventana1)
        }
    
    }
    
    func lanzaMenuInventory(){
        if ventana2.parent == nil{
            contextoMenu.addChild(ventana2)
        }
    }
    
    func cierraMenuEquip(){
        if ventana1.parent != nil{
            ventana1.removeFromParent()
        }
    }
    
    func cierraMenuInventory(){
        if ventana2.parent != nil{
            ventana2.removeFromParent()
        }
    }
    
    
    mutating func selEquip(idEquip: Int){
        resetEquip()
        resetRanura()
        resetLabels()
        labelEquip.removeFromParent()
        switch idEquip {
        case 1:
            ventana1.childNode(withName: "helmet")?.run(SKAction.setTexture(textureRanuraHelmetPress))
            //cargar lista de objetos
            let arrayI = parseItem(tipo: "helmet")
            indexItem = 2
            for i in 0...3{ //solo se pueden desplegar 4 elementos a la vez en el menu
                if arrayI.count-1 >= i {
                    //existe el elemento, y se manda a cargar a una ranura
                    // obtener el nombre del item
                    // obtener la imagen del item
                    cargaRanura(numRanura: i+1, nombre: arrayI[i][1], label: arrayI[i][2])
                   
                } //else{ print("no hay mas elementos") }
            }
            
        case 2:
            ventana1.childNode(withName: "amulet")?.run(SKAction.setTexture(textureRanuraAmuletPress))
        case 3:
            ventana1.childNode(withName: "armor")?.run(SKAction.setTexture(textureRanuraArmorPress))
            
            let arrayI = parseItem(tipo: "armor")
            indexItem = 1
            for i in 0...3{ //solo se pueden desplegar 4 elementos a la vez en el menu
                if arrayI.count-1 >= i {
                    //existe el elemento, y se manda a cargar a una ranura
                    cargaRanura(numRanura: i+1, nombre: arrayI[i][1], label: arrayI[i][2])
                   
                } //else{ print("no hay mas elementos") }
            }
        case 4:
            ventana1.childNode(withName: "weapon")?.run(SKAction.setTexture(textureRanuraWeaponPress))
            
            let arrayI = parseItem(tipo: "weapon")
            indexItem = 4
            for i in 0...3{ //solo se pueden desplegar 4 elementos a la vez en el menu
                if arrayI.count-1 >= i {
                    //existe el elemento, y se manda a cargar a una ranura
                    cargaRanura(numRanura: i+1, nombre: arrayI[i][1], label: arrayI[i][2])
                   
                } //else{ print("no hay mas elementos") }
            }
        case 5:
            ventana1.childNode(withName: "shield")?.run(SKAction.setTexture(textureRanuraShieldPress))
            let arrayI = parseItem(tipo: "shield")
            indexItem = 3
            for i in 0...3{ //solo se pueden desplegar 4 elementos a la vez en el menu
                if arrayI.count-1 >= i {
                    //existe el elemento, y se manda a cargar a una ranura
                    cargaRanura(numRanura: i+1, nombre: arrayI[i][1], label: arrayI[i][2])
                   
                } //else{ print("no hay mas elementos") }
            }
        case 6:
            ventana1.childNode(withName: "graves")?.run(SKAction.setTexture(textureRanuraGravesPress))
            let arrayI = parseItem(tipo: "leggings")
            indexItem = 0
            for i in 0...3{ //solo se pueden desplegar 4 elementos a la vez en el menu
                if arrayI.count-1 >= i {
                    //existe el elemento, y se manda a cargar a una ranura
                    cargaRanura(numRanura: i+1, nombre: arrayI[i][1], label: arrayI[i][2])
                    //itemActual = arrayI[i][1]
                } //else{ print("no hay mas elementos") }
            }
        case 7:
            ventana1.childNode(withName: "ring1")?.run(SKAction.setTexture(textureRanuraRingPress))
        case 8:
            ventana1.childNode(withName: "ring2")?.run(SKAction.setTexture(textureRanuraRingPress))
        case 9:
            ventana1.childNode(withName: "ring3")?.run(SKAction.setTexture(textureRanuraRingPress))
        default:
            print("default")
        }
        
    }
    
    func resetEquip(){
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
    
    mutating func cargaRanura(numRanura: Int, nombre: String, label: String){
        switch numRanura {
        case 1:
            //agregar icono del item a la ranura
            labelranura1.text = label
            label1 = nombre
            ventana1.addChild(labelranura1)
        case 2:
            //agregar icono del item a la ranura
            labelranura2.text = label
            label2 = nombre
            ventana1.addChild(labelranura2)
        case 3:
            //agregar icono del item a la ranura
            labelranura3.text = label
            label3 = nombre
            ventana1.addChild(labelranura3)
        case 4:
            //agregar icono del item a la ranura
            labelranura4.text = label
            label4 = nombre
            ventana1.addChild(labelranura4)
        default:
            print("default")
        }
    }
    
    mutating func equiparItem(){
        ventana1.childNode(withName: "botonEquip1")?.run(SKAction.setTexture(textureMenuTitleLeft))
        ventana1.childNode(withName: "botonEquip2")?.run(SKAction.setTexture(textureMenuTitleCenter))
        ventana1.childNode(withName: "botonEquip3")?.run(SKAction.setTexture(textureMenuTitleRight))
        labelEquip.fontColor = UIColor(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        
        if (labelEquip.text == "Equipar"){
            labelEquip.text = "Desequipar"
            //sustituir el item actual por el nuevo item, actualizar la lista de elementos equipados
            
            itemsEquipedPlayer[indexItem] = [arrayEquip[indexItem],nomItemActual,itemActual]
        }else{
            labelEquip.text = "Equipar"
            //"remover" el item de la lista de equipados del jugador
            itemsEquipedPlayer.remove(at: indexItem)
            itemsEquipedPlayer.insert([arrayEquip[indexItem],"null","null"], at: indexItem)
        }
        
        
    }
    
    func actualizaItem(){
        labelItem.text = "\(numItems)"
    }
    
    mutating func ranuraSel(numRanura: Int){
        resetRanura()
        
        switch numRanura {
        case 1:
            ventana1.childNode(withName: "ranuraA")?.run(SKAction.setTexture(textureRanura1Press))
            ventana1.childNode(withName: "ranura0")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura1")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura2")?.run(SKAction.setTexture(textureRanura4Press))
            //comprobar si hay un item asociado a la ranura
            if ventana1.childNode(withName: "labelranura1") != nil {
                itemActual = labelranura1.text!
                nomItemActual = label1
                ventana1.addChild(labelEquip)
                //comprobar si el item esta equipado
                if comparar(nombre: nomItemActual) == true{
                    labelEquip.text = "Desequipar"
                }else{
                    labelEquip.text = "Equipar"
                }
            }else{
                itemActual = ""
            }
           
        case 2:
            ventana1.childNode(withName: "ranuraB")?.run(SKAction.setTexture(textureRanura1Press))
            ventana1.childNode(withName: "ranura3")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura4")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura5")?.run(SKAction.setTexture(textureRanura4Press))
            //comprobar si hay un item asociado a la ranura
            if ventana1.childNode(withName: "labelranura2") != nil {
                itemActual = labelranura2.text!
                nomItemActual = label2
                ventana1.addChild(labelEquip)
                //comprobar si el item esta equipado
                if comparar(nombre: nomItemActual) == true{
                    labelEquip.text = "Desequipar"
                }else{
                    labelEquip.text = "Equipar"
                }
            }else{
                itemActual = ""
            }
        case 3:
            ventana1.childNode(withName: "ranuraC")?.run(SKAction.setTexture(textureRanura1Press))
            ventana1.childNode(withName: "ranura6")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura7")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura8")?.run(SKAction.setTexture(textureRanura4Press))
            //comprobar si hay un item asociado a la ranura
            if ventana1.childNode(withName: "labelranura3") != nil {
                itemActual = labelranura3.text!
                nomItemActual = label3
                ventana1.addChild(labelEquip)
                //comprobar si el item esta equipado
                if comparar(nombre: nomItemActual) == true{
                    labelEquip.text = "Desequipar"
                }else{
                    labelEquip.text = "Equipar"
                }
            }else{
                itemActual = ""
            }
        case 4:
            ventana1.childNode(withName: "ranuraD")?.run(SKAction.setTexture(textureRanura1Press))
            ventana1.childNode(withName: "ranura9")?.run(SKAction.setTexture(textureRanura2Press))
            ventana1.childNode(withName: "ranura10")?.run(SKAction.setTexture(textureRanura3Press))
            ventana1.childNode(withName: "ranura11")?.run(SKAction.setTexture(textureRanura4Press))
            //comprobar si hay un item asociado a la ranura
            if ventana1.childNode(withName: "labelranura4") != nil {
                itemActual = labelranura4.text!
                nomItemActual = label4
                ventana1.addChild(labelEquip)
                //comprobar si el item esta equipado
                if comparar(nombre: nomItemActual) == true{
                    labelEquip.text = "Desequipar"
                }else{
                    labelEquip.text = "Equipar"
                }
            }else{
                itemActual = ""
            }
        default:
            print("default")
            //
        }
        
    }
    
    func resetRanura(){
        ventana1.childNode(withName: "ranuraA")?.run(SKAction.setTexture(textureRanura1))
        ventana1.childNode(withName: "ranuraB")?.run(SKAction.setTexture(textureRanura1))
        ventana1.childNode(withName: "ranuraC")?.run(SKAction.setTexture(textureRanura1))
        ventana1.childNode(withName: "ranuraD")?.run(SKAction.setTexture(textureRanura1))
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
        labelEquip.removeFromParent()
    }
    
    func resetLabels(){
        labelranura1.removeFromParent()
        labelranura2.removeFromParent()
        labelranura3.removeFromParent()
        labelranura4.removeFromParent()
        //
    }
    
    func parseItem(tipo: String) -> [[String]]{
        var arrayItems: [[String]] = []
        for i in 0...(itemsPlayer.count-1) {
            if itemsPlayer[i][0] == tipo{
                arrayItems.append(itemsPlayer[i])
            }
        }
        return arrayItems
    }
    
    func comparar(nombre: String) -> Bool{
        var ok: Bool = false
        for i in 0...(itemsEquipedPlayer.count-1){
            if itemsEquipedPlayer[i][1] == nombre{
                ok = true
                break
            }
        }
        
        return ok
    }
    
    
    
}
