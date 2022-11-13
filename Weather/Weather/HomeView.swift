//
//  ContentView.swift
//  Weather
//
//  Created by Aditya Mishra on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var tappedHamburger = false
    @State private var isCelcius = true
    
    var body: some View {
        NavigationView {
            DashboardView()
                .navigationTitle(Text(Date.now, format: .dateTime.weekday().day().month()))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HamburgerButton(tapped: $tappedHamburger)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ScaleSwitchButton(isCelcius: $isCelcius)
                    }
                }
        }
        .searchable(text: $searchText)
    }
}

struct DashboardView: View {
    var body: some View {
        Text("Hello")
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
                .rotationEffect(.degrees(tapped ? 90 : 0))
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
