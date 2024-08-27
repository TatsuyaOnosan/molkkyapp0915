//
//  dentaku.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/07/31.
//

import Foundation

import SwiftUI

struct CalculatorView: View {
    @State private var display = "0"

    var body: some View {
        VStack {
            Text(display)
                .font(.largeTitle)
                .padding()
//            Spacer()
            HStack {
                Button(action: { self.buttonTapped("7") }) { Text("7") }
                Button(action: { self.buttonTapped("8") }) { Text("8") }
                Button(action: { self.buttonTapped("9") }) { Text("9") }
                Button(action: { self.buttonTapped("/") }) { Text("/") }
            }
            HStack {
                Button(action: { self.buttonTapped("4") }) { Text("4") }
                Button(action: { self.buttonTapped("5") }) { Text("5") }
                Button(action: { self.buttonTapped("6") }) { Text("6") }
                Button(action: { self.buttonTapped("*") }) { Text("*") }
            }
            HStack {
                Button(action: { self.buttonTapped("1") }) { Text("1") }
                Button(action: { self.buttonTapped("2") }) { Text("2") }
                Button(action: { self.buttonTapped("3") }) { Text("3") }
                Button(action: { self.buttonTapped("-") }) { Text("-") }
            }
            HStack {
                Button(action: { self.buttonTapped("0") }) { Text("0") }
                Button(action: { self.buttonTapped("=") }) { Text("=") }
                Button(action: { self.buttonTapped("+") }) { Text("+") }
            }
        }
    }

    func buttonTapped(_ symbol: String) {
//        if symbol == "=" {
//                // 数式の計算を実行
//                let expression = NSExpression(format: display)
//                if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
//                    display = "\(result)"
//                } else {
//                    display = "Error"
//                }
//            } else if symbol == "C" {
//                // 入力をクリア
//                display = "0"
//            } else {
//                // 入力を追加
//                if display == "0" {
//                    display = symbol
//                } else {
//                    display += symbol
//                }
            }
}

#Preview {
    CalculatorView()
}

