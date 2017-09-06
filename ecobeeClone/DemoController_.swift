//
//  DemoController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 31/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit

class DemoController: UIViewController {

    let sliderContainerView = UIView()
    var localSliderView = PRGRoundSlider()
    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupNavBar()
        setupContainerView()
        setupToolbar()
    }

    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupNavBar() {
        
        let titleView = UIView()
        
        if let width = self.navigationController?.navigationBar.frame.width {
            titleView.frame = CGRect(x:0, y:0, width:width, height: 40)
        }
        
        titleView.backgroundColor = UIColor.clear
        
        let titleLabel = UILabel()
        titleView.addSubview(titleLabel)
        titleLabel.text = "main floor"
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
        
        self.navigationItem.titleView = titleView
    }

    
    func setupContainerView() {
        self.view = sliderContainerView
        sliderContainerView.backgroundColor = UIColor.black
        DispatchQueue.main.async {
            self.setupSliderProgrammatically()
        }

    }

    func setupSliderProgrammatically(){
        let sliderView = PRGRoundSlider(
            frame: sliderContainerView.bounds,
            value: 0.5,
            strokeColor: SliderKit.darkBlueColor,
            strokeWidth: 3,
            gradientColor: SliderKit.darkBlueColor,
            startAngle: 210,
            endAngle: -30,
            startText: "0.0F°",
            endText: "99.0F°")
        { (value) in
            return "\(Double(round(value*100)))F°"
        }
        
        sliderContainerView.addSubview(sliderView)
        
        sliderContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))

        sliderView.backgroundColor = UIColor.clear
        localSliderView = sliderView
        
        // Need x, y, width and height constraints
        sliderContainerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        sliderContainerView.topAnchor.constraint(equalTo: (self.navigationItem.titleView?.bottomAnchor)!, constant: 12).isActive = true
        sliderContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        sliderContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sliderContainerView.translatesAutoresizingMaskIntoConstraints = false
        sliderContainerView.backgroundColor = UIColor.red
        
    }
    
    private var myToolbar: UIToolbar!
    
    func setupToolbar() {
        // make uitoolbar instance
        myToolbar = UIToolbar(frame: CGRect(x: 0, y: screenSize.height - 44, width: screenSize.width, height: 40.0))
        
        // set the position of the toolbar
        myToolbar.layer.position = CGPoint(x: screenSize.width/2, y: screenSize.height-20.0)
        // set the color of the toolbar
        myToolbar.barStyle = .blackTranslucent
        myToolbar.tintColor = UIColor.white
        myToolbar.backgroundColor = UIColor.black
        
        // make a button
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Green", style:.plain, target: self, action: #selector(onClickBarButton))
        myUIBarButtonGreen.tag = 1
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Blue", style:.plain, target: self, action: #selector(onClickBarButton))
        myUIBarButtonBlue.tag = 2
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Red", style:.plain, target: self, action: #selector(onClickBarButton))
        myUIBarButtonRed.tag = 3
        
        // add the buttons on the toolbar
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]
        myToolbar.translatesAutoresizingMaskIntoConstraints = false
        
        // add the toolbar to the view.
        sliderContainerView.addSubview(myToolbar)

    }
    
    // called when UIBarButtonItem is clicked.
    @objc private func onClickBarButton(sender: UIBarButtonItem) {
        
        switch sender.tag {
        case 1:
            localSliderView.backgroundColor = UIColor.green
        case 2:
            localSliderView.backgroundColor = UIColor.blue
        case 3:
            localSliderView.backgroundColor = UIColor.red
        default:
            print("ERROR!!")
        }
    }
    
    
    func handleTap() {
        //print("handleTap")
        //print(localSliderView.value)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        //print("touchesMoved")
        print("\(Double(round(localSliderView.value*100)))F°")
    }

}
