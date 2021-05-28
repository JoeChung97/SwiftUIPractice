//
//  ProfileView.swift
//  sui
//
//  Created by Joseph Chung on 5/25/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Image("Image")
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Username")
                    .bold()
                Text("Barber")
                    .font(.caption)
                
                HStack {
                    ForEach(0 ..< 5) { _ in
                        Image("Image")
                            .frame(width: 10, height: 10, alignment: .center)
                            .clipShape(Circle())
                    }
                }
            }
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
