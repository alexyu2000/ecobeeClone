//
//  MainMenuController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 1/4/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class MainMenuController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellId = "cellId"
    var menuItems = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(MenuCell.self, forCellWithReuseIdentifier: cellId)

        setupMenu()
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.menuItem = menuItems[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = SystemControlController()
        navigationController?.pushViewController(controller, animated: true)
    }

    func setupMenu() {
        menuItems += [MenuItem(name: "System", menuItemImageUrl: "system", menuStatus: "Cool")]
        menuItems += [MenuItem(name: "Schedule", menuItemImageUrl: "schedule", menuStatus: "")]
        menuItems += [MenuItem(name: "Comfort Settings", menuItemImageUrl: "comfort", menuStatus: "")]
        menuItems += [MenuItem(name: "Vacation", menuItemImageUrl: "vacation", menuStatus: "")]
        menuItems += [MenuItem(name: "Reminders & Alerts", menuItemImageUrl: "reminder", menuStatus: "")]
        menuItems += [MenuItem(name: "About", menuItemImageUrl: "about", menuStatus: "")]
    }

}


class MenuCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            //backgroundColor = isHighlighted ? UIColor(red: 0, green: 134/255, blue: 249/255, alpha: 1) : UIColor.white
        }
    }
    
    var menuItem: MenuItem? {
        didSet {
            menuItemLabel.text = menuItem?.name
            menuImageView.image = UIImage(named: (menuItem?.menuItemImageUrl)!);
            menuStatusLabel.text = menuItem?.menuStatus
        }
    }
    
    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        //imageView.layer.cornerRadius = 34
        //imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    let menuItemLabel: UILabel = {
        let label = UILabel()
        label.text = "System"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    let menuStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Cool"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override func setupViews() {
        addSubview(menuImageView)
        addSubview(dividerLineView)
        
        setupContainerView()
        
        menuImageView.image = UIImage(named: "system")
        
        addConstraintsWithFormat("H:|-12-[v0(68)]", views: menuImageView)
        addConstraintsWithFormat("V:[v0(68)]", views: menuImageView)
        
        addConstraint(NSLayoutConstraint(item: menuImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat("H:|-12-[v0]|", views: dividerLineView)
        addConstraintsWithFormat("V:[v0(1)]|", views: dividerLineView)
    }

    fileprivate func setupContainerView() {
        let containerView = UIView()
        addSubview(containerView)
        
        addConstraintsWithFormat("H:|-90-[v0]|", views: containerView)
        addConstraintsWithFormat("V:[v0(50)]", views: containerView)
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        containerView.addSubview(menuItemLabel)
        containerView.addSubview(menuStatusLabel)
        
        containerView.addConstraintsWithFormat("H:|[v0]-12-|", views: menuItemLabel)
        
        containerView.addConstraintsWithFormat("V:|[v0][v1(24)]|", views: menuItemLabel, menuStatusLabel)
        
        containerView.addConstraintsWithFormat("H:|[v0]-12-|", views: menuStatusLabel)
        
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}
