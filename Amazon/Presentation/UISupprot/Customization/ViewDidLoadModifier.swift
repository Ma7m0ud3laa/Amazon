//
//  ViewDidLoadModifier.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    
    @State
    private
    var isViewDidLoad: Bool = false
    
    private let action: (() -> Void)?
    
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            if !self.isViewDidLoad {
                self.isViewDidLoad.toggle()
                self.action?()
            }
        }
    }
    
}
