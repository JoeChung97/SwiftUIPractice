//
//  CardView.swift
//  sui
//
//  Created by Joseph Chung on 5/25/21.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        HStack {
            Image("Image")
                .clipShape(Circle())
                .padding(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
            VStack(alignment: .leading) {
                Text("Announcement")
                    .bold()
                    .padding(.trailing)
                Text("Detailed Info")
                    .font(.caption)
            }
        }
        .cornerRadius(15)
        .clipped()
        .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 2))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
