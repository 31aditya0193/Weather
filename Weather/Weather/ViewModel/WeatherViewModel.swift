//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import Foundation

class WeatherViewModel: ObservableObject {
    let weatherService: WeatherService = WeatherService()
    @Published var weather: [WeatherResponse] = []

    func getWeather(for city: String) {
        weatherService.getCurrentWeather(for: city) { weatherResponse in
            DispatchQueue.main.async {
                self.weather.append(weatherResponse)
            }
        }
    }
}
