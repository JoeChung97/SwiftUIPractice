//
//  Tester123.swift
//  sui
//
//  Created by Joseph Chung on 5/25/21.
//

import SwiftUI

struct Tester123: View {
    var body: some View {
        
        let rows = [GridItem()]
        
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows) {
                        ForEach(0 ..< 100) {_ in
                            Cell(product: Product(id: "0", title: "Testing", price: "9.97"))
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 100, alignment: .top)
                
                ProfileView()
                    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .leading)
                
                ForEach(0 ..< 25) { _ in
                    CardView()
                        .onTapGesture {
                            print("Tapped")
                        }
                    Spacer()
                }
                
                Spacer()
            }
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 25))
    }
}

struct Tester123_Previews: PreviewProvider {
    static var previews: some View {
        Tester123()
    }
}
