//
//  Utilities.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

enum ScreenType: String {
    case iPhones_4_4S = "iPhone 4 or iPhone 4S"
    case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
    case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
    case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
    case iPhones_X_XS = "iPhone X or iPhone XS"
    case iPhone_XR = "iPhone XR"
    case iPhone_XSMax = "iPhone XS Max"
    case unknown
}

class Utilities: NSObject {
// MARK: - Application Config

    class func getCurrentlanguage() -> String {
        return NSLocale.current.languageCode!
    }
    
    class func getCurrentOS() -> String {
        return UIDevice.current.systemVersion
    }
    
    class func getDeviceModel() -> String {
        return UIDevice.current.model
    }
    
    class func getDeviceFullModel() -> String {
        return UIDevice.modelName
    }
    
    class func getDeviceID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    class func getScreenType() -> ScreenType {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 960:
                return .iPhones_4_4S
            case 1136:
                return .iPhones_5_5s_5c_SE
            case 1334:
                return .iPhones_6_6s_7_8
            case 1792:
                return .iPhone_XR
            case 1920, 2208:
                return .iPhones_6Plus_6sPlus_7Plus_8Plus
            case 2436:
                return .iPhones_X_XS
            case 2688:
                return .iPhone_XSMax
            default:
                return .unknown
            }
        } else {
            return .unknown
        }
    }
    
    open class func isValidUserName(_ userName: String) -> Bool {
        return (NSPredicate(format: "SELF MATCHES %@", Constants.userNameRegex)).evaluate(with: userName)
    }
    
    open class func isValidEmail(_ email: String) -> Bool {
        return (NSPredicate(format: "SELF MATCHES %@", Constants.emailRegex)).evaluate(with: email)
    }
    
    open class func isPasswordValid(_ password: String) -> Bool {
        return (NSPredicate(format: "SELF MATCHES %@", Constants.passwordRegex)).evaluate(with: password)
    }
    
    open class func isAnswerValid(_ answer: String) -> Bool {
        return (NSPredicate(format: "SELF MATCHES %@", Constants.charactorRegex)).evaluate(with: answer)
    }
    
    open class func isBlank( _ textString: String) -> Bool {
        
        if textString.isEmpty {
            return true
        }
        return false
    }
    
    class func setUpJsonFile(jsonFileName: String?) -> Data? {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) as Data
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    class func parseDataFromJsonFile(data: Data?) -> NSDictionary? {
        do {
            if let data = data {
                return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            }
        } catch {
        }
        return nil
    }
    
    class func convertToDict(data: Data?) -> [String: AnyObject]? {
        do {
            if let data = data {
                return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject]
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    open class func delay(_ delay: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + (Double(Int64(delay * Double(NSEC_PER_SEC))))), execute: closure)
    }
}

public extension UIDevice {
    
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
}
