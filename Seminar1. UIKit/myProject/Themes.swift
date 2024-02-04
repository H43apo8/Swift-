//
//  Themes.swift
//  myProject
//
//  Created by Максим Бобков on 25.01.2024.
//

import UIKit

protocol AppTheme {
    
    var backgroundColor: UIColor {get}
}

final class Theme {
    
    static var currentTheme: AppTheme = WhiteTheme()
}

final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
}

final class BlueTheme: AppTheme {
    var backgroundColor: UIColor = #colorLiteral(red: 0.5102659464, green: 1, blue: 0.980460465, alpha: 1)
}

final class GreenTheme: AppTheme {
    var backgroundColor: UIColor = #colorLiteral(red: 0, green: 1, blue: 0.4926850796, alpha: 1)
}
