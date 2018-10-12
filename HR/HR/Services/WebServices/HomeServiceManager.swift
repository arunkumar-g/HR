//
//  HomeServiceManager.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

class HomeServiceManager: NSObject {
    
    class func getEmpImageWebServiceCall(requestModel: EmpImageRequestModel, completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure) {
        /// Service URL
        let url = "http://oradev.alphasoftsys.net:8000/webservices/rest/xx_test/GET_EMP_IMAGE/"
        /// Base service
        let baseService = BaseService(includeSSO: true, serviceType: .POST, serviceURL: url, requestData: requestModel.serialize())
        
        /// Start web service
        baseService.startService(completionHandler: { (status, data) in
            completionHandler(status, data)
        }, failureHandler: { (status, error) in
            failureHandler(status, error)
        })
    }
}
