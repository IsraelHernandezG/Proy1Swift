//
//  HojaSprite.swift
//  iRPG
//
//  Created by Israel on 5/30/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteSheet {
    
    let rows: Int
    let columns: Int
    let image: UIImage
    var xCoord: Int = 0
    var yCoord: Int = 0
    var SpriteWidth: Int = 0
    var SpriteHeight: Int = 0
    var cgImage: CGImage
    
    init(image: UIImage, rows: Int, columns: Int) {
        self.image = image
        self.rows = rows
        self.columns = columns
        
        SpriteWidth = Int(image.size.width)/columns
        SpriteHeight = Int(image.size.height)/rows
        //print("width: \(SpriteWidth), height: \(SpriteHeight)")
        
        self.cgImage = image.cgImage!
    }
    
    
    func textureForColumn(column: Int, row: Int)->SKTexture {
        
        xCoord = column*SpriteWidth
        yCoord = row*SpriteHeight
        //print("x: \(xCoord), y: \(yCoord)")
        let croppedCGImage: CGImage = cgImage.cropping(to: CGRect(x: xCoord, y: yCoord, width: SpriteWidth, height: SpriteHeight))!
    
        return  SKTexture(cgImage: croppedCGImage)
    }
    
}

class SpriteSheet2 {
    
    let rows: Int
    let columns: Int
    let texture: SKTexture
    var xCoord: Int = 0
    var yCoord: Int = 0
    var SpriteWidth: Int = 0
    var SpriteHeight: Int = 0
    
    init(texture: SKTexture, rows: Int, columns: Int) {
        self.texture = texture
        self.rows = rows
        self.columns = columns
        
        SpriteWidth = Int(texture.size().width)/columns
        SpriteHeight = Int(texture.size().height)/rows
        //print("width: \(SpriteWidth), height: \(SpriteHeight)")
        print("Hoja width: \(texture.size().width), height: \(texture.size().height)")
    }
    
    
    func textureForColumn(column: Int, row: Int)->SKTexture {
        
        xCoord = column*SpriteWidth
        yCoord = row*SpriteHeight
        
        print("x: \(xCoord), y: \(yCoord)")
        print("width: \(SpriteWidth), height: \(SpriteHeight)")
        
        let rect = CGRect(x: xCoord, y: yCoord, width: SpriteWidth, height: SpriteHeight)
        
        let sprite = SKTexture(rect: rect, in: texture)
        
        print("x3: \(rect.origin.x/self.texture.size().width), y3: \(rect.origin.y/self.texture.size().height)")
        print("width3: \(rect.size.width/self.texture.size().width), height3: \(rect.size.height/self.texture.size().height)")
        
        let textureRect=CGRect(x: rect.origin.x/self.texture.size().width, y: rect.origin.y/self.texture.size().height,
                           width: rect.size.width/self.texture.size().width, height: rect.size.height/self.texture.size().height)
        
        
        
        let sprite2 =  SKTexture(rect: textureRect, in: self.texture)
        
        
        
        print("widthS: \(sprite.size().width), heightS: \(sprite.size().height)")
        print("widthS2: \(sprite2.size().width), heightS2: \(sprite2.size().height)")
        
        return sprite2
    }
    
}
