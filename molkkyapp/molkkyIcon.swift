//
//  CustomIcon.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/07/24.
//

import SwiftUI

struct CustomIcon: View {
    var body: some View {
        HStack {
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 5, height: 20)
                    .foregroundColor(.brown)
        }
//            Rectangle()
//                .frame(width: 20, height: 20)
//                .foregroundColor(.brown)
    }
}

