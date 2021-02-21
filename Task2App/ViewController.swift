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
        guard calcTextField1.text!.isEmpty == false else {calcResultLabel.text = "数値を入力して下さい"; return}
        guard calcTextField2.text!.isEmpty == false else {calcResultLabel.text = "数値を入力して下さい"; return}

        let label1 = (calcTextField1.text! as NSString).doubleValue
        let label2 = (calcTextField2.text! as NSString).doubleValue

        let calculation = Calculation(rawValue: segmentedControl.selectedSegmentIndex)
        switch calculation {
        case .addition:
            let result = label1 + label2
            calcResultLabel.text = String(result)
        case .subtraction:
            let result = label1 - label2
            calcResultLabel.text = String(result)
        case .multiplication:
            let result = label1 * label2
            calcResultLabel.text = String(result)
        case .division:
            guard label2 != 0 else {
                calcResultLabel.text = "割る数には0以外を入力して下さい"
                return
            }
            let result = label1 / label2
            calcResultLabel.text = String(result)
        case .none:
            break
        }
    }
}
