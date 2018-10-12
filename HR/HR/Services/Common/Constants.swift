//
//  Constants.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

class Constants: NSObject {

    // MARK: - REGEX
    public static let userNameRegex: String = "^[A-Z0-9a-z_]{4,20}"
    public static let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    public static let passwordRegex: String = "^.{8,64}$"
    public static let zipCodeRegex: String = "\\d{5}"
    public static let alphanumericRegex: String = "^[a-zA-Z0-9 ]*$"
    public static let numericRegex: String = "[0-9]+"
    public static let alphabetsRegex: String = "^[a-zA-Z][a-zA-Z\\s]+$"
    public static let alphabetsWithUnicodeRegex: String = "^[a-zA-Z.'-\u{00e8}-\u{00BF}-\u{1FFF}\u{2C00}-\u{D7FF} ][a-zA-Z\\s.'-\u{00e8}-\u{00BF}-\u{1FFF}\u{2C00}-\u{D7FF} ]+$"
    public static let alphabetsAddressRegex: String = "^[a-zA-Z.,][a-zA-Z.,\\s]+$"
    public static let zipCodeUSRegex: String = "(^\\d{5}(-\\d{4})?$)|(^[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1} *\\d{1}[A-Z]{1}\\d{1}$)"
    public static let phoneNumberRegex: String = "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$"
    public static let charactorRegex: String = ".*[a-zA-Z]+.*"
    
    public static let zipCodeCARegex: String = "^([A-Za-z]\\d[A-Za-z]?\\d[A-Za-z]\\d)"
    public static let firstAlphabetRegex: String = "^[a-zA-Z]"
    public static let HTMLRegex: String = "<([a-z]*|/[a-z]*)>"
    public static let alphabetsOnlyRegex = "^[A-Za-z ]+$"
    public static let alphanumericwithcommaAndDotRegex = "^[a-zA-Z0-9,. ]*$"
    
    public static let passwordRegex_one_upperCase: String = ".*[A-Z]+.*"
    public static let passwordRegex_one_lowerCase: String = "^(?=.*[a-z]).*$"
    public static let passwordRegex_one_number: String = "^(?=.*[0-9]).*$"
    public static let passwordRegex_one_symbol: String = "^(?=.*[!@#$%&_]).*$"
    
    public static let passwordRule: String = """
    Have eight (8) or more characters, and three (3) of these:
    Password
    · One (1) upper case letter.
    · One (1) lower case letter.
    · One (1) number (0-9).
    · One (1) special character (~!@#$
    %^&*_-+=`|\({})[]:;'<>,.?/).
    Password Strength:
    Strong (Recommended)
    Please note: Passwords are case
    sensitive
    """
    
    // MARK: - Timeout constant for Request
    public static let kRequestTimeOut = 120
    
    // MARK: - User Defaults Keys
    public static let UserNameKey = "Username"
    public static let DeviceIDKey = "DeviceID"
    
    // MARK: - Story Board Names
    public struct Storyboard {
        public static let main = "Main"
    }
}
