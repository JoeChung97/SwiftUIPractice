//
//  ContentView.swift
//  sui
//
//  Created by Joseph Chung on 5/24/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(getItems()) { product in
                        Cell(product: product)
                    }
                }
                .navigationTitle("Testing 123")
                Button(action: {
                    print("Testing 123")
                }, label: {
                    Text("Go")
                        .bold()
                        .foregroundColor(.black)
                })
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.red)
                .clipShape(Circle())
                .frame(width: 100, height: 100, alignment: .center)
                .background(Color.blue)
                .clipShape(Circle())
                
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing).mask(Text("Hello").font(.headline))
            }
        }
    }
    
    func getItems() -> [Product] {
        var items: [Product] = []
        
        let p1 = Product(id: "1", title: "Product 1", price: "19.99")
        items.append(p1)
        
        let p2 = Product(id: "2", title: "Product 2", price: "9.99")
        items.append(p2)
        
        let p3 = Product(id: "3", title: "Product 3", price: "24.99")
        items.append(p3)
        
        let p4 = Product(id: "4", title: "Product 4", price: "24.99")
        items.append(p4)
        
        let p5 = Product(id: "5", title: "Product 5", price: "24.99")
        items.append(p5)
        
        return items
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
