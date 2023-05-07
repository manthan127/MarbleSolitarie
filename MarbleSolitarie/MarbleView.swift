//
//  MarbleView.swift
//  MarbleSolitarie
//
//  Created by home on 07/11/21.
//

import SwiftUI

struct MarbleView: View {
    let isSelected: Bool
    let board: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(fillMarble(board))
            if isSelected {
                Circle()
                    .strokeBorder(Color.green, lineWidth: 5)
                    .padding(-5)
            }
        }
        .aspectRatio(contentMode: .fit)
    }
    func fillMarble(_ board: Int) -> RadialGradient {
        switch board {
        case -1:
            return RadialGradient(gradient: Gradient(colors: [Color.clear]), center: .center, startRadius: 0, endRadius: 0)
        case 1:
            return RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.7), Color.blue]), center: .init(x: 0.3, y: 0.3), startRadius: 1, endRadius: 50)
        default:
            return RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.7), Color.black.opacity(0.7)]), center: .init(x: 0.7, y: 0.7), startRadius: 7, endRadius: 50)
        }
    }
}
//
//struct MarbleView_Previews: PreviewProvider {
//    static var previews: some View {
//        MarbleView(isSelected: true, board: 8)
//    }
//}
