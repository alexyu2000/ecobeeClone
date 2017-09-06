//
//  DemoController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 31/3/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit
import FLTickerSlider

var tickerSlider: FLTickerSlider?

var tickers = [FLSliderTick?](repeating: nil, count: 19)

class DemoController: UIViewController {

    //let sliderContainerView = UIView()
    //var localSliderView = PRGRoundSlider()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    let operatingModeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(r:210, g: 210, b: 210)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "fire")
        return imageView
    }()
    
    lazy var operatingModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        //let image = UIImage(named: "snowflake")
        //button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleModeChanged), for: .touchUpInside)
        return button
    }()

    func handleModeChanged() {
        print("handleModeChanged")
        let modeChangedController = ModeChangedController()
        modeChangedController.demoController = self
        let navController = UINavigationController(rootViewController: modeChangedController)
        navController.modalPresentationStyle = .custom
        navController.modalTransitionStyle = .crossDissolve
        
        present(navController, animated: true, completion: nil)
        
    }

    let humidityLabelView: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.black
        labelView.textColor = UIColor.white
        labelView.font = UIFont.boldSystemFont(ofSize: 14)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textAlignment = .center
        labelView.text = "33%"
        return labelView
    }()

    let measuredTemperatureLabelView: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.black
        labelView.textColor = UIColor.white
        labelView.font = UIFont.systemFont(ofSize: 120)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textAlignment = .center
        labelView.text = "74"
        return labelView
    }()

    let vSliderView: UISlider = {
        //Initialize slider as 0, then update once we have the frame properties.
        let slider = UISlider(frame: CGRect(x: 12, y: 500, width: 300, height: 30))

        //Rotate to a vertical slider
        //slider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        slider.isContinuous = false
        slider.isHidden = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    }()
    
    let fLTickerSlider: FLTickerSlider = {
        // create FLTickerSlider instance
        tickerSlider = FLTickerSlider.init(frame: CGRect(x: 12, y: 500, width: 350, height: 30))
        
        //self.view.addSubview(tickerSlider!)
        
        tickerSlider?.tintColor = UIColor.clear
        tickerSlider?.minimumTrackTintColor = UIColor.clear
        tickerSlider?.maximumTrackTintColor = UIColor.clear
        tickerSlider?.value = 0.5
        tickerSlider?.translatesAutoresizingMaskIntoConstraints = false
        
        // create shadow
        let shadow = FLSliderTick.Shadow(color: UIColor.clear,
                                         offset: CGSize(width: 0.0, height: 0.0),
                                         opacity: 0.8,
                                         radius: 2.0)

        for index in 0...8 {
            tickers[index] = FLSliderTick(offset: CGFloat((0.05 * Double(index)) + 0.05),
                                 color: UIColor.orange,
                                 shadow: shadow,
                                 width: (CGFloat(index + 2)),
                                 height: (CGFloat(index + 2)),
                                 shape: FLSliderTick.Shape.Round)

        }
        
        for index in 9...18 {
            tickers[index] = FLSliderTick(offset: CGFloat((0.05 * Double(index)) + 0.05),
                                          color: UIColor.orange,
                                          shadow: shadow,
                                          width: (CGFloat(20 - index)),
                                          height: (CGFloat(20 - index)),
                                          shape: FLSliderTick.Shape.Round)
            
        }
        
        tickerSlider?.setTickers(tickers: tickers as! Array<FLSliderTick>)
        
        tickerSlider?.addTarget(self, action: #selector(handleValueChanged), for: .valueChanged)
        
        return tickerSlider!
    }()
    
    func handleValueChanged() {
        //print(Double((fLTickerSlider.value)))
        handleFLSliderTickColor()
    }
    
    func handleFLSliderTickColor() {
        print(Double((fLTickerSlider.value)))
        
        for index in 0...18 {
            Double((fLTickerSlider.value)) > ((Double(index) * 0.05) + 0.05) ? tickers[index]?.setColor(color: UIColor.orange): tickers[index]?.setColor(color: UIColor.green)
        }
    }
    
    func sliderChanged() {
        //print(vSliderView.value)
    }
    
    
    func setupOperatingModeButton() {
        // Need x, y, width and height constraints
        operatingModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        operatingModeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        operatingModeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        operatingModeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupOperatingModeImageView() {
        // Need x, y, width and height constraints
        operatingModeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        operatingModeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        operatingModeImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        operatingModeImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupHumidityLabelView() {
        // Need x, y, width and height constraints
        humidityLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        humidityLabelView.topAnchor.constraint(equalTo: operatingModeButton.bottomAnchor, constant: 30).isActive = true
        humidityLabelView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        humidityLabelView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupMeasuredTemperatureLabelView() {
        // Need x, y, width and height constraints
        measuredTemperatureLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        measuredTemperatureLabelView.topAnchor.constraint(equalTo: humidityLabelView.bottomAnchor, constant: 16).isActive = true
        measuredTemperatureLabelView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        measuredTemperatureLabelView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupvSliderView() {
        // Need x, y, width and height constraints
        vSliderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vSliderView.topAnchor.constraint(equalTo: measuredTemperatureLabelView.bottomAnchor, constant: 12).isActive = true
        vSliderView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        vSliderView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupfLTickerSlider() {
        // Need x, y, width and height constraints
        fLTickerSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fLTickerSlider.topAnchor.constraint(equalTo: measuredTemperatureLabelView.bottomAnchor, constant: 12).isActive = true
        fLTickerSlider.widthAnchor.constraint(equalToConstant: 350).isActive = true
        fLTickerSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupNavBar()
        
        //setupContainerView()
        //setupToolbar()
        
        self.view.addSubview(operatingModeImageView)
        self.view.addSubview(operatingModeButton)
        self.view.addSubview(humidityLabelView)
        self.view.addSubview(measuredTemperatureLabelView)
        //self.view.addSubview(vSliderView)
        self.view.addSubview(fLTickerSlider)
        handleFLSliderTickColor()
 
        setupOperatingModeImageView()
        setupOperatingModeButton()
        setupHumidityLabelView()
        setupMeasuredTemperatureLabelView()
        //setupvSliderView()
        setupfLTickerSlider()
    }

    func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupNavBar() {
        
        let titleView = UIView()
        
        if let width = self.navigationController?.navigationBar.frame.width {
            titleView.frame = CGRect(x:0, y:0, width:width, height: 40)
        }
        
        titleView.backgroundColor = UIColor.black
        
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
    
}
