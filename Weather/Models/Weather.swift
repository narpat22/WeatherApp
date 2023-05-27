//
//  Weather.swift
//  WeatherApp
//
//  Created by Pritesh Singhvi on 20.06.2022.
//

import Foundation
import UIKit


struct Weather: Codable, Identifiable {
    
    var dt: Int ///date
    var temp : Double
    var feels_like: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case feels_like
        case pressure
        case humidity
        case dew_point
        case clouds
        case wind_speed
        case wind_deg
        case weather
    }
    
    init() {
        dt = 1687844720
        temp = Double.random(in: 0...30)
        feels_like = 306.18
        pressure = 1011
        humidity = 86
        dew_point = 40
        clouds = 40
        wind_speed = 12.78
        wind_deg = 360
//        weather = [WeatherDetail(main: "Clear", description: "clear sky", icon: "11d")]
        weather = []
    }
}

///id is not passed as a parameter and instead is made as a computed property
///that way swift knows that while decoding that there's no need to decode the ID cause it is a COMPUTED PROPERTY
extension Weather {
    var id: UUID {
        return UUID()
    }
}


