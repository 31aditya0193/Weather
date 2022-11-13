//
//  DashboardView.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel = WeatherViewModel()

    var body: some View {
        VStack {
            Text(weatherViewModel.weather?.name ?? "")
            Text(weatherViewModel.weather?.name ?? "")
            Text("\(weatherViewModel.weather?.main.feelsLike ?? 0.0)")
            Button {
                weatherViewModel.getWeather(for: "lucknow")
            } label: {
                Text("Dab Dab")
            }
        }
    }
}
