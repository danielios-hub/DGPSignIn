//
//  DGPLoginConfig.swift
//  LoginFramework
//
//  Created by Daniel Gallego Peralta on 16/2/21.
//

import UIKit

public struct DGPLoginConfig {
    static public var shared = DGPLoginConfig()
    
    public let minLengthUsername: Int
    public let minLengthPassword: Int
    public let actionFont: UIFont
    public let titleFont: UIFont
    public let textfieldFont: UIFont
    
    public let textData : TextConstants = TextConstants()
    public let mainBackgroundColor = UIColor.emerald
    public let secondaryBackgroundColor = UIColor.emeraldDark
    
    public let navigationBarColor = UIColor.emerald
    public let navigationTintColor = UIColor.white
    
    public init() {
        minLengthUsername = 4
        minLengthPassword = 6
        actionFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        titleFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        textfieldFont = UIFont.systemFont(ofSize: 15, weight: .regular)
        
    }
}

public struct TextConstants {
    public let buttonLogin = "Sign In"
    public let buttonRegister = "Sign Up"
    public let placeholderUsername = "Username or email"
    public let placeholderPassword = "Password"
    public let placeholderEmail = "Email"
    public let placeholderRepeatPassword = "Repeat password"
    public let tryAgain = "something went wrong, please try again"
    public let errorLogin = "username/password incorrect"
    public let errorUsernameShort = "Username need a min of 4 characters"
    public let errorEmailFormat = "Email wrong format"
    public let errorPasswordFormat = "Password need a min of 6 characters"
    public let errorPasswordRepeat = "Passwords are different"
    public let appName = "Sign Up"
    
}
