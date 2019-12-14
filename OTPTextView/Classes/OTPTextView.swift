//
//  OTPTextView.swift
//  OTPTextView
//
//  Created by Ehsanomid on 5/27/18..
//  Copyright © 2018 Ehsan Omid. All rights reserved.
// GitHub : https://github.com/ehsanomid  Email : imehsan@icloud.com

import UIKit

public protocol OTPTextViewDelegate {
    
    func OTPTextViewResult( number:String?)
}

@IBDesignable
public class OTPTextView: UIView {
    
    public var delegate:OTPTextViewDelegate!
    
    // All textfield are generated and stored here
    public  var textfieldContainer = [UITextField]()
    
    // Cursert Defailt tint-color
    public var cursorColor = UITextField.appearance().tintColor
    
    private var firstTxt = UITextField()
    
    // the moving line underneath of textfields
    public var underLineIndicator = UIView() // Small one
   
    
    public var isPasswordProtected : Bool = false
    {
        didSet
        {
            refresh()
        }
    }
    
    public enum indicatorStyleMode
    {
        case none
        case underline
      
        
    }
 
    public var indicatorStyle = indicatorStyleMode.none
    {
        didSet
        {
            refresh()
        }
    }

    
    // All boarders' Attributes
    
    @IBInspectable public var onErrorBorderColor:UIColor        = .red
    @IBInspectable public var borderColor:UIColor               = .gray
    @IBInspectable public var onEnterBoarderColor:UIColor       = .orange
    @IBInspectable public var onLeaveBoarderColor:UIColor       = .gray
    @IBInspectable public var onFilledBorderColor:UIColor       = .darkGray
    @IBInspectable public var onSuccessBoarderColor:UIColor     = .blue
    @IBInspectable public var onAllFilledBoarderColor:UIColor   = .green
    @IBInspectable public var placeHolderColor:UIColor          = .lightGray
    
    @IBInspectable public var indicatorColor:UIColor = .red
    {
            didSet
        {
                refresh()
        }
    }
    
    
    @IBInspectable public var txtColor:UIColor = .orange
    
    
    @IBInspectable public var IndicatorGapeFromTop:CGFloat = 4
        {
        didSet
        {
            refresh()
        }
    }
    
    @IBInspectable public var middleGape:CGFloat = 50
        {
        didSet
        {
            refresh()
            MiddleGapeToggle(with: middleGape)

            
        }
    }
    @IBInspectable public var forceCompletion:Bool = true
    @IBInspectable public var callOnCompleted:Bool = false
    @IBInspectable public var AutoArrange:Bool = true
        {
        didSet
        {
            refresh()
        }
    }
    
    @IBInspectable public var shouldClipboardAndDigitsEqual:Bool = true
         {
         didSet
         {
             refresh()
         }
     }
     
    
    
    @IBInspectable public var isBorderHidden:Bool = true
        {
        didSet
        {
            refresh()
        }
    }
    
    @IBInspectable public var onEnterBorderWidth:CGFloat = 2
        {
        didSet
        {
            refresh()
        }
    }
    @IBInspectable public var onLeaveBorderWidth:CGFloat = 1
        {
        didSet
        {
            refresh()
        }
    }
    
    
    @IBInspectable public var borderSize:CGFloat = 1
        {
        didSet
        {
            refresh()
        }
    }
    @IBInspectable public var BorderRadius:CGFloat = 10
        {
        didSet
        {
            refresh()
        }
    }
    @IBInspectable public var isFirstResponser:Bool = false
        {
        didSet
        {
            
            refresh()
        }
        
    }
    @IBInspectable public var BlockSize:CGSize = CGSize(width: 40, height: 40)
        {
        didSet
        {
            reCreate()
            
        }
    }
    
    @IBInspectable public var BlocksNo:Int = 5
        {
        didSet
        {
            generateTextfields()
        }
    }
    
    func generateTextfields()
    {
        reCreate()
    }
    
    
    @IBInspectable public var gape:CGFloat = 10
        {
        didSet
        {
            refresh()
        }
    }
    
    
    
    @IBInspectable public var showCursor:Bool = true
        {
        didSet
        {
            cursorColor =  showCursor ?  UITextField.appearance().tintColor : UIColor.clear
            refresh()
        }
    }
    
    
    @IBInspectable public var fontSize:CGFloat = 30
        {
        didSet
        {
            refresh()
        }
    }
    
