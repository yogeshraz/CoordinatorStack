## Requirements

| Platform | Minimum Version |
|----------|-----------------|
| iOS      | 17.0            |
| macOS    | 13.0            |
| tvOS     | 16.0            |
| watchOS  | 9.0             |

<br>


## Installation

You can install `Routing` using the Swift Package Manager.

1. In Xcode, select `File` > `Add Package Dependencies`.
<p align="left">
  <img src = "https://github.com/JamesSedlacek/Routing/blob/main/Assets/Installation1.png" width="350">
</p>
<br>

2. Copy & paste the following into the `Search or Enter Package URL` search bar.
```
https://github.com/yogeshraz/SwiftUICoordinator.git
```

<p align="left">
  <img src = "https://github.com/JamesSedlacek/Routing/blob/main/Assets/Installation2.png" width="350">
</p>
<br>

3. Xcode will fetch the repository & the `SwiftUICoordinator.git ` library will be added to your project.

<br>



## Getting Started

1. Create a `Coordinator` enum that conforms to the `Coordinatable` protocol.

``` swift
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
```
2. Set  `Coordinator stack` in ‘@main’
```
@main
struct CoordinatorStackDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorStack(MainCoordinatorViews.root)
        }
    }
}
```

3. Create a  `Coordinator ` object in content view
```
@Environment(Coordinator<MainCoordinatorViews>.self) private var mainCoordinator

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
```


