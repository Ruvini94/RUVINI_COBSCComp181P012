//
//  PublisherProfileViewController.swift
//  Ruwani
//
//  Created by Treinetic Macmini 006 on 11/21/19.
//  Copyright © 2019 Riviera Technologies. All rights reserved.
//

import UIKit

class PublisherProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
