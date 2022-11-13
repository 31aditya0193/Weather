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
                        LocationButton(tapped: $showDashboard)
                    }
                }
        }
    }
}

struct ContainerView: View {
    @Binding var showDashboard: Bool
    @State var index: Int = 0
    @ObservedObject var weatherViewModel: WeatherViewModel
    var body: some View {
        ZStack {
            if showDashboard {
                DashboardView(weatherViewModel: weatherViewModel, index: $index)
                    .transition(.asymmetric(insertion: .move(edge: .trailing),
                                            removal: .move(edge: .leading)))
            } else {
                CityListView(weatherViewModel: weatherViewModel, showDashboard: $showDashboard, index: $index)
                    .transition(.asymmetric(insertion: .move(edge: .leading),
                                            removal: .move(edge: .trailing)))
            }
        }
    }
}

struct LocationButton: View {
    @Binding var tapped: Bool
    var body: some View {
        Button(action: {
            withAnimation {
                tapped.toggle()
            }
        }) {
            Image(systemName: "location.fill")
                .rotationEffect(.degrees(tapped ? -135 : 0))
        }
    }
}
