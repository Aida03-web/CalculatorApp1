//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Аида Газиз on 13.01.2022.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var myDisplay: UILabel!
    
    var typing: Bool = false
    @IBAction func digitPressed(_ sender: UIButton)
    {

        let current_digit = sender.titleLabel?.text
        if typing
        {
            let current_display = myDisplay.text!
            myDisplay.text = current_display + current_digit!
        }
        else
        {
            myDisplay.text = current_digit
            typing = true
            
        }
    }
    var displayValue: Double{
        get
        {
            return Double(myDisplay.text!)!
        }
        set
        {
            myDisplay.text = String(newValue)
        }
    }
     
    private var calculatorModel = CalculatorModel()
    @IBAction func operationPressed(_ sender: UIButton) {
        let operation = sender.titleLabel?.text
        calculatorModel.setOperand(displayValue)
        calculatorModel.performOperation(operation: operation!)
        displayValue = calculatorModel.result!
        typing = false
        
    }
    

}

