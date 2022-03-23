//
//  Validation.swift
//  
//
//  Created by Virtual Machine on 22/03/22.
//

import Foundation
import CPF_CNPJ_Validator

struct Validations {
    
    let user : String
    let password: String
    
    func passwordValidation (_password: String) -> Bool {
        let passwordRegEx = "^(.*[a-z]*.)(.*[0-9]*.)(.*[!@#$%^&*]*.)$"
        
        let passwrodPredicate = NSPredicate(format:"SELF MATCHES %@",passwordRegEx)
        return passwrodPredicate.evaluate(with: password)
    }
    func cpfValidation (_ cpf: String) -> Bool {
       let cpf = BooleanValidator().validate(cpf, kind: .CPF)
        return cpf
    }
    
    func emailValidation (_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]{2,52}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,52}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
