//
//  MyDataViewController.swift
//  SenibApp
//
//  Created by Vinicius Alencar on 28/10/20.
//

import UIKit

class MyDataViewController: UIViewController {
    
    var selectedSexInfo: String?
    var sexInfoList = ["Masculino", "Feminino"]
    var activeTextField : UITextField? = nil

    
    @IBOutlet weak var checkMember: UIButton!
    @IBOutlet weak var checkBaptism: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var sexInfoTxtField: UITextField!
    @IBOutlet weak var activeButton: UIButton!

    @IBOutlet weak var emailTxtfield: UITextField!
    @IBOutlet weak var cellNumberTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(MyDataViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MyDataViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        hideKeyboardWhenTappedAround()
        createPickerView()
        dismissPickerView()
        
        nameTxtField.delegate = self
        sexInfoTxtField.delegate = self
        emailTxtfield.delegate = self
        cellNumberTxtField.delegate = self
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        
        var shouldMoveViewUp = false
        
        if let activeTextField = activeTextField{
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard{
                shouldMoveViewUp = true
            }
        }
        
        if shouldMoveViewUp {
            self.view.frame.origin.y = 0 - 200
            print(keyboardSize.height)
        }

        

    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
        self.view.frame.origin.y = 0
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

//MARK: - UITextFieldDelegate
extension MyDataViewController: UITextFieldDelegate {
 
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    
}

//MARK: - PickerView
extension MyDataViewController : UIPickerViewDelegate, UIPickerViewDataSource {
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
    
}
//MARK: - UITextField Propertie
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
