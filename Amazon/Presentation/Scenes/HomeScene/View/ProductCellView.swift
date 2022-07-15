//
//  ProductView.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import SwiftUI

struct ProductCellView: View {
    
    var proudct: Product?
    
    var body: some View {
        
        ZStack {
            
//            Color.green
            
            HStack(spacing: 5) {
                
                CacheAsyncImage(url: self.proudct?.imageURL,
                                transaction: .init(animation: .easeOut)) { phase in
                    switch phase {
                    case let .success(image):
                        image
                            .resizable()
                    case .failure:
                        Image("PlaceholderImage")
                            .resizable()
                    default:
                        ProgressView()
                    }
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 80)
                .cornerRadius(5)

                
                VStack(alignment: .leading, spacing: 10) {
                    Text(proudct?.name ?? "Name")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(proudct?.price ?? "000 AED")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }

            }
            .padding(.horizontal, 10)
        }
        

        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(proudct: nil)
    }
}