    @IBInspectable public var placeHolder:String = "⦿"
        {
        didSet
        {
            refresh()
        }
    }
    
    
    func reCreate()
    {
        self.subviews.forEach { $0.removeFromSuperview() }
        textfieldContainer.removeAll()
        setup()
    }
    
    
   public func AutoFillByFrameSize()
    {
        for i in 0...textfieldContainer.count - 1
        {
            let txt = textfieldContainer[i] as! EOTextfield
            txt.frame = CGRect(x: (BlockSize.width * CGFloat(i)) + (CGFloat(i) * 100), y: 0, width: BlockSize.width, height: BlockSize.height)
            
        }
    }
    
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        refresh()
    }
    
    
    open func getFromClipBoardAndFill() -> Bool
    {
        let pasteboardString: String? = UIPasteboard.general.string
        if let otpStr = pasteboardString {
            
            if (otpStr.count == BlocksNo) && shouldClipboardAndDigitsEqual
            {
                for (index,st) in otpStr.enumerated()
                {
                    textfieldContainer[index].text = String(st)
                }
                
                return true
            }
        }
        
        return false
    }
    
    
    func refresh()
    {
           
        if bounds.width <  (CGFloat(BlocksNo) * BlockSize.width)
        {
            print("OTPTextView: ( You don't have ample space for showing all )")
        }
        
        let CG = (bounds.width - (CGFloat(BlocksNo) * BlockSize.width)) / CGFloat(BlocksNo)
        
        
        for i in 0...textfieldContainer.count - 1
        {
            let txt = textfieldContainer[i] as! EOTextfield
            if AutoArrange
            {
                txt.frame = CGRect(x: ((BlockSize.width + CG) * CGFloat(i)) + (CG / 2), y: 0, width: BlockSize.width, height: BlockSize.height)
            } else
            {
                txt.frame = CGRect(x: (BlockSize.width * CGFloat(i)) + (CGFloat(i) * gape), y: 0, width: BlockSize.width, height: BlockSize.height)
                
            }
            
            txt.center = CGPoint(x: txt.center.x , y: frame.height / 2)
            
            if isBorderHidden
            {
                
                txt.layer.borderWidth = 0
                
            } else
            {
                txt.layer.borderWidth = borderSize
                txt.layer.borderColor = borderColor.cgColor
                txt.layer.cornerRadius = BorderRadius
            }
            
            
            txt.tintColor = cursorColor
            txt.keyboardType = .numberPad
            txt.textAlignment = .center
            txt.font = UIFont.boldSystemFont(ofSize: fontSize)
            txt.textColor = txtColor
            txt.isSecureTextEntry = isPasswordProtected
            txt.attributedPlaceholder = NSAttributedString(string: placeHolder,
            attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
            
        }
        
        underLineIndicator.backgroundColor = indicatorColor

        firstTxt = textfieldContainer[0] // it keeps the first Textfield
        underLineIndicator.center = CGPoint(x: firstTxt.center.x, y: firstTxt.center.y + firstTxt.frame.height / 2 + IndicatorGapeFromTop )
        
        
        
        
        switch self.indicatorStyle
        {
            
        case .none:
            
            self.underLineIndicator.isHidden = true
            
        case .underline:
            self.underLineIndicator.isHidden = false
     
        }
        
        if isFirstResponser
        {
            firstTxt.becomeFirstResponder()
        }
        
    }
    
    private func MiddleGapeToggle(with Gape:CGFloat)
    {
        
        if ( BlocksNo % 2 == 0)
        {
            let midSide = BlocksNo / 2

            for i in 0...textfieldContainer.count - 1
            {
                let txt = textfieldContainer[i]
                print(textfieldContainer[i])

                if i < midSide
                {
                    txt.center.x -= Gape
  
                } else
                {
                    txt.center.x += Gape
                }
                
            }
       
        }
    }
    
    func setup()
    {
        
        
        for i in 0...BlocksNo - 1
        {
            let txt = EOTextfield()
            addSubview(txt)
            
            // All delegation are defined here
            txt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            txt.addTarget(self, action: #selector(textFieldShouldBeginEditing(_:)), for: .editingDidBegin)
            txt.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
            
            
            
            // Initial Properties
            txt.tintColor = cursorColor
            txt.keyboardType = .numberPad
            txt.textAlignment = .center
            txt.font = UIFont.boldSystemFont(ofSize: 30)
            txt.textColor = txtColor
            txt.isSecureTextEntry = isPasswordProtected
            txt.attributedPlaceholder = NSAttributedString(string: placeHolder,
                      attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])

            
            txt.flag = i //
            
            textfieldContainer.append(txt)
        }
        
        underLineIndicator = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 2))
        addSubview(underLineIndicator)
        
       
        
        if isFirstResponser
        {
            firstTxt.becomeFirstResponder()
            firstTxt.text = " "
            
        }
        
        refresh()
    }
    
    
    @objc func textFieldDidChange(_ textField: EOTextfield) {
        
        
        textField.text = textField.text!.EOreplace(target: " ", withString: "")
        
        
        if (textField.text!.count == 1) {
            let ff = textField.text
            textField.text =  String(ff!.prefix(1))
        }
            
        else if (textField.text!.count == 2) {
            let ff = textField.text
            textField.text =  String(ff!.suffix(1))
        }
        
        
        if textField.text == "" && textField.flag > 0
        {
            
            textfieldContainer[textField.flag - 1].becomeFirstResponder()
            textfieldContainer[textField.flag].layer.borderColor = borderColor.cgColor
        }
        else
        {
            if textField.text!.utf16.count == 1 && textField.flag < textfieldContainer.count - 1
            {
                textfieldContainer[textField.flag + 1].becomeFirstResponder()
                if Int(textField.text!) == nil{
                    
                    textField.text = " "
                }
            }
        }
        
        var sum = 0
        
        for tx in textfieldContainer
        {
            
            if tx.text != "" && tx.text != " "
            {
                sum += 1
            }
            
        }
        
        if sum == BlocksNo
        {
            for txt in textfieldContainer
            {
               
                txt.layer.borderColor = onAllFilledBoarderColor.cgColor
                
            }
            
            if callOnCompleted
            {
              
                delegate?.OTPTextViewResult(number: getNumber())
            }
        }
        
    }
    
    
 
    @objc  func textFieldShouldBeginEditing(_ textField: EOTextfield) {
        
        
        
        for tx in textfieldContainer
        {
            if !isBorderHidden
            {
                tx.layer.borderColor = onFilledBorderColor.cgColor
                tx.layer.borderWidth = onLeaveBorderWidth
            }
        }
        
        if !isBorderHidden
        {
            textField.layer.borderColor = onEnterBoarderColor.cgColor
            textField.layer.borderWidth = onEnterBorderWidth
        }
        
        
        
        UIView.animate(withDuration: 0.3) {
            
            
            switch self.indicatorStyle
            {
                
            case .none:
                break
                
            case .underline:
                self.underLineIndicator.center = CGPoint(x: textField.center.x , y: self.underLineIndicator.center.y)
                
            
            }
            
            
            
        }
        
        
        if textField.text == ""
        {
            textField.text = " "
        }
        
        
        
        
    }
    
    @objc func textFieldDidEndEditing(_ textField: EOTextfield) {
        
        if textField.text == ""
        {
            if !isBorderHidden
            {
                textField.layer.borderColor = borderColor.cgColor
            }
            
        }
        
    }
    
   public func getNumber() -> String?
    {
        var number = ""
        for txt in textfieldContainer
        {
            if (txt.text == "" || txt.text == " ") && forceCompletion
            {
                txt.becomeFirstResponder()
                txt.layer.borderColor = onErrorBorderColor.cgColor
                
                flash(from: textfieldContainer.firstIndex(of:txt)!, to: textfieldContainer.count - 1, speed: 1)
                return nil
            }
            number += txt.text!
        }
        return number
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
        
    }
    
    
   public func clearAll()
    {
        for txt in textfieldContainer
        {
            txt.text = ""
            becomeResponserAt(at: 0)
        }
    }
    
    func becomeResponserAt(at index:Int)
    {
        if index < textfieldContainer.count && index >= 0
        {
            textfieldContainer[index].becomeFirstResponder()
        } else
        {
            print("out of range")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print(#function)
        setup()
    }
    
 public func onSuccess()
    {
        
        for txt in textfieldContainer
        {
            txt.resignFirstResponder()
            if !isBorderHidden
            {
                txt.layer.borderColor = onSuccessBoarderColor.cgColor
                txt.layer.borderWidth = 0
            }
        }
    }
    
  public  func flash(from:Int, to:Int, speed:Double)
    {
        for i in from...to
        {
            
            
            textfieldContainer[i].alpha = 0
            UIView.animate(withDuration: speed) {
                self.textfieldContainer[i].alpha = 1
            }
        }
    }

    public func flashAll(speed:Double)
    {
        for txt in textfieldContainer
        {
            txt.alpha = 0
            UIView.animate(withDuration: speed) {
                txt.alpha = 1
            }
        }
    }
    
}

class EOTextfield: UITextField {
    
    var flag:Int = Int()
    
}


extension String
{
    func EOreplace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
