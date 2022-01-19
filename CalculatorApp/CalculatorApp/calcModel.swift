//
//  calcModel.swift
//  CalculatorApp
//
//  Created by Аида Газиз on 13.01.2022.
//

import Foundation

enum Operation
{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double, Double)->Double)
    case equals
}

func addition(op1: Double, op2: Double)->Double
{
    return op1+op2
}
struct CalculatorModel


{
    private var global_value: Double?
    var my_operation: Dictionary<String,Operation> =
    [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "+": Operation.binaryOperation(addition),
        "=": Operation.equals
    ]
    //private var global_value: Double?
    mutating func setOperand(_ operand: Double)
    {
        global_value = operand
    }
   mutating func performOperation(operation: String)
    {
     let symbol = my_operation[operation]!
     switch symbol
        {
     case .constant(let value):
         global_value = value
     case .unaryOperation(let function):
         global_value = function(global_value!)
     case .binaryOperation(let function):
         saving = SaveFirstOperandAndOperation(firstOperand: global_value!, operation: function)
     case .equals:
         if global_value != nil
         {
             global_value = saving?.performOperationWith(secondOperand: global_value!)
         }
         
        }
    
    }
    var result: Double?
    {
        get
        {
            return global_value
        }
    }
    private var saving: SaveFirstOperandAndOperation?
    struct SaveFirstOperandAndOperation
    {
        var firstOperand: Double
        var operation: (Double, Double)-> Double
        
        func performOperationWith(secondOperand op2: Double)-> Double
        {
            return operation(firstOperand, op2)
        }
    }
}
