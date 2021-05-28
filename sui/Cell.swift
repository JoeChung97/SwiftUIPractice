//
//  Cell.swift
//  sui
//
//  Created by Joseph Chung on 5/24/21.
//

import SwiftUI

struct Cell: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .padding()
            VStack(alignment: .leading) {
                Text(product.title)
                Text("$" + product.price)
            }
            .padding()
        }
        .border(Color.black, width: 2)
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(product: Product(id: "1", title: "Test", price: "1.99"))
    }
}
