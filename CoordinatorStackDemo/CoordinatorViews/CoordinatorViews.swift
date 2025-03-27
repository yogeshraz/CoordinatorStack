//
//  CoordinatorViews.swift
//  CoordinatorStackDemo
//
//  Created by Yogesh Raj on 26/03/25.
//

import SwiftUI
import SwiftUICoordinator

enum MainCoordinatorViews: Coordinatable {
    var id: UUID {.init() }
    
    case root
    case login
    case signup
    case forgotPassword
    
    var body: some View {
        switch self {
        case .root:
            MainView()
        case .signup:
            SignupView()
        case .login:
            CoordinatorStack(LoginCoordinatorViews.login)
        case .forgotPassword:
            ForgotPassword()
        }
    }
}


enum LoginCoordinatorViews: Coordinatable {
    var id: UUID {.init() }
    
    
    case login
    case forgotPassword
    
    var body: some View {
        switch self {
        case .login:
            LoginView()
        case .forgotPassword:
            ForgotPassword()
        }
    }
}
