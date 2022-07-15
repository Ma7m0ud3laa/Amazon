//
//  SearchScanView.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 15/07/2022.
//

import SwiftUI


struct SearchScanView: View {
    
    @State var searchText: String
    
    var body: some View {
        
        ZStack {
            
            HStack {
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search Products", text: $searchText)
                }
                .padding()
                .frame(height: 45)
                .background(Color.white)
                .cornerRadius(10)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "camera.viewfinder")
                        .padding()
                        .frame(width: 45, height: 45)
                        .tint(Color.white)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.leading, 10)
                
                
            }
            .padding(.horizontal)
        }
    }
}

struct SearchScanView_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchScanView(searchText: "")
        
    }
}
