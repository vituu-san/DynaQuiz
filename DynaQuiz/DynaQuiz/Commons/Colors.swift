//
//  Colors.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import UIKit
import SwiftUI

struct Colors {
    static let border: Color = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    static let line: Color = Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))

    struct Background {
        static let normal: Color = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        static let colored: Color = Color(#colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1))
    }

    struct Button {
        struct Normal {
            static let background: Color = Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1137254902, alpha: 1))
            static let disabled: Color = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }

        struct Option {
            static let background: Color = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            static let selected: Color = Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
            static let wrong: Color = Color(#colorLiteral(red: 0.863048017, green: 0, blue: 0, alpha: 1))
            static let correct: Color = Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        }
    }

    struct Text {
        static let light: Color = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        static let dark: Color = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    }
}
