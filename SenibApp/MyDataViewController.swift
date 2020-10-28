//
//  MyDataViewController.swift
//  SenibApp
//
//  Created by Vinicius Alencar on 28/10/20.
//

import UIKit

class MyDataViewController: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nameTxtField.useUnderline()
        hideKeyboardWhenTappedAround()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UITextField {
  func useUnderline() -> Void {
    let border = CALayer()
    let borderWidth = CGFloat(1.0) // Border Width
    border.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
    border.borderWidth = borderWidth
    self.layer.addSublayer(border)
    self.layer.masksToBounds = true
  }
}
