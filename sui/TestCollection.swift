//
//  TestCollection.swift
//  sui
//
//  Created by Joseph Chung on 5/24/21.
//

import SwiftUI

struct TestCollection: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach(0 ..< 100, id: \.self) { _ in
                let width = (UIScreen.main.bounds.width - 6) / CGFloat(columns.count)
                let height = width * 1.5
                VStack {
                    Image("Image")
                        .resizable()
                        .frame(width: width, height: width, alignment: .center)
                        .scaledToFill()
                        .blur(radius: 1)
                    Text("Title")
                        .font(.caption2)
                    Text("$49.99")
                }
                .frame(width: width, height: height, alignment: .top)
                .border(Color.black, width: 2)
            }
        }
    }
}

struct TestCollection_Previews: PreviewProvider {
    static var previews: some View {
        TestCollection()
    }
}
