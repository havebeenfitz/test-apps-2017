//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
               
                SVProgressHUD.dismiss()
                print(error!.localizedDescription)
                let ac = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                ac.addAction(okAction)
                self.present(ac, animated: true)
                
                
                
            } else {
                
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
            }
        }
        
    }
    


    
}  
