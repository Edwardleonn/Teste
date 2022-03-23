
import Foundation
import UIKit


protocol LoginResponseDelegate : NSObjectProtocol {
  func resultRequestValidateLogin(result: Login)
}

protocol StatementsResponseDelegate : NSObjectProtocol {
  func resultRequestValidateStatement(result: [Extract])
}

class Services {
    
    var loginResponseDelegate: LoginResponseDelegate?
    var statementsResponseDelegate: StatementsResponseDelegate?
//
    
    func restLogin(username: String, password: String, delegate: LoginResponseDelegate) {
        
        loginResponseDelegate = delegate
        
        let params = ["username":username, "password":password] as Dictionary<String, String>

        var request = URLRequest(url: URL(string: "https://api.mobile.test.solutis.xyz/login")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                
                var user = Login()
                
                if json["message"] != nil {
                    user.mensagem = json["message"] as! String
                }else{
                    user.nome = json["nome"] as! String
                    user.cpf = json["cpf"] as! String
                    user.token = json["token"] as! String
                    user.saldo = (json["saldo"] as! NSNumber).doubleValue
                }

                
                self.onResponseLogin(user: user)
                
                
            } catch {
                print("error")
            }
        })
        task.resume()
  
    }
    
    func onResponseLogin(user: Login) {
        DispatchQueue.main.async(execute: {
          self.loginResponseDelegate?.resultRequestValidateLogin(result: user)
        })
    }
}
