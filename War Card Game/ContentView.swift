//
//  ContentView.swift
//  War Card Game
//
//  Created by Davide Carpini on 05/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    var body: some View {
        ZStack {
            Image("background-wood-cartoon").resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack(spacing: 50) {
                Image("logo")
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Button{
                    deal()
                } label: {
                    Image("button")
                }
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("Player")
                        Text(String(playerScore)).font(.largeTitle).bold()
                    }
                    Spacer()
                    VStack(spacing: 10) {
                        Text("CPU")
                        Text(String(cpuScore)).font(.largeTitle).bold()
                    }
                    Spacer()
                }.foregroundStyle(Color(.white))
            }.padding()
        }
        
    }
    
    func deal() {
        let playerCardValue = Int.random(in: 2...14)
        // remove the playerCard from the possible values for the cpuCard
        let possibleCpuCardValues = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].filter { $0 != playerCardValue }
        let cpuCardValue = possibleCpuCardValues.randomElement()!
        // Randomize the player card
        playerCard = "card" + String(playerCardValue)
        // Randomize the cpu card
        cpuCard = "card" + String(cpuCardValue)
        // Update the scores
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else {
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}
