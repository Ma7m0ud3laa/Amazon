//
//  HomeView.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    @StateObject
    var viewModel: ViewModel
    
    var body: some View {
        
        
        NavigationView {
            
            ZStack {
                
                Color("Background").edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    
                    HomeBarView()
                                    
                    Spacer(minLength: 20)
                    
                    SearchScanView(searchText: self.viewModel.input.searchText)
                    
                    List(viewModel.output.products, id: \.id) { product in
                        
                        NavigationLink(destination: ProductDetailsView(viewModel: ProductDetailsViewModel(product: product))) {
                            ProductCellView(proudct: product)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal)
                    .listStyle(.plain)
                    .refreshable {
                        self.viewModel.input.refresherFired()
                    }
                    
                   
                }
                
                TapBarView()
                
                if viewModel.output.isFetching {
                    LoadingView()
                        .frame(maxWidth: .infinity)
                }
                
            }
            
            
            .navigationBarHidden(true)

        }
        
        .alert(item: $viewModel.output.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
        .onLoad {
            self.viewModel.input.viewDidLoad()
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
    
}




