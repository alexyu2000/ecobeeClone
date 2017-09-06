//
//  MenuItem.swift
//  ecobeeClone
//
//  Created by Alex Yu on 5/4/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class MenuItem {
    var name: String?
    var menuItemImageUrl: String?
    var menuStatus: String?
    init(){}
    
    init(name:String, menuItemImageUrl:String, menuStatus:String){
        self.name = name
        self.menuItemImageUrl = menuItemImageUrl
        self.menuStatus = menuStatus
    }
}
