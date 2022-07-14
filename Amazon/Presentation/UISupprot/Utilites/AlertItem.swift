//
//  AlertMessages.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}

enum AlertContext {
    
    //MARK: Show messages here depend on test team test-cases
    
    static let emptyData = AlertItem(title: Text("No Product Found"),
                                           message: Text("There is no product currently available, it may be available soon."),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Oops"),
                                           message: Text("Invalid response from the server. Please try again or contact support."),
                                           dismissButton: .default(Text("Ok")))
    
}
