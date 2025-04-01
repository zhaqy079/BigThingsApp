//
//  SplashAnimationView.swift
//  TheBigThing
//
//  Created by zhaqy079.
// Animation code reference : https://github.com/amosgyamfi/open-swiftui-animations


import UIKit
import SwiftUI

struct SplashAnimationView: View {
    let txt = Array("The Big Things")
    @State private var flipAngle = Double.zero

    var body: some View {
        VStack(spacing: 32) {
            HStack(spacing: 0) {
                ForEach(0..<txt.count, id: \.self) { flip in
                    Text(String(txt[flip]))
                        .font(.largeTitle)
                        .rotation3DEffect(.degrees(flipAngle), axis: (x: 1, y: 1, z: 1))
                        .animation(.default.delay(Double(flip) * 0.1), value: flipAngle)
                }
            }

            Button {
                flipAngle = (flipAngle == .zero) ? 360 : .zero
            } label: {
                Text("Flip")
            }
        }
    }
}
