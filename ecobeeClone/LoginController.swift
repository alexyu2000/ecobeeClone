//
//  LoginController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 29/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupNavBar()
        setupContainerView()
    }

    func setupNavBar() {
        
        let titleView = UIView()
        
        if let width = self.navigationController?.navigationBar.frame.width {
            titleView.frame = CGRect(x:0, y:0, width:width, height: 40)
        }
        
        titleView.backgroundColor = UIColor.black
        
        let titleLabel = UILabel()
        titleView.addSubview(titleLabel)
        titleLabel.text = "Login"
        titleLabel.font = UIFont (name: "HelveticaNeue", size: 18)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.black
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
        
        self.navigationItem.titleView = titleView
    }

    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(r:210, g: 210, b: 210)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ecobee_BW_Icon")
        return imageView
    }()
    
    let backgroundLabelView: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.black
        labelView.textColor = UIColor.white
        labelView.font = UIFont.boldSystemFont(ofSize: 32)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "ecobee Clone"
        return labelView
    }()

    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string:" Email", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        let myColor : UIColor = UIColor.white
        tf.layer.borderColor = myColor.cgColor
        tf.layer.borderWidth = 1
        tf.textColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string:" Password", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        let myColor : UIColor = UIColor.white
        tf.layer.borderColor = myColor.cgColor
        tf.layer.borderWidth = 1
        tf.textColor = UIColor.white
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:114, g: 157, b: 73)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 18)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var promptButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.titleLabel!.lineBreakMode = .byWordWrapping
        button.titleLabel!.textAlignment = .center
        button.setTitle("Don't have an account?\nTap to install or register your ecobee", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 12)
        
        button.addTarget(self, action: #selector(handleReturn), for: .touchUpInside)
        return button
    }()
    
    lazy var demoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.setTitle("Try Our Demo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont (name: "HelveticaNeue-UltraLight", size: 18)
        button.addTarget(self, action: #selector(handleDemo), for: .touchUpInside)
        return button
    }()

    func handleDemo() {
//        let demoController = DemoController()
//        let navController = UINavigationController(rootViewController: demoController)
//        navController.modalPresentationStyle = .custom
//        navController.modalTransitionStyle = .crossDissolve
//        present(navController, animated: true, completion: nil)
        
        let demoController = CustomTabBarController()
        let navController = UINavigationController(rootViewController: demoController)
        navController.modalPresentationStyle = .custom
        navController.modalTransitionStyle = .crossDissolve
        present(navController, animated: true, completion: nil)
    }
    
    func handleReturn() {
        print("handleReturn")
        dismiss(animated: true, completion: nil)
    }
    
    func handleLogin() {
        print("handleLogin")
        if emailTextField.text == "" {
            let myColor : UIColor = UIColor.orange
            emailTextField.layer.borderColor = myColor.cgColor
        }
        if passwordTextField.text == "" {
            let myColor : UIColor = UIColor.orange
            passwordTextField.layer.borderColor = myColor.cgColor
        }
        
        let credentialData = "\(String(describing: emailTextField.text)):\(String(describing: passwordTextField.text))".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request("https://www.azitainno.com/v1.0.2/user_management/1",
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                if response.result.value != nil{
                    print(response)
                    return
                }else{
                    print("no reponse at all!!!!")
                }
        }
    }
    
    func setupBackgroundImageView() {
        // Need x, y, width and height constraints
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        backgroundImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupBackgroundLabelView() {
        // Need x, y, width and height constraints
        backgroundLabelView.leftAnchor.constraint(equalTo: backgroundImageView.rightAnchor, constant: 12).isActive = true
        backgroundLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        backgroundLabelView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        backgroundLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupEmailTextField() {
        // Need x, y, width and height constraints
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 72).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupPasswordTextField() {
        // Need x, y, width and height constraints
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupLoginButton() {
        // Need x, y, width and height constraints
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupPromptButton() {
        // Need x, y, width and height constraints
        promptButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        promptButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        promptButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        promptButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupDemoButton() {
        // Need x, y, width and height constraints
        demoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        demoButton.topAnchor.constraint(equalTo: promptButton.bottomAnchor, constant: 110).isActive = true
        demoButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        demoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    
    func setupContainerView() {
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(backgroundLabelView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(promptButton)
        self.view.addSubview(demoButton)
        
        setupBackgroundImageView()
        setupBackgroundLabelView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupPromptButton()
        setupDemoButton()
    }
    
}
