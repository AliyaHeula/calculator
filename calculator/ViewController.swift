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
    var number = 0
    @IBAction func digits(_ sender: UIButton) {
        result.text = result.text! + String(sender.tag)
        number = Int(result.text!)!
    }

    @IBAction func acButton(_ sender: Any) {
        result.text = ""
        number = 0
    }
    
    @IBAction func negative(_ sender: Any) {
        if number != 0 {
            number *= (-1)
            result.text = String(number)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

