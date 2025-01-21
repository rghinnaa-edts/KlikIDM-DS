//
//  ColorManager.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 20/11/24.
//

import SwiftUI

struct ColorItem {
    let name: String
    let color: Color
}

struct ColorCategory {
    let name: String
    let colors: [ColorItem]
}

class ColorManager {
    let categories: [ColorCategory] = [
            ColorCategory(name: "Neutral", colors: [
                ColorItem(name: "Black IDM", color: Color.blackIDM),
                ColorItem(name: "White IDM", color: Color.whiteIDM)
            ]),
            
            ColorCategory(name: "Grey", colors: [
                ColorItem(name: "Grey 10", color: Color.grey10),
                ColorItem(name: "Grey 20", color: Color.grey20),
                ColorItem(name: "Grey 30", color: Color.grey30),
                ColorItem(name: "Grey 40", color: Color.grey40),
                ColorItem(name: "Grey 50", color: Color.grey50),
                ColorItem(name: "Grey 60", color: Color.grey60),
                ColorItem(name: "Grey 70", color: Color.grey70)
            ]),
        
            ColorCategory(name: "Primary-Blue", colors: [
                ColorItem(name: "Blue 10", color: Color.blue10),
                ColorItem(name: "Blue 20", color: Color.blue20),
                ColorItem(name: "Blue 30", color: Color.blue30),
                ColorItem(name: "Blue 40", color: Color.blue40),
                ColorItem(name: "Blue 50", color: Color.blue50),
                ColorItem(name: "Blue 60", color: Color.blue60),
                ColorItem(name: "Blue 70", color: Color.blue70)
            ]),
        
        ColorCategory(name: "Secondary-Yellow", colors: [
            ColorItem(name: "Yellow 10", color: Color.yellow10),
            ColorItem(name: "Yellow 20", color: Color.yellow20),
            ColorItem(name: "Yellow 30", color: Color.yellow30),
            ColorItem(name: "Yellow 40", color: Color.yellow40),
            ColorItem(name: "Yellow 50", color: Color.yellow50)
        ]),
        
        ColorCategory(name: "Secondary-Red", colors: [
            ColorItem(name: "Red 10", color: Color.red10),
            ColorItem(name: "Red 20", color: Color.red20),
            ColorItem(name: "Red 30", color: Color.red30),
            ColorItem(name: "Red 40", color: Color.red40),
            ColorItem(name: "Red 50", color: Color.red50)
        ]),
        
        ColorCategory(name: "Secondary-Green", colors: [
            ColorItem(name: "Green 10", color: Color.green10),
            ColorItem(name: "Green 20", color: Color.green20),
            ColorItem(name: "Green 30", color: Color.green30),
            ColorItem(name: "Green 40", color: Color.green40),
            ColorItem(name: "Green 50", color: Color.green50),
        ]),
        
        ColorCategory(name: "Secondary-Orange", colors: [
            ColorItem(name: "Orange 10", color: Color.orange10),
            ColorItem(name: "Orange 20", color: Color.orange20),
            ColorItem(name: "Orange 30", color: Color.orange30),
            ColorItem(name: "Orange 40", color: Color.orange40),
            ColorItem(name: "Orange 50", color: Color.orange50)
        ]),
        
        ColorCategory(name: "Button Primary & Secondary", colors: [
            ColorItem(name: "Blue Default", color: Color.blueDefault),
            ColorItem(name: "Blue Pressed", color: Color.bluePressed)
        ]),
        
        ColorCategory(name: "Button Tertiary", colors: [
            ColorItem(name: "Grey Default", color: Color.greyDefault),
            ColorItem(name: "Grey Tertiary", color: Color.greyPressed)
        ]),
        
        ColorCategory(name: "Button Cart FAB", colors: [
            ColorItem(name: "Cart Default", color: Color.cartDefault),
            ColorItem(name: "Cart Pressed", color: Color.cartPressed)
        ]),
        
        ColorCategory(name: "Support", colors: [
            ColorItem(name: "Success Strong", color: Color.successStrong),
            ColorItem(name: "Success Weak", color: Color.successWeak),
            ColorItem(name: "Error Strong", color: Color.errorStrong),
            ColorItem(name: "Error Weak", color: Color.errorWeak),
            ColorItem(name: "Warning Strong", color: Color.warningStrong),
            ColorItem(name: "Warning Weak", color: Color.warningWeak)
        ]),
        
        ColorCategory(name: "Brand", colors: [
            ColorItem(name: "Xtra", color: Color.xtra),
            ColorItem(name: "Xpress", color: Color.xpress),
        ])
    ]
}
