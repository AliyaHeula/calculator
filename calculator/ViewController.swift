//
//  ViewController.swift
//  calculator
//
//  Created by Aliya on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var holder: UIView!
    @IBOutlet weak var result: UILabel!
    var firstNumber = 0
    var secondNumber = 0
    var calcOperator = 0
    var lastOperator = 0
    var newEntry = true
    var stopCount = true
    
    
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
        stopCount = false
    }

    @IBAction func acButton(_ sender: Any) {
        result.text = "0"
        firstNumber = 0
        secondNumber = 0
        calcOperator = 0
        newEntry = true
        stopCount = true
        print("AC: clear")
    }
    
//    func ifOverflow(_ check: Int?) -> Int? {
//        if check == nil {
//            return nil
//        }
//    }
    
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
    
    @IBAction func operation(_ sender: Any) {
        let newOperator = Int((sender as AnyObject).tag)
        if calcOperator == 0 {
            firstNumber = secondNumber
        } else if stopCount == false {
            if calcOperator == 11 {
                firstNumber = firstNumber / secondNumber
                result.text = String(firstNumber)
            }
            else if calcOperator == 12 {
                firstNumber = firstNumber * secondNumber
                result.text = String(firstNumber)
            }
            else if calcOperator == 13 {
                firstNumber = firstNumber - secondNumber
                result.text = String(firstNumber)
            }
            else if calcOperator == 14 {
                firstNumber = firstNumber + secondNumber
                result.text = String(firstNumber)
            }
        }
        print ("\n a=\(firstNumber), b=\(secondNumber) result: \(result.text!)")
        printOperator(newOperator)
        secondNumber = firstNumber
        calcOperator = newOperator
        lastOperator = newOperator
        newEntry = true
        stopCount = true
    }
    
    @IBAction func eqBatton(_ sender: Any) {
        switch calcOperator {
        case 11:
            firstNumber = firstNumber / secondNumber
        case 12:
            firstNumber = firstNumber * secondNumber
        case 13:
            firstNumber = firstNumber - secondNumber
        case 14:
            firstNumber = firstNumber + secondNumber
        default:
            break
        }
        lastOperator = 15
        result.text = String(firstNumber)
        newEntry = true
        print ("\na=\(firstNumber), b=\(secondNumber) = \(result.text!)")
        stopCount = true
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

