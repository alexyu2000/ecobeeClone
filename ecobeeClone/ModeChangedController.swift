//
//  ModeChangedController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 3/4/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class ModeChangedController: UIViewController {
    
    var modeSelected : Int = 0
    var demoController: DemoController?
    
    let dropDownMenuView: HADropDown = {
        let haDropDown = HADropDown()
        haDropDown.items = ["Heat", "Cool", "Auto", "Aux", "Off"]
        haDropDown.title = "Please select a mode."
        haDropDown.titleColor = UIColor.white
        haDropDown.itemTextColor = UIColor.white
        haDropDown.itemBackground = UIColor.black
        haDropDown.tintColor = UIColor.black
        haDropDown.translatesAutoresizingMaskIntoConstraints = false
        return haDropDown
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(dropDownMenuView)
        dropDownMenuView.delegate = self
        setupDropDownMenu()
    }
    
    func setupDropDownMenu() {
        // Need x, y, width and height constraints
        dropDownMenuView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dropDownMenuView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        dropDownMenuView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        dropDownMenuView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

extension ModeChangedController: HADropDownDelegate {
    func didSelectItem(dropDown: HADropDown, at index: Int) {
        modeSelected = index
        //print("Item selected at index \(index)")
        
        dismiss(animated: true) { 
            if (self.modeSelected == 0) {
                self.demoController?.operatingModeImageView.image = UIImage(named: "fire")
            } else if self.modeSelected == 1 {
                self.demoController?.operatingModeImageView.image = UIImage(named: "snowflake")
            } else if self.modeSelected == 2 {
                self.demoController?.operatingModeImageView.image = UIImage(named: "fire")
            } else if self.modeSelected == 3 {
                self.demoController?.operatingModeImageView.image = UIImage(named: "aux")
            } else {
                self.demoController?.operatingModeImageView.image = UIImage(named: "off")
            }
        }
        //dismiss(animated: true, completion: nil)
        
    }
}
