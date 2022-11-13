//
//  DashboardView.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .orange],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                InfoView(weatherViewModel: weatherViewModel)
            }
            .onAppear {
                weatherViewModel.getWeather(for: "London")
            }
            .navigationTitle(Text(Date.now, format: .dateTime.weekday().day().month()))
        }
    }
}

struct InfoView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel
    var body: some View {
        GeometryReader { proxy in
            VStack {
                WeatherIconView()
                    .frame(height: proxy.size.height * 0.5)
                    .padding(10)
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(weatherViewModel.weather.first?.name ?? "...")
                            .font(.system(size: 24))
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
                        
                        Text("\(weatherViewModel.weather.first?.main.temp ?? 0.0, specifier: "%.0f")°")
                            .font(.system(size: 72))
                        
                        Spacer()
                        
                        HStack {
                            Label("\(weatherViewModel.weather.first?.main.tempMax ?? 0.0, specifier: "%.0f")°",
                                  systemImage: "chevron.up")
                            Label("\(weatherViewModel.weather.first?.main.tempMin ?? 0.0, specifier: "%.0f")°",
                                  systemImage: "chevron.down")
                        }
                        
                        Spacer()
                        
                        Text(weatherViewModel.weather.first?.weather[0].main ?? "...")
                        Text("Feels like \(weatherViewModel.weather.first?.main.feelsLike ?? 0.0, specifier: "%.0f")°")
                    }
                    .frame(height: proxy.size.width * 0.5)
                    .padding(10)
                    .padding(.trailing, 20)
                }
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
                .frame(width: proxy.size.width / 2, height: proxy.size.height / 2, alignment: .trailing)
        }
    }
}
