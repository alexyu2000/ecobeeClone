//
//  Product.swift
//  ecobeeClone
//
//  Created by Alex Yu on 24/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class Product: NSObject {
    var name: String?
    var profileImageUrl: String?
    
    override init(){}
    
    init(name:String, profileImageUrl:String){
        self.name = name
        self.profileImageUrl = profileImageUrl
    }

}
