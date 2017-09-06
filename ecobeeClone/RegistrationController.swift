//
//  RegistrationViewController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 28/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupNavBar()
        setupRegistrationContentView()
    }

    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupNavBar() {
        print("setupNavBar")
        
        let titleView = UIView()
        
        if let width = self.navigationController?.navigationBar.frame.width {
            titleView.frame = CGRect(x:0, y:0, width:width, height: 40)
        }
        
        titleView.backgroundColor = UIColor.clear
        
        let titleLabel = UILabel()
        titleView.addSubview(titleLabel)
        titleLabel.text = "Register"
        titleLabel.font = UIFont (name: "HelveticaNeue", size: 18)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        // need x,y,width & height anchors
        titleLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: titleView.frame.width).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: titleView.frame.height).isActive = true
        titleLabel.clipsToBounds = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(separatorLineView)
        //x,y,w,h
        separatorLineView.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalToConstant: titleView.frame.width - 24).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLineView.clipsToBounds = true
        
        let instructionLabel = UILabel()
        titleView.addSubview(instructionLabel)
        instructionLabel.text = "Please enter the registration code found on your thermostat screen:"
        instructionLabel.numberOfLines = 0
        instructionLabel.font = UIFont (name: "HelveticaNeue", size: 14)
        instructionLabel.textAlignment = .left
        instructionLabel.backgroundColor = UIColor.black
        instructionLabel.textColor = UIColor.white
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        // need x,y,width & height anchors
        instructionLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true
        instructionLabel.centerYAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 40).isActive = true
        instructionLabel.widthAnchor.constraint(equalToConstant: titleView.frame.width - 24).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: titleView.frame.height).isActive = true
        
        self.navigationItem.titleView = titleView
 
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    func setupRegistrationContentView() {
        
        //view.backgroundColor = UIColor.red
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -24).isActive = true
        //containerView.backgroundColor = UIColor.blue
        
        let inputTextField = UITextField()
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(inputTextField)
        inputTextField.attributedPlaceholder = NSAttributedString(string:"Enter code here", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        inputTextField.textColor = UIColor.white

        //x,y,w,h
        inputTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        inputTextField.centerYAnchor.constraint(equalTo: containerView.topAnchor, constant: 200).isActive = true
        inputTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(separatorLineView)
        //x,y,w,h
        separatorLineView.leftAnchor.constraint(equalTo: inputTextField.leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: inputTextField.bottomAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalTo: inputTextField.widthAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        let instructionLabel = UILabel()
        containerView.addSubview(instructionLabel)
        instructionLabel.text = "If you already have an account, you can register your thermostat(s) once you login. If you do not see the registration code on your thermostat screen, simply click the menu button on the home screen followed by Registration to generate your unique code"
        instructionLabel.numberOfLines = 0
        instructionLabel.font = UIFont (name: "HelveticaNeue", size: 14)
        instructionLabel.textAlignment = .left
        instructionLabel.backgroundColor = UIColor.black
        instructionLabel.textColor = UIColor.white
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        // need x,y,width & height anchors
        instructionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        instructionLabel.topAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 20).isActive = true
        instructionLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let registrationImageView = UIImageView()
        registrationImageView.translatesAutoresizingMaskIntoConstraints = false
        registrationImageView.contentMode = .scaleAspectFill
        registrationImageView.image = UIImage(named: "ecobee3_registration")
        
        containerView.addSubview(registrationImageView)
        
        // need x,y,width & height anchors
        registrationImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        registrationImageView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 10).isActive = true
        registrationImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        registrationImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let nextButton = UIButton()
        containerView.addSubview(nextButton)
        
        nextButton.backgroundColor = UIColor.green
        nextButton.setTitle("Next", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont (name: "HelveticaNeue", size: 18)
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        nextButton.layer.cornerRadius = 5
        nextButton.layer.masksToBounds = true
        
        // Need x, y, width and height constraints
        nextButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: registrationImageView.bottomAnchor, constant: 160).isActive = true
        nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func handleNextButton() {
        print("handleNextButton")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
