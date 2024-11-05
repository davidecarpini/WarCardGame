//
//  ContentView.swift
//  War Card Game
//
//  Created by Davide Carpini on 05/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background-wood-cartoon").resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack(spacing: 50) {
                Image("logo")
                HStack {
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card3")
                    Spacer()
                }
                Image("button")
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("Player")
                        Text("0").font(.largeTitle).bold()
                    }
                    Spacer()
                    VStack(spacing: 10) {
                        Text("CPU")
                        Text("0").font(.largeTitle).bold()
                    }
                    Spacer()
                }.foregroundStyle(Color(.white))
            }.padding()
        }
        
    }
}

#Preview {
    ContentView()
}
