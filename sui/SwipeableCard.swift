//
//  SwipeableCard.swift
//  sui
//
//  Created by Joseph Chung on 5/26/21.
//

import SwiftUI

//calling object function to update state var doesn't work swift

struct SwipeableCard: View {
    
    @Binding var dragOffset: CGSize?
    @Binding var rotation: Double?
    @Binding var opacity: Double?
    
    @State var flipped = false
    
    var onRemoved : (Direction) -> ()
    
    var title: String!
    var subtitle: String!
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 500, alignment: .center)
                    .opacity(flipped ? 0 : 1)
                
                VStack {
                    Spacer()
                    HStack {
                        Text(title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                    }
                    HStack {
                        Text(subtitle)
                            .font(.headline)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom)
                            .padding(.leading)
                        Spacer()
                    }
                }
                
            }
            .frame(width: 300, height: 500, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 15)).shadow(radius: 2))
            .opacity(opacity ?? 1.0)
            .rotationEffect(.degrees(rotation ?? 0.0))
            .rotation3DEffect(
                flipped ? Angle(degrees: 180) : Angle(degrees: 0),
                axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0))
            )
            .offset(dragOffset ?? .zero)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        dragOffset = gesture.translation
                        rotation = Double((dragOffset?.width ?? 0) / 5)
                    }
                    .onEnded { gesture in
                        
                        let velocity = CGSize(
                            width:  gesture.predictedEndLocation.x - gesture.location.x,
                            height: gesture.predictedEndLocation.y - gesture.location.y
                        )
                        
                        if abs(velocity.width) > 500 {
                            flingCardTo(location: gesture.predictedEndTranslation)
                        }else{
                            resetCard()
                        }
                        
                    }
            )
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            flipped.toggle()
                        }
                    }
            )
            
            VStack {
                
                Text("About")
                    .padding(.top)
                
                Spacer()
                
            }
            .frame(width: 300, height: 500, alignment: .center)
            .opacity(flipped ? 1 : 0)
            
        }
        
    }
    
    func hide() {
        opacity = 0.0
    }
    
    func flingCardTo(location: CGSize) {
        withAnimation(.linear(duration: 0.1)) {
            dragOffset = location
            rotation = Double((dragOffset?.width ?? 0) / 5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.11) {
                if dragOffset?.width ?? 0 > 0 {
                    onRemoved(.right)
                }else{
                    onRemoved(.left)
                }
                dragOffset = .zero
                rotation = 0
            }
        }
    }
    
    func resetCard() {
        withAnimation(.linear(duration: 0.1)) {
            rotation = 0
            dragOffset = .zero
        }
    }
    
}

struct SwipeableCard_Previews: PreviewProvider {
    
    static var previews: some View {
        SwipeableCard(dragOffset: Binding.constant(.zero), rotation: Binding.constant(0.0), opacity: Binding.constant(1.0), onRemoved: { direction in
            print("Test")
        }, title: "John Doe", subtitle: "23, Doctor")
    }
}
