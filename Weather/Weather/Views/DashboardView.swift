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
        ZStack {
            LinearGradient(colors: [.white, .yellow],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                InfoView(weatherViewModel: weatherViewModel)
                HourlyForecastView()
                DailyForecaseView()
            }
            .navigationTitle(Text(Date.now, format: .dateTime.weekday().day().month()))
        }
    }
}

struct InfoView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel
    var body: some View {
        GeometryReader { proxy in
            HStack {
                VStack(alignment: .leading) {
                    Text(weatherViewModel.weather?.name ?? "Agra")
                        .font(.system(size: 36))
                        .gesture(
                            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onEnded({ value in
                                    if value.translation.width < 0 {
                                        print("Swiped left")
                                    }
                                    
                                    if value.translation.width > 0 {
                                        print("Swiped right")
                                    }
                                })
                        )
                    
                    Text("\(weatherViewModel.weather?.main.temp ?? 0.0, specifier: "%.0f")°")
                        .font(.system(size: 18))
                    
                    Spacer()
                    
                    HStack {
                        Label("\(weatherViewModel.weather?.main.tempMax ?? 0.0, specifier: "%.0f")°",
                              systemImage: "chevron.up")
                        Label("\(weatherViewModel.weather?.main.tempMax ?? 0.0, specifier: "%.0f")°",
                              systemImage: "chevron.down")
                    }
                    
                    Spacer()
                    
                    Text("\(weatherViewModel.weather?.main.feelsLike ?? 0.0, specifier: "%.0f")°")
                    Text("Feels like \(weatherViewModel.weather?.main.feelsLike ?? 0.0, specifier: "%.0f")°")
                }
                .frame(width: proxy.size.width * 0.5)
                WeatherIconView()
                    .frame(width: proxy.size.width * 0.5)
            }
        }
    }
}

struct WeatherIconView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(systemName: "sun.max")
                .resizable()
                .scaledToFill()
                .offset(x: proxy.size.width * 0.2, y: 0)
        }
    }
}

struct HourlyForecastView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) { i in
                    VStack {
                        Text("Item \(i)")
                        Text("Item \(i)")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(5)
                }
            }
        }
    }
}

struct DailyForecaseView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(11..<20) { i in
                    HStack {
                        Text("Item \(i)")
                        Label("Some", systemImage: "sun.max")
                        Text("Item \(i)")
                        Text("Item \(i)")
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
