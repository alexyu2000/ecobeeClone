//
//  CustomTabBarController.swift
//  fbMessenger
//
//  Created by Brian Voong on 4/14/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var mainMenuController = UIViewController()
    var weatherController = UIViewController()
    var quickChangeController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        //setup our custom view controllers
        let demoController = DemoController()

        let navController = UINavigationController(rootViewController: demoController)
        navController.tabBarItem.title = "Thermostat"
        navController.tabBarItem.image = UIImage(named: "thermostat")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green

        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.barTintColor = UIColor.black
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        self.title = "main floor"
        
        let layout = UICollectionViewFlowLayout()
        let mainMenu = MainMenuController(collectionViewLayout: layout)
        let mainMenuBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menu"))
        mainMenu.tabBarItem = mainMenuBarItem
        mainMenuController = mainMenu

        let weather = WeatherController()
        let weatherMenuBarItem = UITabBarItem(title: "Weather", image: UIImage(named: "weather"), selectedImage: UIImage(named: "weather"))
        weather.tabBarItem = weatherMenuBarItem
        weatherController = weather
        
        let quickChange = QuickChangeController()
        let quickChangeMenuBarItem = UITabBarItem(title: "QuickChange", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
        quickChange.tabBarItem = quickChangeMenuBarItem
        quickChangeController = quickChange

        viewControllers = [navController, createDummyNavControllerWithTitle("Menu", imageName: "menu"), createDummyNavControllerWithTitle("Weather", imageName: "weather"), createDummyNavControllerWithTitle("QuickChange", imageName: "settings")]

    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func createDummyNavControllerWithTitle(_ title: String, imageName: String) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 1 {
            viewControllers?[tabBarIndex] = mainMenuController
            self.title = "Main Menu"
        } else if tabBarIndex == 2 {
            viewControllers?[tabBarIndex] = weatherController
            self.title = "Weather"
        } else if tabBarIndex == 3 {
            viewControllers?[tabBarIndex] = quickChangeController
            self.title = "Quick Change"
        }
        //print(tabBarController.selectedIndex)
    }
}
