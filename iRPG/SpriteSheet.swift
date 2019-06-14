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

