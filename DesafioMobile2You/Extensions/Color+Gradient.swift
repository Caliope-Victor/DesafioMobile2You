//
//  Color+Gradient.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 26/07/22.
//

import Foundation
import SwiftUI

extension Color {
    static var gradient: Gradient {
        let adaptableColor = Color(UIColor{
            $0.userInterfaceStyle == .dark ? .black : .white
        })
        
        let gradient = Gradient(colors: [
            .clear,
            adaptableColor.opacity(0.05),
            adaptableColor.opacity(0.1),
            adaptableColor.opacity(0.2),
            adaptableColor.opacity(0.3),
            adaptableColor.opacity(0.4),
            adaptableColor.opacity(0.6),
            adaptableColor.opacity(0.8),
            adaptableColor,
            adaptableColor,
            adaptableColor,
            adaptableColor,
            adaptableColor
        ])
        
        return gradient
    }
}
