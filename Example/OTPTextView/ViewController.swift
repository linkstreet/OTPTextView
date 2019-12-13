//
//  ViewController.swift
//  OTPTextView
//
//  Created by ehsanomid on 12/29/2018.
//  Copyright (c) 2018 ehsanomid. All rights reserved.
// // GitHub : https://github.com/ehsanomid  Email : imehsan@icloud.com

import UIKit
import OTPTextView
class ViewController: UIViewController,OTPTextViewDelegate {
    @IBAction func GAPP(_ sender: Any) {
 
    }
    
    func OTPTextViewResult(number: String?) {
        
  
        if number != nil
        {
            let alert = UIAlertController(title: "Alert", message: number, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func showNumberButtonAction(_ sender: Any) {
        
        OTPTextVU.onSuccess()
        let alert = UIAlertController(title: "Alert", message: OTPTextVU.getNumber(), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var OTPTextVU: OTPTextView!
    @IBOutlet weak var placeHolder: UITextField!
    @IBOutlet weak var clearAllButton: UIButton!
    @IBOutlet weak var showNumberButton: UIButton!
    
   var OTPTextVU2 =  OTPTextView()

    @IBAction func slider(_ sender: UISlider) {
        
        OTPTextVU.gape = CGFloat(sender.value)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        OTPTextVU.BlocksNo = Int(sender.value)
    }
    @IBAction func clearAllButtonAction(_ sender: Any) {
        
        OTPTextVU.clearAll()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        OTPTextVU.layer.cornerRadius = 10
        OTPTextVU.delegate = self
//        
//        OTPTextVU.indicatorStyle = .underlineProgress
//        
//        clearAllButton.StyleTheButton()
//        showNumberButton.StyleTheButton()
//        
//        
//        OTPTextVU.borderColor = .blue // Default border color
//        
//        OTPTextVU.onErrorBorderColor = .red // the color when one textfield is empty
//        
//        OTPTextVU.onEnterBoarderColor = .orange // the color when textfield gets the focus
//        
//        OTPTextVU.onLeaveBoarderColor =  .blue // the color when textfield loses the focus
//        
//        OTPTextVU.onFilledBorderColor = .blue // the color when textfield is filled and loses the focus
//        
//        OTPTextVU.onSuccessBoarderColor = .blue // the color when codes is right
//        OTPTextVU.onAllFilledBoarderColor = .green
//        
//         OTPTextVU.IndicatorGapeFromTop = 4 //
//        
//        
//         OTPTextVU.isBorderHidden = false
//        
//        
//         OTPTextVU.isPasswordProtected = false
//        
//        
//        
//        
//         OTPTextVU.forceCompletion = false
//        
//        
//         OTPTextVU.callOnCompleted = false
//        
//        
//         OTPTextVU.AutoArrange = false
//        
//        
//         OTPTextVU.isBorderHidden = false
//        
//        
//         OTPTextVU.onEnterBorderWidth = 2
//        
//        
//         OTPTextVU.onLeaveBorderWidth = 1
//        
//        
//         OTPTextVU.borderSize = 1
//        
//        
//         OTPTextVU.BorderRadius = 10
//        
//        
//         OTPTextVU.isFirstResponser = false
//        
//      
//        
//         OTPTextVU.BlockSize = CGSize(width: 35, height: 50)
//        
//        
//         OTPTextVU.BlocksNo = 12
//        
//        
//         OTPTextVU.gape = 10
//        
//        
//         OTPTextVU.showCursor = false
//        
//        
//         OTPTextVU.fontSize = 18
//        
//        
//         OTPTextVU.placeHolder = "#"
//        
//        
//        
//        
//        
//        
        
        /*

         let myOTPTextView = OTPTextView(frame:CGRect(x: 10, y: 400, width: 300, height: 50))
        view.addSubview(myOTPTextView)
        print(myOTPTextView.getNumber())
 
        */
        
    }
    
    @IBAction func showCursor(_ sender: UISwitch) {
        
        
        OTPTextVU.showCursor = sender.isOn
    }
    @IBAction func forceToFill(_ sender: UISwitch) {
        
        OTPTextVU.forceCompletion = sender.isOn
        
    }
    @IBAction func middleGape(_ sender: UISwitch) {
        print(#function)
        
        if sender.isOn{
              OTPTextVU.middleGape = 10
        } else
        {
            OTPTextVU.middleGape = 0

        }
        
    }
    @IBAction func AutomaticDone(_ sender: UISwitch) {
        
        OTPTextVU.callOnCompleted = sender.isOn
        
    }
    
    @IBAction func showBorder(_ sender: UISwitch) {
        
        if !sender.isOn
        {
            OTPTextVU.isBorderHidden = true
            
        } else
        {
            OTPTextVU.isBorderHidden = false
            
        }
        
        
    }
    @IBAction func showIndicator(_ sender: UISwitch) {
        
        if sender.isOn
        {
            OTPTextVU.underLineIndicator.isHidden = false
            
        } else
        {
            OTPTextVU.underLineIndicator.isHidden = true
            
        }
    }
    @IBAction func autoArrange(_ sender: UISwitch) {
        
        
        OTPTextVU.AutoArrange = sender.isOn
    }
}

extension UIView {
    func StyleTheButton()
    {
        self.backgroundColor = .clear //UIColor(red:202.0/255.0, green:228.0/255.0, blue:230.0/255.0, alpha:1.0)
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:202.0/255.0, green:220.0/255.0, blue:230.0/255.0, alpha:1.0).cgColor
    }
}
