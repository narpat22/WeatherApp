//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Pritesh Singhvi on 20.06.2022.
//

import Foundation

enum Icons: String, CaseIterable {
    case oneDay = "01d"
    case oneNight = "01n"
    
    case twoDay = "02d"
    case twoNight = "02n"
    
    case threeDay = "03d"
    case threeNight = "03n"
    
    case fourDay = "04d"
    case fourNight = "04n"
    
    case nineDay = "09d"
    case nineNight = "09n"
    
    case tenDay = "10d"
    case tenNight = "10n"
    
    case elevenDay = "11d"
    case elevenNight = "11n"
    
    case thirteenDay = "13d"
    case thirteenNight = "13n"
    
    case fiftyDay = "50d"
    case fiftyNight = "50n"
}

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [DailyWeather]
    
    ///creates instances for each hour weather data (23 hours)
    ///creates instances for each day weather data (8 days)
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: Weather(),
                               hourly: WeatherData().getHourlyWeather(),
                               daily: WeatherData().getDailyWeather())
    }
}

class WeatherData {
    let default_dt = 1683484200
    func getHourlyWeather() -> [Weather] {
        var hourlyWeather = [Weather]()
        for index in 0..<24 {
            var weather = Weather()
            let weatherDetail = WeatherDetail(main: "",
                                              description: "",
                                              icon: getIconName(for: index - 1))
            weather.weather.append(weatherDetail)
            weather.dt = default_dt + (index * 3600)
            weather.temp = Double.random(in: 0...30)
            hourlyWeather.append(weather)
        }
        return hourlyWeather
    }
    
    func getIconName(for index: Int) -> String {
        let iconNames = Icons.allCases
        return iconNames.indices.contains(index) ?
        iconNames[index].rawValue : iconNames.first?.rawValue ?? ""
    }
    
    func getDailyWeather() -> [DailyWeather] {
        var dailyWeather = [DailyWeather]()
        for index in 0..<7 {
            var weather = DailyWeather()
            let weatherDetail = WeatherDetail(main: "",
                                              description: "",
                                              icon: getIconName(for: Int.random(in: 0...17)))
            weather.weather.append(weatherDetail)
            weather.dt = default_dt + (index * 86400)
            weather.temp = Temperature(min: Double.random(in: 0...30),
                                       max: Double.random(in: 0...30))
            dailyWeather.append(weather)
        }
        return dailyWeather
    }
}
