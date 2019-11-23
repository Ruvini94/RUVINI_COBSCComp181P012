
import UIKit
//import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

    @IBAction func didClickLogin(_ sender: Any) {
        
        //self.performSegue(withIdentifier: "loginToHome", sender: "")
    }
    @IBAction func didClickRegister(_ sender: Any) {
//        var email = username.text
//        var pass = password.text
//        if (email != "" && pass != ""){
//            Auth.auth().createUser(withEmail: email!, password: pass!){ (user,error) in
//                if user != nil{
//                    print("User created")
//                    self.performSegue(withIdentifier: "loginToHome", sender: "")
//                }else{
//                    print("Error")
//                }
//                
//            }
//        }
        
    }
    @IBAction func didClickForgetPwd(_ sender: Any) {
    }
    
}

