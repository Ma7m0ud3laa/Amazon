//
//  TapBarView.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 15/07/2022.
//

import SwiftUI


struct TapBarView: View {
    
    var body: some View {
        
        ZStack {
            
            
            HStack {
                TapBarItemView(imageName: "house.fill") {}
                TapBarItemView(imageName: "heart") {}
                TapBarItemView(imageName: "cart") {}
                TapBarItemView(imageName: "person") {}
            }
            .frame(height: 25)
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
}

struct TapBarView_Previews: PreviewProvider {
    static var previews: some View {
        TapBarView()
    }
}

struct TapBarItemView: View {
    
    @State var imageName: String
    var action: (()->Void)
    
    var body: some View {
        Button(action: self.action) {
            Image(systemName: self.imageName)
                .frame(maxWidth: .infinity)
                .tint(.black)
        }
    }
}
