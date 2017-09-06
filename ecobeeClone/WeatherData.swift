//
//  WeatherData.swift
//  ecobeeClone
//
//  Created by Alex Yu on 10/4/2017.
//  Copyright © 2017 Alex Yu. All rights reserved.
//

import UIKit
import Alamofire

class WeatherDataModel {
    
    private var _date: Double?
    private var _temp: String?
    private var _location: String?
    private var _weather: String?
//    private var _id: String?
    
    typealias JSONStandard = Dictionary<String, AnyObject>
    
    //let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Portland&appid=a7bbbd5e82c675f805e7ae084f742024")!
    
    let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=HongKong&appid=6a4614a8c99fe4775c9ba8e4fffe533c")!
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let date = Date(timeIntervalSince1970: _date!)
        return (_date != nil) ? "Today, \(dateFormatter.string(from: date))" : "Date Invalid"
    }
    
    var temp: String {
        return _temp ?? "0 °C"
    }
    
    var location: String {
        return _location ?? "Location Invalid"
    }
    
    var weather: String {
        return _weather ?? "Weather Invalid"
    }
    
//    var id: String {
//        return _id ?? "Id Invalid"
//    }
    
    func downloadData(completed: @escaping ()-> ()) {
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            if let dict = result.value as? JSONStandard, let main = dict["main"] as? JSONStandard, let temp = main["temp"] as? Double, let weatherArray = dict["weather"] as? [JSONStandard], let weather = weatherArray[0]["main"] as? String, let name = dict["name"] as? String, let sys = dict["sys"] as? JSONStandard, let country = sys["country"] as? String, let dt = dict["dt"] as? Double {
                
                self._temp = String(format: "%.0f °C", temp - 273.15)
                self._weather = weather
                self._location = "\(name), \(country)"
                self._date = dt
                //self._id = id
            }
            
            print("_temp is \(String(describing: self._temp))")
            print("_weather is \(String(describing: self._weather))")
            print("_location is \(String(describing: self._location))")
            print("_date is \(String(describing: self._date))")
            
            completed()
        })
    }

}
