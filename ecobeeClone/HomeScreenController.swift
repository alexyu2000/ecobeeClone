//
//  HomeScreenController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 23/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController {

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

    lazy var installationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:114, g: 157, b: 73)
        button.setTitle("Install your thermostat", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleInstallation), for: .touchUpInside)
        return button
    }()

    lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:114, g: 157, b: 73)
        button.setTitle("Register your thermostat", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    let loginLabelView: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.clear
        labelView.textColor = UIColor.white
        labelView.font = UIFont (name: "HelveticaNeue-Light", size: 18)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Already part of the hive?"
        labelView.textAlignment = .center
        return labelView
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 18)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
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


    func handleInstallation() {
        //print("handleInstallation")
        let installationNavController = InstallationNavController()
        let navController = UINavigationController(rootViewController: installationNavController)
        present(navController, animated: true, completion: nil)
        
//        let installationNavController = InstallationNavController()
//        //self.dismiss(animated: true, completion: nil)
//        present(installationNavController, animated: true, completion: nil)
        
    }
    
    func handleRegistration() {
        let registrationController = RegistrationController()
        let navController = UINavigationController(rootViewController: registrationController)
        present(navController, animated: true, completion: nil)
    }
    
    func handleLogin() {
        let loginController = LoginController()
        let navController = UINavigationController(rootViewController: loginController)
        navController.modalPresentationStyle = .custom
        navController.modalTransitionStyle = .crossDissolve
        present(navController, animated: true, completion: nil)
    }
    
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
    
    func setupInstallationButton() {
        // Need x, y, width and height constraints
        installationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        installationButton.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 72).isActive = true
        installationButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        installationButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupRegistrationButton() {
        // Need x, y, width and height constraints
        registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        registrationButton.topAnchor.constraint(equalTo: installationButton.bottomAnchor, constant: 30).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupLoginLabelView() {
        // Need x, y, width and height constraints
        loginLabelView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        loginLabelView.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 144).isActive = true
        loginLabelView.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        loginLabelView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupLoginButton() {
        // Need x, y, width and height constraints
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginLabelView.bottomAnchor, constant: 20).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupDemoButton() {
        // Need x, y, width and height constraints
        demoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        demoButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        demoButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 24).isActive = true
        demoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(backgroundLabelView)
        self.view.addSubview(installationButton)
        self.view.addSubview(registrationButton)
        self.view.addSubview(loginLabelView)
        self.view.addSubview(loginButton)
        self.view.addSubview(demoButton)
        
        setupBackgroundImageView()
        setupBackgroundLabelView()
        setupInstallationButton()
        setupRegistrationButton()
        setupLoginLabelView()
        setupLoginButton()
        setupDemoButton()
    }

}
