//
//  ErrorManager.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

enum ErrorType: String {
    case unknownError = "We're sorry, this site is currently unavailable."
    case badRequest = "Bad Request"
    case notFound = "We're sorry, this site is currently unavailable. "
    case serverError = "We're sorry, this site is currently unavailable.  "
    case serviceUnavailable
    case requestTimeOut
    case sessionTimeOut = "Request Timed Out"
    case forbidden
    case accountLocked = "Account is locked"
    case invalidUser = "Invalid UserId or Password"
    case invalidAttempts = "Invalid attempts reached will result in account being locked"
    case validationError = "Validation Error"
    case invalidSessionId = "Invalid SessionId"
    case invalidPassword = "Invalid password"
    case invalidMemberId = "Incorrect Member ID"
    case noContent = "No results found."
    case validationFailed = "Validation Failed, Please enter correct answer"
    case userNameAlreadyExist = "Requested Username already exists"
    case firstCharAlphabetic = "Requested Username first character is not alphabetic"
    case userNameRule = "Requested Username includes only letters (a-z), numbers (0-9) or an underscore (_)"
    case userNamelength = "Requested Username does not meet length requirements"
    case invalidCredentials = "Invalid Credentials"
    case userAlreadyRegisterd = "User Already Registered"
    case activationFailed = "Activation failed, Please try after some time"
    case notModified = "Address Not Modified"
    
}
/// Class describing the Error Model
class ErrorModel: Serializable {
    /// code instance of service error code
    public var code: Int?
    public var isSeriveError: String?
    public var message: String?
    public var errorCode: String?
    /// Check the errorcode and return the error message based on code
    ///
    /// - Parameter errorCode: of type Int
    /// - Returns: type String
    class func checkErrorCode(_ errorCode: Int) -> String {
        switch errorCode {
        case 400:
            return ErrorType.badRequest.rawValue
        case 401:
            return ErrorType.invalidCredentials.rawValue
        case 403:
            return ErrorType.forbidden.rawValue
        case 404:
            return ErrorType.notFound.rawValue
        case 408:
            return ErrorType.requestTimeOut.rawValue
        case 419:
            return ErrorType.accountLocked.rawValue
        case 421:
            return ErrorType.invalidUser.rawValue
        case 427:
            return ErrorType.invalidAttempts.rawValue
        case 433:
            return ErrorType.validationError.rawValue
        case 434:
            return ErrorType.invalidSessionId.rawValue
        case 435:
            return ErrorType.invalidPassword.rawValue
        case 500:
            return ErrorType.serverError.rawValue
        case 503:
            return ErrorType.serviceUnavailable.rawValue
        case 504:
            return ErrorType.sessionTimeOut.rawValue
        case 204:
            return ErrorType.noContent.rawValue
        case 432:
            return ErrorType.validationFailed.rawValue
        case 440:
            return ErrorType.userNameAlreadyExist.rawValue
        case 441:
            return ErrorType.firstCharAlphabetic.rawValue
        case 442:
            return ErrorType.userNameRule.rawValue
        case 445:
            return ErrorType.userNamelength.rawValue
        case -1001:
            return ErrorType.sessionTimeOut.rawValue
        case 454:
            return ErrorType.userAlreadyRegisterd.rawValue
        case 456:
            return ErrorType.activationFailed.rawValue
        case 304:
            return ErrorType.notModified.rawValue
        default:
            return ErrorType.unknownError.rawValue
        }
    }
    /// Check the errorcode string and return the error message
    ///
    /// - Parameter errorCode: type String
    /// - Returns: type String
    class func checkErrorWithType(errorCode: String) -> String {
        switch errorCode {
        case "401-002":
            return ErrorType.accountLocked.rawValue
        case "401-003":
            return ErrorType.invalidUser.rawValue
        case "401-004":
            return ErrorType.invalidAttempts.rawValue
        case "-1001":
            return ErrorType.sessionTimeOut.rawValue
        default:
            return ErrorType.unknownError.rawValue
        }
    }
}
