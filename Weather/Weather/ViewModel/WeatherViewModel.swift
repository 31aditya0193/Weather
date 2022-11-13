//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import Foundation

class WeatherViewModel: ObservableObject {
    let weatherService: WeatherService = WeatherService()
    @Published var weather: [WeatherResponse]? = nil
    var cities: [String] = []

    func getWeather(for city: String) {
        weatherService.getCurrentWeather(for: city) { weatherResponse in
            DispatchQueue.main.async { [weak self] in
                if self?.weather == nil || self?.weather?.count == 0 {
                    self?.weather = [weatherResponse]
                } else {
                    self?.weather!.append(weatherResponse)
                }
                self?.cities.append(city)
            }
        }
    }
}
