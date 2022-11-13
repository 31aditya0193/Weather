//
//  WeatherService.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import Foundation
import Combine

class WeatherService {
    func getCurrentWeather(for cityName: String, completion: @escaping (WeatherResponse) -> ()) {
        guard let urlRequest = prepareURL(for: cityName) else {
            fatalError("Couldn't prepare URL")
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest.url!) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                    completion(response)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }

    func prepareURL(for cityName: String) -> URLComponents? {
        guard cityName != "" else {
            return nil
        }
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "appid", value: "1e64ec65233345900b593cf16d21f1e5"),
            URLQueryItem(name: "units", value: "metric")
        ]
        return components
    }
}
