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
        // Define the valid card range
        let minCard = 2
        let maxCard = 14
        let cardRange = minCard...maxCard
        
        // Generate random cards, ensuring they're different
        let playerCardValue = Int.random(in: cardRange)
        let cpuCardValue = (cardRange.filter { $0 != playerCardValue }).randomElement()!
        
        // Update card images
        playerCard = "card\(playerCardValue)"
        cpuCard = "card\(cpuCardValue)"
        
        // Compare cards and update score
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if playerCardValue < cpuCardValue {
            cpuScore += 1
        }
        // Note: If cards are equal, no points awarded
    }
}

#Preview {
    ContentView()
}
