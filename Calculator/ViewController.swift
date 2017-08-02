//
//  ViewController.swift
//  Calculator
//
//  Created by David Para on 7/25/17.
//  Copyright © 2017 Udemy_ParaD. All rights reserved.
//

import UIKit

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        clear()
        clearAll()
    }

    private var floatingPoint = false
    private var negative = false
    private var allClear = true
    private var resetZero = true
    
    private var value1: Double = 0.0
    private var value2: Double = 0.0
    
    private var operation: String?
    
    private let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet weak var clearButton: CustomButton!
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        if allClear {
            clearAll()
        } else {
            clear()
        }
    }
    
    @IBAction func valueButtonPressed(_ sender: UIButton) {
        if allClear {
            clearButton.setTitle("C", for: .normal)
            allClear = false
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        value1 = Double(calculatorDisplay.text!)!
        value2 = 0.0
        
        resetDisplay()
    }
    
    @IBAction func button0pressed(_ sender: UIButton) {
        addNumberToDisplay("0")
    }
    
    @IBAction func button1pressed(_ sender: UIButton) {
        addNumberToDisplay("1")
    }
    
    @IBAction func button2pressed(_ sender: UIButton) {
        addNumberToDisplay("2")
    }
    
    @IBAction func button3pressed(_ sender: UIButton) {
        addNumberToDisplay("3")
    }
    
    @IBAction func button4pressed(_ sender: UIButton) {
        addNumberToDisplay("4")
    }
    
    @IBAction func button5pressed(_ sender: UIButton) {
        addNumberToDisplay("5")
    }
    
    @IBAction func button6pressed(_ sender: UIButton) {
        addNumberToDisplay("6")
    }
    
    @IBAction func button7pressed(_ sender: UIButton) {
        addNumberToDisplay("7")
    }
    
    @IBAction func button8pressed(_ sender: UIButton) {
        addNumberToDisplay("8")
    }
    
    @IBAction func button9pressed(_ sender: UIButton) {
        addNumberToDisplay("9")
    }
    
    @IBAction func buttonDecimalPressed(_ sender: UIButton) {
        addDecimalToDisplay()
    }
    
    @IBAction func buttonPosNegPressed(_ sender: UIButton) {
        let value = -(Double(calculatorDisplay.text!)!)
        calculatorDisplay.text = value.cleanValue
    }
    
    @IBAction func buttonPercentPressed(_ sender: UIButton) {
        let value = Double(calculatorDisplay.text!)! / 100.0
        calculatorDisplay.text = value.cleanValue
    }
    
    @IBAction func buttonDivPressed(_ sender: UIButton) {
        operation = "/"
    }
    
    @IBAction func buttonMultPressed(_ sender: UIButton) {
        operation = "*"
    }
    
    @IBAction func buttonSubPressed(_ sender: UIButton) {
        operation = "-"
    }
    
    @IBAction func buttonAddPressed(_ sender: UIButton) {
        operation = "+"
    }
    
    @IBAction func buttonEqualsPressed(_ sender: UIButton) {
        if operation != nil {
            
            if value2 == 0.0 {
                value2 = Double(calculatorDisplay.text!)!
            }
            
            switch operation! {
            case "/":
                value1 /= value2
            case "*":
                value1 *= value2
            case "-":
                value1 -= value2
            case "+":
                value1 += value2
            default:
                break
            }
            
            if value1 > 9_999_999_999 {
                numberFormatter.numberStyle = .scientific
                numberFormatter.exponentSymbol = "e"
                numberFormatter.positiveFormat = "0.#####E+0"
                
                calculatorDisplay.text = numberFormatter.string(from: value1 as NSNumber)
            } else {
                calculatorDisplay.text = String(value1.cleanValue)
            }
        }
    }
    
    private func addNumberToDisplay(_ number: String) {
        var displayText = calculatorDisplay.text!
        
        if resetZero || displayText == "0" {
            displayText = ""
            resetZero = false
        }
        
        if displayText.characters.count < 10 {
            displayText += number
        }
        
        calculatorDisplay.text = displayText
    }
    
    private func addDecimalToDisplay() {
        var displayText = calculatorDisplay.text!
        
        if resetZero {
            displayText = "0"
            resetZero = false
        }
        
        if !floatingPoint {
            displayText += "."
            floatingPoint = true
        }
        
        calculatorDisplay.text = displayText
    }
    
    /*
     Clears display and resets all stored values and
     operations.
     */
    
    private func clearAll() {
        value1 = 0.0
        value2 = 0.0
        operation = nil
    }
    
    /*
     Clears display and enable AC button.
     */
    
    private func clear() {
        resetDisplay()
        calculatorDisplay.text = "0"
        clearButton.setTitle("AC", for: .normal)
        allClear = true
    }
    
    /*
     Resets the display for next input. Keeps temporary value
     and operation stored.
     */
    
    private func resetDisplay() {
        calculatorDisplay.text = String(Double(calculatorDisplay.text!)!.cleanValue)
        floatingPoint = false
        negative = false
        resetZero = true
    }

}
