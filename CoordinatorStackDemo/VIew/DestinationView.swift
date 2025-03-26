//
//  DestinationView.swift
//  CoordinatorStackDemo
//
//  Created by Yogesh Raj on 26/03/25.
//

import SwiftUI

struct MainView: View {
    @Environment(Coordinator<MainCoordinatorViews>.self) private var mainCoordinator
    var body: some View {
        List {
            Button("Login") {
                mainCoordinator.push(page: .login, type: .sheet)
            }
            
            Button("Signup") {
                mainCoordinator.push(page: .signup)
            }
        }
    }
}

struct SignupView: View {
    @Environment(Coordinator<MainCoordinatorViews>.self) private var mainCoordinator
    var body: some View {
        List {
            Button("Pop") {
                mainCoordinator.pop()
            }
        }
    }
}

struct LoginView: View {
    @Environment(Coordinator<MainCoordinatorViews>.self) private var mainCoordinator
    @Environment(Coordinator<LoginCoordinatorViews>.self) private var loginCoordinator
    var body: some View {
        List {
            Button("Forgot Password") {
                loginCoordinator.push(page: .forgotPassword)
            }
            
            Button("Pop") {
                mainCoordinator.pop(type: .sheet)
            }
        }
    }
}

struct ForgotPassword: View {
    var navigationTitle = ""
    @Environment(Coordinator<MainCoordinatorViews>.self) private var mainCoordinator
    var body: some View {
        List {
            Button("Dismiss") {
                mainCoordinator.pop(type: .sheet)
            }
        }
    }
}
