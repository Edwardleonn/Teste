//
//  ExtractController.swift
//  IOS Desafio
//
//  Created by Virtual Machine on 15/03/22.
//

import UIKit

class ExtractController: UIViewController {

    @IBOutlet weak var backgroundGradient: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    
        var view = self.backgroundGradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view!.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.6911319494, green: 0.7786149383, blue: 0.8909720778, alpha: 1).cgColor, #colorLiteral(red: 0.06023143977, green: 0.3886301816, blue: 0.5756700635, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view!.layer.insertSublayer(gradientLayer, at: 0)
        
            
            
        }
}
