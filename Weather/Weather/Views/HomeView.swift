//
//  ContentView.swift
//  Weather
//
//  Created by Aditya Mishra on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    @State private var showDashboard = false
    @State private var isCelcius = true
    var body: some View {
        NavigationView {
            ContainerView(showDashboard: $showDashboard, weatherViewModel: weatherViewModel)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HamburgerButton(tapped: $showDashboard)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ScaleSwitchButton(isCelcius: $isCelcius,
                                          isDashboard: $showDashboard)
                    }
                }
        }
    }
}

struct ContainerView: View {
    @Binding var showDashboard: Bool
    @ObservedObject var weatherViewModel: WeatherViewModel
    var body: some View {
        ZStack {
            if showDashboard {
                DashboardView(weatherViewModel: weatherViewModel)
                    .transition(.asymmetric(insertion: .move(edge: .leading),
                                            removal: .move(edge: .trailing)))
            } else {
                CityListView(weatherViewModel: weatherViewModel)
                    .transition(.asymmetric(insertion: .move(edge: .trailing),
                                            removal: .move(edge: .leading)))
            }
        }
    }
}

struct HamburgerButton: View {
    @Binding var tapped: Bool
    var body: some View {
        Button(action: {
            withAnimation {
                tapped.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .rotationEffect(.degrees(tapped ? 0 : 90))
        }
    }
}

struct ScaleSwitchButton: View {
    @Binding var isCelcius: Bool
    @Binding var isDashboard: Bool
    var body: some View {
        ZStack {
            if isDashboard {
                Button(action: {
                    withAnimation {
                        isCelcius.toggle()
                    }
                }) {
                    Text(isCelcius ? "°C" : "°F")
                        .fontWeight(.bold)
                }
            } else {
                Button(action: {
                        print("Will Trigger City Adding")
                }) {
                    Text("+")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }
}
