//
//  CityListView.swift
//  Weather
//
//  Created by Aditya Mishra on 13/11/22.
//

import SwiftUI

struct CityListView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel
    @State private var searchText: String = ""

    let columns = [
            GridItem(),
            GridItem()
        ]
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<weatherViewModel.weather.count, id: \.self) { idx in
                        WeatherTile(weatherViewModel: weatherViewModel, idx: idx)
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
    @ObservedObject var weatherViewModel: WeatherViewModel
    var idx: Int
    var body: some View {
        ZStack {
            Color.purple.opacity(0.4)
            TileInfo(weatherRespose: weatherViewModel.weather[idx])
        }
    }
}

struct TileInfo: View {
    var weatherRespose: WeatherResponse
    var country: String {
        let current = Locale(identifier: "en_US")
        return current.localizedString(forRegionCode: weatherRespose.sys.country)  ?? "..."
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(weatherRespose.main.temp, specifier: "%.0f")°")
                    Spacer()
                    Text(weatherRespose.name)
                }
                Spacer()
                VStack {
                    Image(systemName: "sun.max")
                    Spacer()
                }
            }
            Text(country)
        }
        .padding(15)
    }
}
