//
//  ViewController.swift
//  Ex3
//
//  Created by 安井基哲 on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {

    // テキストフィールド２つ
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!

    // スイッチ２つ
    @IBOutlet private weak var plusMinus1Switch: UISwitch!
    @IBOutlet private weak var plusMinus2Switch: UISwitch!

    // 符号変換後number表示ラベル（初期値は0）
    @IBOutlet private weak var number1Label: UILabel!
    @IBOutlet private weak var number2Label: UILabel!

    // 結果表示ラベル（初期値は0）
    @IBOutlet private weak var resultLabel: UILabel!

    // 計算実行ボタンアクション
    @IBAction func runCalcButton(_ sender: Any) {

        // 各String?をint?に変換しintに変換。未入力や文字列が入力された際は0に変換
        let value1 = Int(number1TextField.text ?? "") ?? 0
        let value2 = Int(number2TextField.text ?? "") ?? 0

        // 符号変換の結果を格納
        let switchedValue1 = switchPrusMinus(val: value1, plusMinusSwitch: plusMinus1Switch.isOn)
        let switchedValue2 = switchPrusMinus(val: value2, plusMinusSwitch: plusMinus2Switch.isOn)

        // ラベルにそれぞれ表示
        number1Label.text = "\(switchedValue1)"
        number2Label.text = "\(switchedValue2)"

        // 足し算の結果を格納
        let result = switchedValue1 + switchedValue2

        // 結果表示ラベルに表示
        resultLabel.text = "\(result)"
    }

    // 数値とスイッチによって符号変換を行うメソッド
    func switchPrusMinus(val: Int, plusMinusSwitch: Bool) -> Int {

        // 戻り値
        let value: Int

        // スイッチがオンで符号変換
        if plusMinusSwitch == true {
            value = val * -1
        } else {
            value = val
        }

        return value
    }
}
