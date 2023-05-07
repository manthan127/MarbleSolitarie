//
//  ContentView.swift
//  MarbleSolitarie
//
//  Created by home on 06/11/21.
//

import SwiftUI


struct ContentView: View {
    @State var mode: PageType = .standerd
    
    @State var isHex = false
    @State var moveToHex = false
    @State var moveToNormal = false
    
    let width = UIScreen.main.bounds.width/3
    
    
    @State var playSoundeffects = true
    @State var equalNotes = false
    @State var noteLength = 1.0
    @State var pauseLength = 0.5
    
    
    var body: some View {
        VStack {
            NavigationLink(destination: HexagonalBoardView(pageType: mode), isActive: $moveToHex) {}
            
            NavigationLink(destination: BoardView(pageType: mode), isActive: $moveToNormal) {}
            
            Button(action: {
                if mode.maxWidth == 0 { moveToNormal = true }
                else { moveToHex = true }
            }, label: {
                Text("Play")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: width, height: (width/3)*2)
                    .background(RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .init(x: 0.4, y: 0.4), startRadius: 5, endRadius: 70))
                    .cornerRadius(10)
            })
            .padding()

            HStack(spacing: 0) {
                Text("square")
                    .padding()
                    .frame(height: isHex ? 65 : 52.3)
                    .background(Color.red)
                    .rotation3DEffect(
                        Angle(degrees: isHex ? 30 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .offset(x: isHex ?  26 : 13)
                    .onTapGesture{
                        withAnimation(.easeIn) {
                            isHex = false
                            mode = .standerd
                        }
                    }
                Text("hexagonal")
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: isHex ? 52.3 : 65)
                    .background(Color.blue)
                    .rotation3DEffect(
                        Angle(degrees: isHex ? 0 : -30),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .offset(x: isHex ? 13 : -4)
                    .onTapGesture{
                        withAnimation(.easeIn) {
                            isHex = true
                            mode = .triangle
                        }
                    }
            }

            Picker(selection: $mode, label: Text("Board"), content: {
                ForEach (PageType.allCases.filter{ isHex == ($0.maxWidth != 0) } , id: \.self) { i in
                    HStack {
                        Image(i.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)

                        Text(i.rawValue)
                        Spacer()
                    }
                    .padding(50)
                }
            })
                .pickerStyle(WheelPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
