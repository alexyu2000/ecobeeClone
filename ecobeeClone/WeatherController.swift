//
//  WeatherController.swift
//  ecobeeClone
//
//  Created by Alex Yu on 4/4/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit
import Alamofire

class WeatherController: UIViewController {

    var weather = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupNavBar()
        setupContainerView()
        
        weather.downloadData {
            self.updateUI()
        }
    }
    
    func setupNavBar() {
        
        let titleView = UIView()
        
        if let width = self.navigationController?.navigationBar.frame.width {
            titleView.frame = CGRect(x:0, y:0, width:width, height: 40)
        }
        
        titleView.backgroundColor = UIColor.black
        
        let titleLabel = UILabel()
        titleView.addSubview(titleLabel)
        titleLabel.text = "Weather"
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
    
    let dateLabel: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.black
        labelView.textColor = UIColor.white
        labelView.font = UIFont.boldSystemFont(ofSize: 16)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Today, 15 November 2017"
        labelView.textAlignment = .center
        return labelView
    }()
    
    let tempLabel: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.black
        labelView.textColor = UIColor.white
        labelView.font = UIFont.boldSystemFont(ofSize: 64)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "17°C"
        labelView.textAlignment = .center
        return labelView
    }()

    let locationLabel: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.black
        labelView.textColor = UIColor.white
        labelView.font = UIFont.boldSystemFont(ofSize: 32)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Hong Kong"
        labelView.textAlignment = .center
        return labelView
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    let weatherLabel: UILabel = {
        let labelView = UILabel()
        labelView.backgroundColor = UIColor.black
        labelView.textColor = UIColor.white
        labelView.font = UIFont.boldSystemFont(ofSize: 32)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Clouds"
        labelView.textAlignment = .center
        return labelView
    }()
    
    func setupDataLabel() {
        // Need x, y, width and height constraints
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTempLabel() {
        tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30).isActive = true
        tempLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLocationLabel() {
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 30).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupWeatherImage() {
        weatherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherImage.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 30).isActive = true
        weatherImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupWeatherLabel() {
        weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 30).isActive = true
        weatherLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        weatherLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func updateUI() {
        dateLabel.text = weather.date
        tempLabel.text = "\(weather.temp)"
        locationLabel.text = weather.location
        weatherLabel.text = weather.weather
        weatherImage.image = UIImage(named: weather.weather.lowercased())
        print(weather.weather)
    }
        
    func setupContainerView() {
        self.view.addSubview(dateLabel)
        self.view.addSubview(tempLabel)
        self.view.addSubview(locationLabel)
        self.view.addSubview(weatherImage)
        self.view.addSubview(weatherLabel)
        
        setupDataLabel()
        setupTempLabel()
        setupLocationLabel()
        setupWeatherImage()
        setupWeatherLabel()
    }


}
