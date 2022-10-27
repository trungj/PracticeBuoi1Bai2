//
//  ViewController.swift
//  MyCalculator
//
//  Created by trung on 26/10/2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var calculatorWorking: UITextField!
    
    @IBOutlet weak var calculatorResult: UITextField!
    
    var workings:String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        
    }
    
    func clearAll()
        {
            workings = ""
            calculatorWorking.text = ""
            calculatorResult.text = ""
        }
    
    @IBAction func equalsTap(_ sender: UIButton) {
        if(validInput())
                {
                    let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                    let expression = NSExpression(format: checkedWorkingsForPercent)
                    let result = expression.expressionValue(with: nil, context: nil) as! Double
                    let resultString = formatResult(result: result)
                    calculatorResult.text = resultString
                }
                else
                {
                    let alert = UIAlertController(
                        title: "Invalid Input",
                        message: "Calculator unable to do math based on input",
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
    }
    
    func validInput() ->Bool
        {
            var count = 0
            var funcCharIndexes = [Int]()
            
            for char in workings
            {
                if(specialCharacter(char: char))
                {
                    funcCharIndexes.append(count)
                }
                count += 1
            }
            
            var previous: Int = -1
            
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                
                if(index == workings.count - 1)
                {
                    return false
                }
                
                if (previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }
                previous = index
            }
            
            return true
        }
        
        func specialCharacter (char: Character) -> Bool
        {
            if(char == "*")
            {
                return true
            }
            if(char == "/")
            {
                return true
            }
            if(char == "+")
            {
                return true
            }
            return false
        }
        
        func formatResult(result: Double) -> String
        {
            if(result.truncatingRemainder(dividingBy: 1) == 0)
            {
                return String(format: "%.0f", result)
            }
            else
            {
                return String(format: "%.2f", result)
            }
        }
    
    
    @IBAction func allClearTap(_ sender: UIButton) {
        clearAll()
    }
    
    
    
    
    func addToWorkings(value: String)
        {
            workings = workings + value
            calculatorWorking.text = workings
        }
    
    
    @IBAction func divideTap(_ sender: UIButton) {
        addToWorkings(value: "/")
    }
    
    @IBAction func timesTap(_ sender: UIButton) {
        addToWorkings(value: "*")
    }
    
    @IBAction func minusTap(_ sender: UIButton) {
        addToWorkings(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    
    
    
    
    
    @IBAction func zeroTap(_ sender: UIButton) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneTap(_ sender: UIButton) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: UIButton) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: UIButton) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: UIButton) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: UIButton) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: UIButton) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: UIButton) {
        addToWorkings(value: "7")
    }
    
    
    @IBAction func eightTap(_ sender: UIButton) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: UIButton) {
        addToWorkings(value: "9")
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

