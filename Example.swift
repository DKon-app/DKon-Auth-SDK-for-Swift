import UIKit
import DKonAuthSDK // Make sure to link the framework properly

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dkonAuth = DKonAuth(clientId: "1302")
        
        dkonAuth.login(username: "yourUsername", password: "yourPassword") { result in
            switch result {
            case .success(let response):
                print("Login successful!")
                print("Access Token: \(response.accessToken ?? "")")
                print("Account ID: \(response.accountId ?? "")")
                
                // Handle successful login (e.g., transition to another screen)
                
            case .failure(let error):
                print("Login failed: \(error.localizedDescription)")
                
                // Handle error (e.g., show an alert to the user)
            }
        }
    }
}
