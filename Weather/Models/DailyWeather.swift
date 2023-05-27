//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Pritesh Singhvi on 20.06.2022.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = []
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
