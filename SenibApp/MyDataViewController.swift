//
//  MyDataViewController.swift
//  SenibApp
//
//  Created by Vinicius Alencar on 28/10/20.
//

import UIKit

class MyDataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var selectedSexInfo: String?
    var sexInfoList = ["Masculino", "Feminino"]
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexInfoList.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSexInfo = sexInfoList[row] // selected item
        sexInfoTxtField.text = selectedSexInfo
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sexInfoList[row]
    }
    
    @IBOutlet weak var checkMember: UIButton!
    @IBOutlet weak var checkBaptism: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var sexInfoTxtField: UITextField!
    @IBOutlet weak var activeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        
        
        hideKeyboardWhenTappedAround()
        
        
        createPickerView()
        dismissPickerView()
    }
    
    
    
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        sexInfoTxtField.inputView = pickerView
    }
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.action))
        
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        sexInfoTxtField.inputAccessoryView = toolBar
    }
    @objc func action() {
        view.endEditing(true)
    }
    
    @IBAction func tappedActive(_ sender: UIButton) {
        if sender.titleLabel?.text == "Ativo"{
            activeButton.setTitle("Inativo", for: .normal)
            activeButton.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: .normal)
        } else if sender.titleLabel?.text == "Inativo"{
            activeButton.setTitle("Ativo", for: .normal)
            activeButton.setTitleColor(#colorLiteral(red: 0.4611347914, green: 0.6798202395, blue: 0.2836196125, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func tappedCheck(_ sender: UIButton) {
        
        
        if sender.isSelected {
            sender.isSelected = false
            
        }else{
            sender.isSelected = true
        }
    }
    
    @IBAction func tappedCheckMember(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            
        }else{
            sender.isSelected = true
        }
        
    }
    
    
    
    
    
    
    
    
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
