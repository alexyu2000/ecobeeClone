//
//  ProductCell.swift
//  ecobeeClone
//
//  Created by Alex Yu on 24/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont (name: "HelveticaNeue-Light", size: 18)
//        label.textColor = UIColor.green
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        
        //ios 9 constraint anchors
        //need x,y,width,height anchors
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //need x,y,width,height anchors
        //profileImageView.leftAnchor.constraint(equalTo: (textLabel?.rightAnchor)!, constant: 8).isActive = true
        profileImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
