
import Foundation
import UIKit


protocol LoginManagerDelegate: NSObjectProtocol {
    func resultRequestValidateLogin(result: Login)
}

protocol ExtractManegerDelegate: NSObjectProtocol {
    func resultRequestValidateStatement(result: [Extract])
}

class Services {
    
    var LoginManagerDelegate: LoginManagerDelegate?
    var ExtractManegerDelegate: ExtractManegerDelegate?
    //
    
    func requestLogin(username: String, password: String) {
        
        //        LoginManagerDelegate = delegate
        
        let params = ["username":username, "password":password] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: "https://api.mobile.test.solutis.xyz/login")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: .default)
        
        
        let tarefa = session.dataTask(with: request) {(data, response, error) in
            if error != nil {
                print(error!)
                // self.delegateLogInto?.didErrorLog()
                return
            }
            
            if let safeData = data {
                print("Data: \(safeData)")
            }
        }
        tarefa.resume()        }
}






