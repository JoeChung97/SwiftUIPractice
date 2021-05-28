//
//  TestEnvironment.swift
//  sui
//
//  Created by Joseph Chung on 5/26/21.
//

import SwiftUI

struct TestEnvironment: View {
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                HStack {
                    Text("MAY")
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 30, alignment: .center)
                .background(
                    Color.red
                )
                
                Spacer()
                
                Text("27")
                    .font(.largeTitle)
                
                Spacer()
                
            }
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .background(
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 2)
            )
            
            ZStack {
                
                Circle()
                    .frame(width: 85, height: 85, alignment: .center)
                    .foregroundColor(.blue)
                    .opacity(0.75)
                
                Triangle()
                    .foregroundColor(.red)
                
            }
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .background(
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 2)
            )
            .padding()
            
        }
        
    }
}

struct TestEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        TestEnvironment()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX - 20, y: rect.minY + 20))
        path.addLine(to: CGPoint(x: rect.midX + 2.5, y: rect.midY + 2.5))
        path.addLine(to: CGPoint(x: rect.minX + 20, y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.midX - 2.5, y: rect.midY - 2.5))

        return path
    }
}
