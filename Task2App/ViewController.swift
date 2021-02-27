//
//  ViewController.swift
//  Task2App
//
//  Created by Jui Kimura on 2021/02/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var calcTextField1: UITextField!
    @IBOutlet private weak var calcTextField2: UITextField!

    @IBOutlet private weak var segmentedControl: UISegmentedControl!

    @IBOutlet private weak var calcResultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        calcResultLabel.text = "数値を入力して下さい"
        calcTextField1.keyboardType = .numberPad
        calcTextField2.keyboardType = .numberPad
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction private func calcButton(_ sender: Any) {
        enum Calculation: Int {
            case addition
            case subtraction
            case multiplication
            case division
        }

        guard let num1 = Double(calcTextField1.text!) else {
            calcResultLabel.text = "数値を入力して下さい"
            return
        }

        guard let num2 = Double(calcTextField2.text!) else {
            calcResultLabel.text = "数値を入力して下さい"
            return
        }

        guard let calculation = Calculation(rawValue: segmentedControl.selectedSegmentIndex) else {
            return
        }

        let result: Double

        switch calculation {
        case .addition:
            result = num1 + num2
        case .subtraction:
            result = num1 - num2
        case .multiplication:
            result = num1 * num2
        case .division:
            guard num2 != 0 else {
                calcResultLabel.text = "割る数には0以外を入力して下さい"
                return
            }
            result = num1 / num2
        }

        calcResultLabel.text = "\(result)"
    }
}
