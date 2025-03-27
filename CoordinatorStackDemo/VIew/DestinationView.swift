//
//  DestinationView.swift
//  CoordinatorStackDemo
//
//  Created by Yogesh Raj on 26/03/25.
//

import SwiftUI
import SwiftUICoordinator

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
            
            Button("Alert") {
                mainCoordinator.showBasicAlert(title: "Alert", message: "Basic Alert")
            }
            
            Button("Alert With Option") {
                mainCoordinator.showAlertWithAction(title: "Alert", message: "Action Alert") {
                    print("Option Selected")
                }
            }
            
            Button("Alert with multiple option") {
                mainCoordinator.showAlertWithMultiAction(title: "Alert", message: "Messagesss") {
                    print("closer")
                } closerCancel: {
                    print("closerCancel")
                }

            }
            
            Button("Alert with multiple option Array") {
                let button1 = AlertButton(title: "1", action: {
                    print("1")
                })
                let button2 = AlertButton(title: "2", action: {
                    print("2")
                })
                let button3 = AlertButton(title: "3", action: {
                    print("3")
                })
                let button4 = AlertButton(title: "4", action: {
                    print("4")
                })
                mainCoordinator.showAlertWithMultiAction(title: "Alert", message: "Array", buttons: [button1, button2, button3, button4])
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
            Button("Alert") {
                let button1 = AlertButton(title: "1", action: {
                    print("1")
                })
                let button2 = AlertButton(title: "2", action: {
                    print("2")
                })
                let button3 = AlertButton(title: "3", action: {
                    print("3")
                })
                let button4 = AlertButton(title: "4", action: {
                    print("4")
                })
                loginCoordinator.showAlertWithMultiAction(title: "Alert", message: "Array", buttons: [button1, button2, button3, button4])
            }
            
            Button("Sheet") {
                let button1 = AlertButton(title: "1", action: {
                    print("1")
                })
                let button2 = AlertButton(title: "2", action: {
                    print("2")
                })
                let button3 = AlertButton(title: "3", action: {
                    print("3")
                })
                let button4 = AlertButton(title: "4", action: {
                    print("4")
                })
                loginCoordinator.showAlertWithMultiAction(title: "Alert", message: "Array", option: .confirmationDialog, buttons: [button1, button2, button3, button4])
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
