//
//  AmazonApp.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import SwiftUI

@main
struct AmazonApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = HomeViewModel()
            HomeView(viewModel: viewModel)
        }
    }
}
