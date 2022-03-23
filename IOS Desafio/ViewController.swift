//
//  ViewController.swift
//  IOS Desafio
//
//  Created by Virtual Machine on 14/03/22.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var UserWarning: UILabel!
    @IBOutlet weak var userLogin: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    @IBAction func loginButton(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "Information", sender: self)
//    }
    
    
}

extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
                    setupLogin()
                }
        
                func setupLogin() {
                    self.userLogin.text = ""
                    self.userPassword.text = ""
                }
        
       
    }
    

