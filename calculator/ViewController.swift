//
//  ViewController.swift
//  calculator
//
//  Created by Aliya on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet var holder: UIView!
    @IBOutlet weak var result: UILabel!
    var firstNumber = 0 // number in buffer
    var secondNumber = 0 // number from the screen
    var calcOperator = 0 // 0: default, 11: /, 12: *, 13: -, 14: +
    var lastOperator = 0 // to monitor if previous operator was "="
    var newEntry = true // to monitor if operator or digit can be applied
//    var stopCount = true
    
    
    @IBAction func digits(_ sender: UIButton) {
        if lastOperator == 15 {
            calcOperator = 0
        }
        print(sender.tag, terminator: "")
        if newEntry == true {
            result.text = String(sender.tag)
                newEntry = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        if Int(result.text!) == nil {
            result.text = "overflow"
        } else {
            secondNumber = Int(result.text!)!
        }
//        stopCount = false
    }

    @IBAction func acButton(_ sender: Any) {
        result.text = "0"
        firstNumber = 0
        secondNumber = 0
        calcOperator = 0
        newEntry = true
//        stopCount = true
        print("AC: clear")
    }
    
    func printOperator(_ tag: Int) {
        switch tag {
        case 11:
            print(" / ", terminator: "")
        case 12:
            print(" * ", terminator: "")
        case 13:
            print(" - ", terminator: "")
        case 14:
            print(" + ", terminator: "")
        case 15:
            print(" = ", terminator: "")
        default:
            break
        }
    }
    
    func calculate(_ calcOperator: Int ,_ first: Int, _ second: Int) -> Int? {
        var result = (0, false)
        switch calcOperator {
        case 11:
            result = firstNumber.dividedReportingOverflow(by: secondNumber)
        case 12:
            result = firstNumber.multipliedReportingOverflow(by: secondNumber)
        case 13:
            result = firstNumber.remainderReportingOverflow(dividingBy: secondNumber)
        case 14:
            result = firstNumber.addingReportingOverflow(secondNumber)
        default:
            break
        }
        if result.1 == true {
            return nil
        }
        return result.0
    }
    
    @IBAction func operation(_ sender: Any) {
        let newOperator = Int((sender as AnyObject).tag)
        if calcOperator == 0 {
            firstNumber = secondNumber
//        } else if stopCount == false {
        } else if newEntry == false {
            let tmp = calculate(calcOperator, firstNumber, secondNumber)
            if tmp == nil {
                result.text = "overflow"
            } else {
                firstNumber = tmp!
                result.text = String(firstNumber)
            }
        }
        print ("\nresult: \(result.text!)")
        printOperator(newOperator)
        secondNumber = firstNumber
        calcOperator = newOperator
        lastOperator = newOperator
        newEntry = true
//        stopCount = true
    }
    
    @IBAction func eqBatton(_ sender: Any) {
        let tmp = calculate(calcOperator, firstNumber, secondNumber)
        if tmp == nil {
            result.text = "overflow"
        } else {
            firstNumber = tmp!
            result.text = String(firstNumber)
        }
        lastOperator = 15
        newEntry = true
        print ("\n= \(result.text!)")
//        stopCount = true
    }
    
    @IBAction func negative(_ sender: Any) {
        if secondNumber != 0 {
            secondNumber *= (-1)
            result.text = String(secondNumber)
            print("+/-: change sign of digit")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
