//
//  initViewController.swift
//  OTPTextView_Example
//
//  Created by ehsan on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class initViewController: UIViewController {
    
    let showButton : UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Show OTP", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
        return btn
        
        
    }()
    
    
    let otpCode : UITextField = {
        
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        txt.textColor = .darkGray
        txt.textAlignment = .center
        return txt
        
    }()
    
    
    @objc func showButtonTapped()
    {
        let vc = ViewController()
        
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(showButton)
        showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        showButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(otpCode)
        otpCode.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        otpCode.bottomAnchor.constraint(equalTo: showButton.topAnchor,constant: -10).isActive = true
        otpCode.widthAnchor.constraint(equalToConstant: 300).isActive = true
        otpCode.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Do any additional setup after loading the view.
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
