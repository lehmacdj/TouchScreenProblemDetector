//
//  ContentView.swift
//  TouchScreenProblemDetector
//
//  Created by Devin Lehmacher on 8/11/23.
//

import SwiftUI

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

struct ContentView: View {
    @State var points = [CGPoint]()

    @ViewBuilder
    var dots: some View {
        ForEach(points, id: \.self) { point in
            Circle()
                .fill(Color.white)
                .frame(width: 5, height: 5)
                .position(point)
        }
    }

    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                points.append(value.location)
            }
            .onEnded { value in
                points.append(value.location)
            }
    }

    var body: some View {
        ZStack {
            Color.black
            dots
        }
        .ignoresSafeArea()
        .gesture(dragGesture)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
