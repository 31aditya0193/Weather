//
//  Models.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import Foundation

// MARK: - Welcome
struct WeatherResponse: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherReport]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var sys: Sys

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherReport: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }

    struct Sys: Codable {
        var country: String
    }

}

extension WeatherResponse.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
