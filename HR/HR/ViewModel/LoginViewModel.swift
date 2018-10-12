//
//  LoginViewModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    
    // Object instance for login response model
    var loginResponse = LoginResponseModel()

    /**
     @brief login web service call.
     @param  successHandler : closure , failureHandler : closure
     @return nil.
     */
    func validateLogin(requestModel: LoginRequestModel, successHandler : @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        LoginServiceManager.validateLoginWebServiceCall(requestModel: requestModel, completionHandler: { [weak self](status, data) in
            if let responseData = CustomJSONDecoder.decodeResponseModelObject(model: LoginResponseModel.self, data: data) {
                self?.loginResponse = responseData
                successHandler(true, "Success")
            } else {
                successHandler(false, "Failed")
            }
        }, failureHandler: { (status, error) in
            let errorMessage = ErrorModel.checkErrorCode(error?.code ?? 0)
            //let errorMessage = ErrorModel.checkErrorWithType(errorCode: ErrorType.invalidUser.rawValue)
            failureHandler(status ?? false, errorMessage)
        })
    }
}
