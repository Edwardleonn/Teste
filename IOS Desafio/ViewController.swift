//
//  ViewController.swift
//  IOS Desafio
//
//  Created by Virtual Machine on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userLogin: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userVal idation: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    @IBAction func loguinButton(_ sender: UIButton) {
    
      self.performSegue(withIdentifier: "Information", sender: self)
    
    }
    
}
