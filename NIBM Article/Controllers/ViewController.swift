//
//  ViewController.swift
//  Ruwani
//
//  Created by Treinetic Macmini 006 on 11/21/19.
//  Copyright © 2019 Riviera Technologies. All rights reserved.
//

import UIKit
import FirebaseAuth
import SCLAlertView
import SVProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    private let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didClickLogin(_ sender: Any) {
        SVProgressHUD.show(withStatus: "Loading...")
        if let email = username.text, let password = password.text {
            if email.count > 0 && password.count > 0 {
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if error != nil {
                        SVProgressHUD.dismiss()
                        print(error)
                        SCLAlertView().showError("Error", subTitle: "Please enter correct credentials")
                    } else {
                        self.userDefaults.set(true, forKey: "LoggedIn")
                        self.loadHome()
                        SVProgressHUD.dismiss()
                    }
                }
            } else {
                SVProgressHUD.dismiss()
                SCLAlertView().showError("Empty Fields", subTitle: "Please enter Email and Password")
            }
        } else {
            SVProgressHUD.dismiss()
            SCLAlertView().showError("Error", subTitle: "Please try again later")
        }
    }
    
    @IBAction func didClickRegister(_ sender: Any) {
        let email = username.text
        let pass = password.text
        if (email != "" && pass != ""){
            Auth.auth().createUser(withEmail: email!, password: pass!){ (user,error) in
                if user != nil{
                    SCLAlertView().showSuccess("Success", subTitle: "User Created")
                }else{
                    SCLAlertView().showError("Error", subTitle: "Registration failed")
                }
                
            }
        }
    }
    
    @IBAction func didClickForgetPwd(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Enter your email", message: "", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Reset Password", style: .default) { (action) in
            SVProgressHUD.show()
            Auth.auth().sendPasswordReset(withEmail: textField.text!) { (error) in
                if error != nil {
                    SVProgressHUD.dismiss()
                    SCLAlertView().showError("Error", subTitle: "Please try again later")
                } else {
                    SVProgressHUD.dismiss()
                    let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showTitle("Success", subTitle: "Password reset email is sent to your email account. Reset your email and log in", style: .success, colorStyle: 0x1CB674, colorTextButton: 0xFFFFFF)
                    alertViewResponder.setDismissBlock {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Email address"
            textField = alertTextField
        }
        alert.addAction(resetAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func loadHome() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController: HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.navigationItem.title = "Home"
        navigationController?.navigationBar.tintColor = UIColor.black
    }
}

