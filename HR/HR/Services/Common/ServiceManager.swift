//
//  ServiceManager.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

typealias SuccessClosure = (_ status: Bool, _ message: String?) -> Void
typealias FailureClosure = (_ status: Bool, _ message: String?) -> Void

typealias SuccessDataClosure = (_ status: Bool, _ data: Data?) -> Void
typealias FailureDataClosure = (_ status: Bool?, _ error: ErrorModel?) -> Void


enum ServiceIdentifier {
    case loginService
}


/// Options for service type methods
///
/// - GET: GET method
/// - POST: POST method
/// - PUT: PUT method
/// - DELETE: DELETE method
/// - PATCH: PATCH method
enum ServiceType: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}
