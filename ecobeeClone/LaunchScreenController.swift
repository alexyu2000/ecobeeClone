//
//  LaunchScreenController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 23/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
    
    var counter = 0
    var timer = Timer()

    let LauncherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(r:114, g: 157, b: 73)
        imageView.layer.cornerRadius = 300
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ecobee_Green_Icon")
        return imageView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(r:114, g: 157, b: 73)

        setupViews()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
        timer.fire()
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.LauncherIconImageView.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            
            //Once the label is completely invisible, set the text and fade it back in
            //self.myLabel.text = "your Text "
            
            // Fade in
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
                self.LauncherIconImageView.alpha = 1.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                //self.myLabel.text = "your Text "
                
                // Fade in
                UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
                    self.LauncherIconImageView.alpha = 1.0
                }, completion:nil )
                
            })
        })
    }

    func animate() {
        self.counter += 1
        if counter > 3 {
            let homeScreenController = HomeScreenController()
            self.dismiss(animated: true, completion: nil)
            present(homeScreenController, animated: true, completion: nil)
            //self.navigationController?.pushViewController(homeScreenController, animated: true)
            timer.invalidate()
        }
    }
    
    func setupViews() {
        self.view.addSubview(LauncherIconImageView)
        self.view.addConstraintsWithFormat("H:|-80-[v0]-80-|", views: LauncherIconImageView)
        self.view.addConstraintsWithFormat("V:|-80-[v0]-80-|", views: LauncherIconImageView)
    }
}

