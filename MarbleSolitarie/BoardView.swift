//
//  BoardView.swift
//  MarbleSolitarie
//
//  Created by home on 06/11/21.
//

import SwiftUI

struct BoardView: View {
    
    @State var board = [[0]]
    let pageType: PageType
    
    @State var row: Int = -3
    @State var colum: Int = -3
    
    var body: some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            
            VStack(spacing: 7){
                ForEach (board.indices, id: \.self) { i in
                    HStack(spacing: 7) {
                        ForEach(board[i].indices, id: \.self){ j in
                            MarbleView(isSelected: (i, j) == (row, colum), board: board[i][j])
                                .onTapGesture{
                                    tap(i, j)
                                }
                                .disabled(board[i][j] < 0)
                        }
                    }
                }
            }
            .padding(16)
            .background(Color.gray)
            .padding(16)
        }
        .onAppear(perform: {
            board = Array(repeating: Array(repeating: 1, count: pageType.size.x), count: pageType.size.y)
            for n in pageType.flat {
                let a = n/board[0].count
                let b = n % board[0].count
                board[a][b] = -1
            }
            board[pageType.emptyPoint.0][pageType.emptyPoint.1] = 0
        })
        
    }
    
    func tap(_ i: Int, _ j: Int) {
        guard board[i][j] == 0 else {
            (row, colum) = (i, j)
            return
        }
        let y = row - i, x = colum - j
        guard (abs(y) == 2 && abs(x) == 2) || (abs(y) == 2 && x == 0) || (abs(x) == 2 && y == 0) else {return}
        board[i][j] = 1
        let middle = board[i + y/2][j + x/2]
        if  middle != -1 {
            board[i + y/2][j + x/2] = 1 - middle
        }
        board[row][colum] = 0
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(pageType: .hammer)
    }
}
