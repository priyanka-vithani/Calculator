//
//  ViewController.swift
//  Calculator
//
//  Created by Apple on 22/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDisplay: UILabel!
    
    private var isFinishedTypingNumber:Bool = true
    
    private var displayValue : Double{
        get{
             guard let number = Double(lblDisplay.text!) else{
                       fatalError("can not convert display label text to double")
                   }
            return number
        }
        set{
            lblDisplay.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalc_clk(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle{
            calculator.setNumber(displayValue)
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
           
    }
    @IBAction func btnNumber_clk(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber{
                lblDisplay.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "."{
                    
                    guard let currentDisplayValue = Double(lblDisplay.text!) else {
                        fatalError("Can not convert display label text to double")
                    }
                     let isInt = floor(Double(lblDisplay.text!)!) == Double(lblDisplay.text!)
                   
                    if !isInt{
                        return
                    }
                    
                }
                lblDisplay.text?.append(contentsOf: numValue)
            }
            
           
        }
        
    }
    
}

