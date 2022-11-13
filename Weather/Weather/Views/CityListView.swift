//
//  CityListView.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import SwiftUI

struct CityListView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .black],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Text("Hello, City Lists!")
        }
        .navigationTitle("Add City")
    }
}
