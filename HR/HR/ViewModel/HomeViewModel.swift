//
//  HomeViewModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {

    // Object instance for EmpImageResponseModel
    var empImageResponse = EmpImageResponseModel()
    
    /**
     @Get Emp Image web service call.
     @param  successHandler : closure , failureHandler : closure
     @return nil.
     */
    func getEmpImage(requestModel: EmpImageRequestModel, successHandler : @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        HomeServiceManager.getEmpImageWebServiceCall(requestModel: requestModel, completionHandler: { [weak self](status, data) in
            if let responseData = CustomJSONDecoder.decodeResponseModelObject(model: EmpImageResponseModel.self, data: data) {
                self?.empImageResponse = responseData
                successHandler(true, "Success")
            } else {
                successHandler(false, "Failed")
            }
        }, failureHandler: { (status, error) in
            let errorMessage = ErrorModel.checkErrorCode(error?.code ?? 0)
            failureHandler(status ?? false, errorMessage)
        })
    }
}
