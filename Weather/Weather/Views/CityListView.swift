//
//  CityListView.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import SwiftUI

struct CityListView: View {
    @State private var searchText: String = ""
    let columns = [
            GridItem(),
            GridItem()
        ]
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0...10, id: \.self) { idx in
                        WeatherTile(i: "\(idx)")
                            .frame(width: proxy.size.width * 0.4, height: proxy.size.width * 0.4)
                            .cornerRadius(25)
                    }
                }
            }
        }
        .navigationTitle("Add City")
        .searchable(text: $searchText, prompt: "Search Weather for City...")
    }
}

struct WeatherTile: View {
    var i: String
    var body: some View {
        ZStack {
            Color.purple.opacity(0.4)
            TileInfo()
        }
    }
}

struct TileInfo: View {
    var body: some View {
        HStack {
            VStack {
                Text("28°C")
                Spacer()
                Text("28°C")
                Text("28°C")
            }
            Spacer()
            VStack {
                Image(systemName: "sun.max")
                Spacer()
            }
        }
        .padding(15)
    }
}
