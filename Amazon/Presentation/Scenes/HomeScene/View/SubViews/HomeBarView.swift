//
//  HomeBarView.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 15/07/2022.
//

import SwiftUI

struct HomeBarView: View {
    
    var body: some View {
                
            
            HStack {
                
                Button(action: {}) {
                    Image(systemName: "text.alignleft")
                        .padding()
                        .tint(.black)
                        .frame(width: 45, height: 45)
                        .background(Color.white)
                        .cornerRadius(10)
                }

                Spacer()
                
                Image("AmazonLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 45)
                    .frame(width: 150, height: 60, alignment: .center)
                
                Spacer()
                
//                Button(action: {}) {
//                    Image(systemName: "person")
//                        .tint(.black)
//                        .frame(width: 45, height: 45)
//                        .background(Color.white)
//                        .cornerRadius(10)
//                }
                
            }
            .padding(.horizontal)
        
    }
}

struct HomeBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBarView()
    }
}
