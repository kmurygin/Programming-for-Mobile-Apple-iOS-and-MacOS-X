//
//  ContentView.swift
//  animation
//
//  Created by Kacper Murygin on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            ForEach(0..<100) { _ in
                GlobeView()
            }
        }
        .frame(minWidth: 500,  idealWidth: 500, maxWidth: 500, minHeight: 500, idealHeight: 500, maxHeight: 500)
        .fixedSize()
    }
}

struct GlobeView: View {
    @State private var position: CGPoint = CGPoint(x: CGFloat.random(in: 0..<500), y: CGFloat.random(in: 0..<500))
    
    var body: some View {
        Image(systemName: "globe")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.random())
            .position(position)
            .onAppear {
                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                    self.position = CGPoint(x: CGFloat.random(in: 0..<500),
                                            y: CGFloat.random(in: 0..<500))
                    
                }
            }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static func random() -> Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#Preview {
    ContentView()
}
