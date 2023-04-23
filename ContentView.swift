//
//  ContentView.swift
//  WeatherApp
//
//  Created by Arturo Burigo on 4/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Criciúma, SC")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 86)
                
                HStack(spacing: 30){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 92)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 82)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 42)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 92)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 32)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .mint
                    )
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .default))
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .default))
        }
    }
}

struct BackgroundView: View {
    var isNight : Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
//        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top,30)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 40){
            Image(systemName: (imageName))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°F")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 70)
    }
}

