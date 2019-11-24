//
//  HomeViewController.swift
//  Ruwani
//
//  Created by Treinetic Macmini 006 on 11/21/19.
//  Copyright © 2019 Riviera Technologies. All rights reserved.
//

import UIKit
import SCLAlertView
import LocalAuthentication

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")as! UITableViewCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200;//Choose your custom row height
    }
    
    @IBAction func btnMyProfileClicked(_ sender: Any) {
        biomatricsIntergration()
    }
    
    // Checks for biomatrics for autherization
    func biomatricsIntergration() {
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To access your Profile, please use FaceID/TouchID") { [weak self] wasSuccessful, error in
                DispatchQueue.main.async {
                    if wasSuccessful {
                        self!.goToProfile()
                    } else {
                        print("User cancelled the FaceID/TouchID authentication")
                    }
                }
            }
        } else {
            SCLAlertView().showInfo("Information", subTitle: "Please setup FaceID/TouchID")
        }
    }
    
    // Helper function for biomatricsIntergration function to show the Profile
    func goToProfile() {
        let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
        let viewController: MyProfileVC = storyboard.instantiateViewController(withIdentifier: "MyProfileVC") as! MyProfileVC
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.navigationItem.title = "MyProfileVC"
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func didClickProfile(_ sender: Any) {
//        hometoprofile
        performSegue(withIdentifier: "hometoprofile", sender: "")
    }
    
}
