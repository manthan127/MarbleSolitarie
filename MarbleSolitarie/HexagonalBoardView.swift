//
//  HexagonalBoardView.swift
//  MarbleSolitarie
//
//  Created by home on 07/11/21.
//

import SwiftUI

struct HexagonalBoardView: View {
    @State var board = [[0]]
    let pageType: PageType
    
    @State var row: Int = -3
    @State var colum: Int = -3
    @State var width: CGFloat = 20
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack(spacing: 3) {
                ForEach (board.indices, id: \.self) { i in
                    HStack(spacing: 7) {
                        ForEach(board[i].indices, id: \.self){ j in
                            MarbleView(isSelected: (i, j) == (row, colum), board: board[i][j])
                                .frame(width: board[i][j] == -2 ? 0 : width, height: board[i][j] == -2 ? 0 : width)
                                .onTapGesture{
                                    tap(i, j)
                                }
                                .aspectRatio(1, contentMode: .fit)
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
            setData()
        })
        
    }
    
    func setData() {
        var tempBoard = [[Int]]()
        for i in (pageType.size.0...pageType.size.1) {
            tempBoard.append(Array(repeating: 1, count: i))
        }
        board = tempBoard
        
        let max = pageType.size.1
        
        for i in pageType.flat {
            let n = abs(i)
            let a = n / max
            let b = n - a*max
            board[a][b] = i < 0 ? -2 : -1
        }
        board[pageType.emptyPoint.0][pageType.emptyPoint.1] = 0
        
        let maxHeight = CGFloat(pageType.size.1 - pageType.size.0 + 1)
        let hei = UIScreen.main.bounds.height - 94 - 3*(maxHeight - 1)
        let wid = UIScreen.main.bounds.width - 94 - 7*(pageType.maxWidth - 1)
        
        width = min(hei / maxHeight, wid / pageType.maxWidth)
    }
    
    func tap(_ i: Int, _ j: Int) {
        guard board[i][j] == 0 else {
            (row, colum) = (i, j)
            return
        }
        
        let y = row - i, x = colum - j
        guard (x == y && abs(y) == 2) || (abs(y) == 2 && x == 0) || (abs(x) == 2 && y == 0) else {return}
        board[i][j] = 1
        let middle = board[i + y/2][j + x/2]
        if  middle != -1 {
            board[i + y/2][j + x/2] = 1 - middle
        }
        board[row][colum] = 0
    }
}


struct HexagonalBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonalBoardView(pageType: .flower)
    }
}
