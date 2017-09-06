//
//  InstructionController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 27/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class InstructionController: UIViewController, UINavigationControllerDelegate {

    var installationNavController: InstallationNavController?
    
    var product: Product? {
        didSet {

            self.navigationItem.title = product?.name
            let navigationBarAppearace = UINavigationBar.appearance()
            navigationBarAppearace.backgroundColor = UIColor.clear
        }
    }

    func setupNavBarWithProduct(product: Product) {
        
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        titleView.backgroundColor = UIColor.clear
    
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(containerView)

        let productNameLabel = UILabel()
        containerView.addSubview(productNameLabel)
        productNameLabel.text = product.name
        productNameLabel.font = UIFont (name: "HelveticaNeue", size: 18)
        productNameLabel.textAlignment = .center
        productNameLabel.backgroundColor = UIColor.clear
        productNameLabel.textColor = UIColor.white
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false

        // Constraint anchors
        productNameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        productNameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        productNameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        productNameLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true

        self.navigationItem.titleView = titleView
    }
    
    func setupWebView() {
    
        //view.backgroundColor = UIColor.red
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -24).isActive = true
        //containerView.backgroundColor = UIColor.blue
        
        print(view.frame.width, view.frame.height)
        
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width-24, height: self.view.frame.height-64))
        if let pdf = Bundle.main.url(forResource: "ecoBeeClone", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webView.loadRequest(req as URLRequest)
            containerView.addSubview(webView)
        }
        
        let completeInstallationButton = UIButton()
        containerView.addSubview(completeInstallationButton)
        
        completeInstallationButton.backgroundColor = UIColor.green
        completeInstallationButton.setTitle("Complete Installation", for: .normal)
        completeInstallationButton.translatesAutoresizingMaskIntoConstraints = false
        completeInstallationButton.setTitleColor(UIColor.white, for: .normal)
        completeInstallationButton.titleLabel?.font = UIFont (name: "HelveticaNeue", size: 18)
        completeInstallationButton.addTarget(self, action: #selector(handleCompleteInstallation), for: .touchUpInside)
        completeInstallationButton.layer.cornerRadius = 5
        completeInstallationButton.layer.masksToBounds = true
        
        // Need x, y, width and height constraints
        completeInstallationButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        completeInstallationButton.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 4).isActive = true
        completeInstallationButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        completeInstallationButton.heightAnchor.constraint(equalToConstant: 36).isActive = true

    }

    func handleCompleteInstallation() {
        print("handleCompleteInstallation")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        setupNavBarWithProduct(product: product!)
        setupWebView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
