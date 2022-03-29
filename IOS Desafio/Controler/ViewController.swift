//
//  ViewController.swift
//  IOS Desafio
//
//  Created by Virtual Machine on 14/03/22.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var UserWarning: UILabel!
    @IBOutlet weak var userLogin: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var service = Services()
    var user: Login?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userLogin.delegate = self
        self.userPassword.delegate  = self
        
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userLogin {
        
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
       
        return true
        }else{
            textField.endEditing(true)
            guard let user = userLogin.text else {return true}
            guard let password = userPassword.text else {return true}
                validInputs(user, password)
                return true
            }
        }
}


extension ViewController {
    
    func validInputs(_ user: String, _ password: String) {
        let login = Validation(user: user, password: password)
        
        if login.emailValidation(user) || login.cpfValidation(user){
            if login.passwordValidation(_password: password) {
//                service.requestLogin(username: user, password: password)
            } else {
                errorLog()
            }
        } else {
            errorLog()
        }
    }

    func errorLog() {
        DispatchQueue.main.async {
            self.UserWarning.text = "Usuario ou Senha invalidos."
//            SVProgressHUD.dismiss()
//            self.loginButtom.isUserInteractionEnabled = true
        }
    }
}

extension ViewController {
    
    @IBAction func progressButton(_ sender: UIButton) {
    
    self.loginButton.isUserInteractionEnabled = false
    
    guard let user = userLogin.text else {return}
    guard let password = userPassword.text else {return}
    
    validInputs(user, password)
        service.requestLogin(username: user, password: password)
        
}

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "progress" {
//        let login = segue.destination as! ExtractController
//        login.user = user
//        self.dismiss(animated: false, completion: nil)
//    }
//}
}


    

