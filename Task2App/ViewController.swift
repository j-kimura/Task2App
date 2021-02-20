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
        guard calcTextField1.text != "" else {calcResultLabel.text = "数値を入力して下さい"; return}
        guard calcTextField2.text != "" else {calcResultLabel.text = "数値を入力して下さい"; return}

        let label1 = (calcTextField1.text! as NSString).doubleValue
        let label2 = (calcTextField2.text! as NSString).doubleValue

        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let result = label1 + label2
            calcResultLabel.text = String(result)
        case 1:
            let result = label1 - label2
            calcResultLabel.text = String(result)
        case 2:
            let result = label1 * label2
            calcResultLabel.text = String(result)
        case 3:
            if label2 == 0 {
                calcResultLabel.text = "割る数には0以外を入力して下さい"
                break
            }
            let result = label1 / label2
            calcResultLabel.text = String(result)
        default:
            break
        }
    }
}
