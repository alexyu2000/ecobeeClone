//
//  InstallationNavController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 24/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class InstallationNavController: UITableViewController {
    
    let cellId = "cellId"
    
    var products = [Product]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupNavBar()
        
        tableView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        
        fetchProduct()
    }
    
    /* actually the feathProduct should get the product list from teh serve ??? */
    func fetchProduct() {
        
        //let product = Product()
        
        products += [Product(name: "ecobee3", profileImageUrl: "ecobee3_profile")]
        products += [Product(name: "ecobee3 Lite", profileImageUrl: "ecobee3_lite_profile")]
      
        //this will crash because of background thread, so lets use dispatch_async to fix
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        
        let product = products[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.textLabel?.text = product.name
        cell.textLabel?.textColor = UIColor.green
        cell.textLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 28)
        cell.profileImageView.image = UIImage(named: product.profileImageUrl!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = self.products[indexPath.row]
        self.showInstructionControllerForProduct(product: product)
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
        titleLabel.text = "Select Your Thermostat"
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
        separatorLineView.widthAnchor.constraint(equalToConstant: titleView.frame.width).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLineView.clipsToBounds = true
        
        let instructionLabel = UILabel()
        titleView.addSubview(instructionLabel)
        instructionLabel.text = "Select the thermostat you are installing to see custom installation steps."
        instructionLabel.numberOfLines = 0
        instructionLabel.font = UIFont (name: "HelveticaNeue", size: 14)
        instructionLabel.textAlignment = .left
        instructionLabel.backgroundColor = UIColor.black
        instructionLabel.textColor = UIColor.white
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        // need x,y,width & height anchors
        instructionLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true
        instructionLabel.centerYAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 40).isActive = true
        instructionLabel.widthAnchor.constraint(equalToConstant: titleView.frame.width).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: titleView.frame.height).isActive = true
        
        self.navigationItem.titleView = titleView

    }
    
    func showInstructionControllerForProduct(product: Product) {
        let instructionController = InstructionController()
        instructionController.product = product
        instructionController.installationNavController = self
        self.navigationController?.pushViewController(instructionController, animated: true)
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
