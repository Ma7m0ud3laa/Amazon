//
//  ProductDetailsView.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import SwiftUI

struct ProductDetailsView<ViewModel: ProductDetailsViewModelProtocol>: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("Background").edgesIgnoringSafeArea(.all)

            
            ScrollView {
            
                VStack {
                    
                    CacheAsyncImage(url: self.viewModel.output.imageURL,
                                    transaction: .init(animation: .easeOut)) { phase in
                        switch phase {
                        case let .success(image):
                            image
                                .resizable()
                        default:
                            Image("PlaceholderImage")
                                .resizable()
                        }
                    }
                                    .frame(maxWidth: .infinity)
                                    .aspectRatio(1, contentMode: .fit)
     
                    Text(self.viewModel.output.name)
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack() {
                        Text("Price")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(self.viewModel.output.price)
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Image(systemName: "chevron.left")
                                            .padding(.all, 10)
                                            .background(Color.white))
                                            .cornerRadius(10)
            }
            .edgesIgnoringSafeArea(.top)

        }
    }
        
}

struct ProductDetailsView_Previews: PreviewProvider {

    static var previews: some View {
        ProductDetailsView(viewModel: ProductDetailsViewModel(product: nil))
    }
}
