//
//  ContentView.swift
//  WeatherApp
//
//  Created by Pritesh Singhvi on 17.06.2022.
//


import SwiftUI
import Lottie

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var animateGradient = false
    let blueGradient = Gradient(colors: [Color("Blue"), Color("SeaBlue"), Color("Purple")])

    var body: some View {
        ZStack {
            LinearGradient(gradient: blueGradient, startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                        withAnimation(.easeInOut(duration: 5.0).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
                
            VStack {
                HeaderView(cityVM: cityVM)
                    .padding(.top, 20)
                    .foregroundColor(Color("main"))
                    
                
                DetailsView(cityVM: cityVM)
                    .padding([.top, .bottom], 20)
                    .foregroundColor(Color("main"))
                    
                
                VStack {
                    HStack {
                        Text("Hourly")
                            .font(.custom("Montserrat-Medium", size: 20))
                            .opacity(0.8)
                            
                        
                        Spacer()
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 4, alignment: .leading)
                            .opacity(0.3)
                        Spacer()
                    }
                }
                .foregroundColor(Color("main"))
                
                .padding(.leading, 20)
                
                TodayHourlyView(cityVM: cityVM)
                    .foregroundColor(Color("main"))
                    
                
                VStack {
                    HStack {
                        Text("Daily")
                            .font(.custom("Montserrat-Medium", size: 20))
                            .opacity(0.8)
                        
                        Spacer()
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 4, alignment: .leading)
                            .opacity(0.3)
                        Spacer()
                    }
                }
                .foregroundColor(Color("main"))
                
                .padding(.leading, 20)
                
                DailyView(cityVM: cityVM)
                    .foregroundColor(Color("main"))
                    
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
