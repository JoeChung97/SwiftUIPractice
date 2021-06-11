//
//  CardStack.swift
//  sui
//
//  Created by Joseph Chung on 5/26/21.
//

import SwiftUI

enum Direction {
    case left
    case right
}

struct CardStack: View {
    
    @Binding var pageIndex: Int
    
    @State var cardQueue: [String] = ["Test 1", "Test 2", "Test 3", "Test 4"]
    @State var subtitleQueue: [String] = ["21, Student", "22, Designer", "23, Programmer", "21, Student"]
    
    @State var topCardZ = 1.0
    @State var bottomCardZ = 1.0
    
    @State var topCard: SwipeableCard!
    @State var bottomCard: SwipeableCard!
    
    @State var cardOneOpacity: Double? = 1.0
    @State var cardTwoOpacity: Double? = 1.0
    
    @State var cardOneDragOffset: CGSize? = .zero
    @State var cardTwoDragOffset: CGSize? = .zero
    
    @State var cardOneRotation: Double? = 0.0
    @State var cardTwoRotation: Double? = 0.0
    
    var top = 0
    @State var loaded = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: {
                    goToProfile()
                }, label: {
                    Text("T")
                        .bold()
                        .foregroundColor(.white)
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.yellow
                                .clipShape(Circle())
                                .shadow(radius: 2))
                .padding(.leading, 25)
                
                Spacer()
                
                Button(action: {
                    goToMessages()
                }, label: {
                    Text("T")
                        .bold()
                        .foregroundColor(.white)
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.yellow
                                .clipShape(Circle())
                                .shadow(radius: 2))
                .padding(.trailing, 25)
            }
            .padding(.top, 10)
            
            Spacer()
            
            ZStack {
                
                Text("Nothing Left!")
                    .bold()
                
                bottomCard
                    .zIndex(bottomCardZ)
                topCard
                    .zIndex(topCardZ)
                
            }.onAppear {
                if !loaded {
                    print("Fetching")
                    loaded = true
                    fetch()
                }
            }
            
            Spacer()
            
            HStack {
                
                Button(action: {
                    removeCardPressed(direction: .left)
                }, label: {
                    Text("N")
                        .bold()
                        .foregroundColor(.white)
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(
                    Color.red.clipShape(Circle())
                        .shadow(radius: 2)
                )
                .padding(.trailing, 25)
                
                Button(action: {
                    removeCardPressed(direction: .right)
                }, label: {
                    Text("Y")
                        .bold()
                        .foregroundColor(
                            .white
                        )
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(
                    Color.green
                        .clipShape(Circle())
                        .shadow(radius: 2)
                )
                .padding(.leading, 25)
                
            }
            .padding(.bottom, 10)
            
        }
        
    }
    
    private func goToProfile() {
        pageIndex = 0
    }
    
    private func goToMessages() {
        pageIndex = 2
    }
    
    private func removeCardPressed(direction: Direction) {
        
        var x = 0.0
        switch direction {
        case .left:
            x = -300
        case .right:
            x = 300
        }
        
        if topCardZ >= bottomCardZ {
            topCard.flingCardTo(location: CGSize(width: x, height: -100))
        }else{
            bottomCard.flingCardTo(location: CGSize(width: x, height: -100))
        }
        
    }
    
    private func fetch() {
        topCard = SwipeableCard(dragOffset: $cardOneDragOffset, rotation: $cardOneRotation, opacity: $cardOneOpacity, onRemoved: { direction in
            topCardZ = 1.0
            bottomCardZ = 2.0
            if cardQueue.count > 0 {
                topCard.title = cardQueue.popLast()
                topCard.subtitle = subtitleQueue.popLast()
            }else{
                topCard.hide()
            }
            if direction == .left {
                print("Disliked!")
            }else{
                print("Liked!")
            }
        }, title: cardQueue.popLast(), subtitle: subtitleQueue.popLast())
        bottomCard = SwipeableCard(dragOffset: $cardTwoDragOffset, rotation: $cardTwoRotation, opacity: $cardTwoOpacity, onRemoved: { direction in
            topCardZ = 2.0
            bottomCardZ = 1.0
            if cardQueue.count > 0 {
                bottomCard.title = cardQueue.popLast()
                bottomCard.subtitle = subtitleQueue.popLast()
            }else{
                bottomCard.hide()
            }
            if direction == .left {
                print("Disliked!")
            }else{
                print("Liked!")
            }
        }, title: cardQueue.popLast(), subtitle: subtitleQueue.popLast())
    }
    
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(pageIndex: .constant(0))
    }
}
