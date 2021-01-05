//
//  ViewController.swift
//  SenibApp
//
//  Created by Vinicius Alencar on 19/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        hideKeyboardWhenTappedAround()
        
        
        
    }


}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
