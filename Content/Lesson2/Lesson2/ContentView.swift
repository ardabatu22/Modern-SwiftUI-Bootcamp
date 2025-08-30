//
//  ContentView.swift
//  Lesson2
//
//  Created by Batuhan Arda on 30.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sayac = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sayaç Uygulaması")
                .font(.title)
                .padding()
            
            Text("\(sayac)")
                .font(.system(size: 50))
                .bold()
            
            HStack(spacing: 40) {
                Button(action: {
                    sayac -= 1
                }) {
                    Text("Azalt (-)")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .foregroundStyle(.red)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    sayac += 1
                }) {
                    Text("Artır (+)")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .foregroundStyle(.green)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
