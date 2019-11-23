//
//  MenuViewController.swift
//  NibmArticle
//
//  Created by Mahesha Chamal on 11/23/19.
//

import Foundation
import UIKit
import LocalAuthentication
class MenuClickViewController: UIViewController {
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ActionFace(_ sender: Any) {
        let authContext = LAContext()
        let authReason = "Please use Touch ID to access Your Account"
        var authError : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: { (success,error) -> Void in
                
                if error != nil{
                    DispatchQueue.main.async {
                        self.alert(message: "Authentication Failed")
                    }
                    return
                }
                
                
                if success{
                    //Go to My Account Page
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Home", bundle: nil)
                        
                        let initialViewController = storyboard.instantiateViewController(withIdentifier: "MyProfileEdit")
                        
                        self.window?.rootViewController = initialViewController
                        self.window?.makeKeyAndVisible()
                    }
                }
                
                
                
            })
        }
        else{
            self.alert(message: "Authentication Failed")
        }
}

}
