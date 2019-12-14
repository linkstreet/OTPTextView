//
//  ViewController.swift
//  OTPTextView
//
//  Created by Ehsan Omid on 12/29/2018.
//  Copyright (c) 2018 Ehsan Omid. All rights reserved.
// // GitHub : https://github.com/ehsanomid  Email : imehsan@icloud.com

import UIKit
import OTPTextView
class ViewController: UIViewController,OTPTextViewDelegate {
    
    let OTPTextVU : OTPTextView = {
        let otp = OTPTextView()
        otp.BlocksNo = 6 // number of digits
        otp.showCursor = false // show the blinking curser in textfiels
        otp.BlockSize = CGSize(width: 40, height: 50)
        
        otp.translatesAutoresizingMaskIntoConstraints = false
        otp.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        otp.layer.cornerRadius = 15
        otp.layer.borderWidth = 1
        otp.layer.borderColor = UIColor.lightGray.cgColor
        return otp
        
    }()
    
    let showCurserlabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Show Curser"
        return label
    }()
    
    let showCurserSwitch : UISwitch = {
        
        let switchh = UISwitch()
        switchh.translatesAutoresizingMaskIntoConstraints = false
        switchh.addTarget(self, action: #selector(showCurserSwitchTapped), for: .valueChanged)
        return switchh
    }()
    
    let forceFillAlllabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Force Fill All"
        return label
    }()
    
    let ForceFillAllSwitch : UISwitch = {
        
        let switchh = UISwitch()
        switchh.translatesAutoresizingMaskIntoConstraints = false
        switchh.addTarget(self, action: #selector(ForceFillAllSwitchTapped), for: .valueChanged)
        
        return switchh
    }()
    
    
    let middleGapeLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Middle Gape"
        return label
    }()
    
    let middleGapeSwitch : UISwitch = {
        
        let switchh = UISwitch()
        switchh.translatesAutoresizingMaskIntoConstraints = false
        switchh.addTarget(self, action: #selector(middleGapeSwitchTapped), for: .valueChanged)
        
        return switchh
    }()
    
    
    let AutoDoneLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Auto Done"
        return label
    }()
    
    let AutoDoneSwitch : UISwitch = {
        
        let switchh = UISwitch()
        switchh.translatesAutoresizingMaskIntoConstraints = false
        switchh.addTarget(self, action: #selector(AutoDoneSwitchTapped), for: .valueChanged)
        
        return switchh
    }()
    
    
    let AutoArrangeLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Auto Arrange"
        return label
    }()
    
    let AutoArrangeSwitch : UISwitch = {
        
        let switchh = UISwitch()
        switchh.translatesAutoresizingMaskIntoConstraints = false
        switchh.addTarget(self, action: #selector(AutoArrangeSwitchTapped), for: .valueChanged)
        
        return switchh
    }()
    
    let ShowBorderLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Show Border"
        return label
    }()
    
    let ShowBorderSwitch : UISwitch = {
        
        let switchh = UISwitch()
        switchh.translatesAutoresizingMaskIntoConstraints = false
        switchh.addTarget(self, action: #selector(ShowBorderSwitchTapped), for: .valueChanged)
        
        return switchh
    }()
    
    
    let passwordProtectedLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password Protected"
        return label
    }()
    
    let passwordProtectedSwitch : UISwitch = {
        
        let switchh = UISwitch()
        switchh.translatesAutoresizingMaskIntoConstraints = false
        switchh.addTarget(self, action: #selector(passwordProtectedSwitchTapped), for: .valueChanged)
        
        return switchh
    }()
    
    let ShowIndicatorLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Show Indicator"
        return label
    }()
    
    let ShowIndicatorSeg : UISegmentedControl = {
        
        let seg = UISegmentedControl(items: ["Underline", "Progress"])
        seg.selectedSegmentIndex = 0
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.addTarget(self, action: #selector(ShowIndicatorSegTapped), for: .valueChanged)
        
        return seg
    }()
    
    
    let NumberOfDigitsLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Numbers of digits"
        return label
    }()
    
    let  NumberOfDigitsStepper : UIStepper = {
        
        let Stepper = UIStepper()
        Stepper.minimumValue = 1
        Stepper.maximumValue = 10
        Stepper.value = 6
        Stepper.translatesAutoresizingMaskIntoConstraints = false
        Stepper.addTarget(self, action: #selector(NumberOfDigitsStepperTapped), for: .valueChanged)
        
        return Stepper
    }()
    
    
    let gapeSliderLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Value of Gape"
        return label
    }()
    
    let gapeSlider : UISlider = {
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 50
        slider.addTarget(self, action: #selector(gapeSliderChanged), for: .valueChanged)
        
        return slider
    }()
    
    
    let ResetButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Reset", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(ResetButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    let ShowNumberButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Show", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(ShowNumberButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    let getFromClipboard : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("ClipBoard", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(getFromClipboardTapped), for: .touchUpInside)
        return btn
    }()
    
    
    // MARK: UI
    
    
    @objc func showCurserSwitchTapped(sender:UISwitch)
    {
        OTPTextVU.showCursor = sender.isOn
    }
    
    @objc func ForceFillAllSwitchTapped(sender:UISwitch)
    {
        OTPTextVU.forceCompletion = sender.isOn
    }
    
    
    @objc func middleGapeSwitchTapped(sender:UISwitch)
    {
        OTPTextVU.middleGape =  sender.isOn ?  5 : 0
    }
    
    @objc func AutoDoneSwitchTapped(sender:UISwitch)
    {
        OTPTextVU.callOnCompleted = sender.isOn
    }
    
    @objc func AutoArrangeSwitchTapped(sender:UISwitch)
    {
        OTPTextVU.AutoArrange = sender.isOn
    }
    
    @objc func ShowBorderSwitchTapped(sender:UISwitch)
    {
        OTPTextVU.isBorderHidden = !sender.isOn
    }
    
    @objc func ShowIndicatorSegTapped(sender:UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            OTPTextVU.indicatorStyle = .underline
        case 1:
            OTPTextVU.indicatorStyle = .underlineProgress
        default:
            break
        }
        
    }
    
    @objc func NumberOfDigitsStepperTapped(sender:UIStepper)
    {
        OTPTextVU.BlocksNo = Int(sender.value)
        
    }
    
    
    @objc func gapeSliderChanged(sender:UISlider)
    {
        
        OTPTextVU.gape = CGFloat(sender.value)
    }
    
    @objc func ResetButtonTapped(sender:UIButton)
    {
        OTPTextVU.clearAll()
        
    }
    
    @objc func getFromClipboardTapped()
    {
        
        OTPTextVU.getFromClipBoardAndFill()
        
    }
    
    @objc func passwordProtectedSwitchTapped(sender:UISwitch)
    {
        OTPTextVU.isPasswordProtected = sender.isOn
    }
    
    @objc func ShowNumberButtonTapped(sender:UIButton)
    {
        
        OTPTextVU.onSuccess()
        let alert = UIAlertController(title: "Alert", message: OTPTextVU.getNumber(), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    func setupUI()
    {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        view.addSubview(OTPTextVU)
        OTPTextVU.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        OTPTextVU.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        OTPTextVU.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        OTPTextVU.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        
        view.addSubview(showCurserlabel)
        showCurserlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        showCurserlabel.topAnchor.constraint(equalTo: OTPTextVU.bottomAnchor, constant: 50).isActive = true
        
        view.addSubview(showCurserSwitch)
        showCurserSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        showCurserSwitch.topAnchor.constraint(equalTo: OTPTextVU.bottomAnchor, constant: 45).isActive = true
        
        view.addSubview(forceFillAlllabel)
        forceFillAlllabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        forceFillAlllabel.topAnchor.constraint(equalTo: showCurserSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(ForceFillAllSwitch)
        ForceFillAllSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        ForceFillAllSwitch.topAnchor.constraint(equalTo: showCurserSwitch.bottomAnchor, constant: 15).isActive = true
        
        view.addSubview(middleGapeLabel)
        middleGapeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        middleGapeLabel.topAnchor.constraint(equalTo: ForceFillAllSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(middleGapeSwitch)
        middleGapeSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        middleGapeSwitch.topAnchor.constraint(equalTo: ForceFillAllSwitch.bottomAnchor, constant: 15).isActive = true
        
        view.addSubview(AutoDoneLabel)
        AutoDoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        AutoDoneLabel.topAnchor.constraint(equalTo: middleGapeSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(AutoDoneSwitch)
        AutoDoneSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        AutoDoneSwitch.topAnchor.constraint(equalTo: middleGapeSwitch.bottomAnchor, constant: 15).isActive = true
        
        view.addSubview(AutoArrangeLabel)
        AutoArrangeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        AutoArrangeLabel.topAnchor.constraint(equalTo: AutoDoneSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(AutoArrangeSwitch)
        AutoArrangeSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        AutoArrangeSwitch.topAnchor.constraint(equalTo: AutoDoneSwitch.bottomAnchor, constant: 15).isActive = true
        
        view.addSubview(ShowBorderLabel)
        ShowBorderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        ShowBorderLabel.topAnchor.constraint(equalTo: AutoArrangeSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(ShowBorderSwitch)
        ShowBorderSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        ShowBorderSwitch.topAnchor.constraint(equalTo: AutoArrangeSwitch.bottomAnchor, constant: 15).isActive = true
        
        view.addSubview(ShowBorderLabel)
        ShowBorderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        ShowBorderLabel.topAnchor.constraint(equalTo: AutoArrangeSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(ShowBorderSwitch)
        ShowBorderSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        ShowBorderSwitch.topAnchor.constraint(equalTo: AutoArrangeSwitch.bottomAnchor, constant: 15).isActive = true
        
        
        view.addSubview(passwordProtectedLabel)
        passwordProtectedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        passwordProtectedLabel.topAnchor.constraint(equalTo: ShowBorderSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(passwordProtectedSwitch)
        passwordProtectedSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        passwordProtectedSwitch.topAnchor.constraint(equalTo: ShowBorderSwitch.bottomAnchor, constant: 15).isActive = true
        
        
        view.addSubview(ShowIndicatorLabel)
        ShowIndicatorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        ShowIndicatorLabel.topAnchor.constraint(equalTo: passwordProtectedSwitch.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(ShowIndicatorSeg)
        ShowIndicatorSeg.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        ShowIndicatorSeg.topAnchor.constraint(equalTo: passwordProtectedSwitch.bottomAnchor, constant: 15).isActive = true
        
        
        view.addSubview(NumberOfDigitsLabel)
        NumberOfDigitsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        NumberOfDigitsLabel.topAnchor.constraint(equalTo: ShowIndicatorSeg.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(NumberOfDigitsStepper)
        NumberOfDigitsStepper.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        NumberOfDigitsStepper.topAnchor.constraint(equalTo: ShowIndicatorSeg.bottomAnchor, constant: 15).isActive = true
        
        
        
        view.addSubview(gapeSliderLabel)
        gapeSliderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        gapeSliderLabel.topAnchor.constraint(equalTo: NumberOfDigitsStepper.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(gapeSlider)
        gapeSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gapeSlider.topAnchor.constraint(equalTo: gapeSliderLabel.bottomAnchor).isActive = true
        gapeSlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        gapeSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        view.addSubview(ResetButton)
        ResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        ResetButton.topAnchor.constraint(equalTo: gapeSlider.bottomAnchor,constant: 20).isActive = true
        ResetButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        ResetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(ShowNumberButton)
        ShowNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        ShowNumberButton.topAnchor.constraint(equalTo: gapeSlider.bottomAnchor,constant: 20).isActive = true
        ShowNumberButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        ShowNumberButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(getFromClipboard)
        getFromClipboard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        getFromClipboard.topAnchor.constraint(equalTo: ShowNumberButton.bottomAnchor,constant: 20).isActive = true
        getFromClipboard.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getFromClipboard.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func OTPTextViewResult(number: String?) {
        
        if number != nil
        {
            let alert = UIAlertController(title: "Alert", message: number, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @objc func hideKeyboard()
    {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        OTPTextVU.delegate = self
        OTPTextVU.isFirstResponser = true
        
    }
}


//         OTPTextVU.isPasswordProtected = false
//
//
//         OTPTextVU.isFirstResponser = false
//


