//
//  ContentView.swift
//  Weather
//
//  Created by Aditya Mishra on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var showDashboard = true
    @State private var isCelcius = true
    
    var body: some View {
        NavigationView {
            ContainerView(showDashboard: $showDashboard)
                .navigationTitle(Text(Date.now, format: .dateTime.weekday().day().month()))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HamburgerButton(tapped: $showDashboard)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ScaleSwitchButton(isCelcius: $isCelcius)
                    }
                }
        }
        .searchable(text: $searchText, prompt: "Check Weather for City")
    }
}

struct ContainerView: View {
    @Binding var showDashboard: Bool
    var body: some View {
        ZStack {
            if showDashboard {
                DashboardView()
                    .transition(.asymmetric(insertion: .move(edge: .leading),
                                            removal: .move(edge: .trailing)))
            } else {
                CityListView()
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
    var body: some View {
        Button(action: {
            withAnimation {
                isCelcius.toggle()
            }
        }) {
            Text(isCelcius ? "°C" : "°F")
                .fontWeight(.bold)
        }
    }
}
