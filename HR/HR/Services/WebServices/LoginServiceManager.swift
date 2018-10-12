//
//  LoginServiceManager.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

class LoginServiceManager: NSObject {
    
    class func validateLoginWebServiceCall(requestModel: LoginRequestModel, completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure) {
        /// Service URL
        let url = "http://oradev.alphasoftsys.net:8000/webservices/rest/xx_test/VALIDATE_LOGIN/"
        /// Base service
        let baseService = BaseService(includeSSO: true, serviceType: .POST, serviceURL: url, requestData: requestModel.serialize())
        
        /// Start web service
        baseService.startService(completionHandler: { (status, data) in
            completionHandler(status, data)
        }, failureHandler: { (status, error) in
            failureHandler(status, error)
        })
    }
    
    class func getUpdateDateWebServiceCall(requestModel: UpdateDateRequestModel, completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure) {
        /// Service URL
        let url = "http://oradev.alphasoftsys.net:8000/webservices/rest/xx_test/GET_LAST_UPDATE_DATE/"
        /// Base service
        let baseService = BaseService(includeSSO: true, serviceType: .POST, serviceURL: url, requestData: requestModel.serialize())
        
        /// Start web service
        baseService.startService(completionHandler: { (status, data) in
            completionHandler(status, data)
        }, failureHandler: { (status, error) in
            failureHandler(status, error)
        })
    }
    
    class func getLanguageWebServiceCall(requestModel: LanguageRequestModel, completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure) {
        /// Service URL
        let url = "http://oradev.alphasoftsys.net:8000/webservices/rest/xx_test/GET_SYSTEM_LANGUAGE/"
        /// Base service
        let baseService = BaseService(includeSSO: true, serviceType: .POST, serviceURL: url, requestData: requestModel.serialize())
        
        /// Start web service
        baseService.startService(completionHandler: { (status, data) in
            completionHandler(status, data)
        }, failureHandler: { (status, error) in
            failureHandler(status, error)
        })
    }
    
    class func getMessageWebServiceCall(requestModel: MessageRequestModel, completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure) {
        /// Service URL
        let url = "http://oradev.alphasoftsys.net:8000/webservices/rest/xx_test/GET_SYSTEM_MESSAGE/"
        /// Base service
        let baseService = BaseService(includeSSO: true, serviceType: .POST, serviceURL: url, requestData: requestModel.serialize())
        
        /// Start web service
        baseService.startService(completionHandler: { (status, data) in
            completionHandler(status, data)
        }, failureHandler: { (status, error) in
            failureHandler(status, error)
        })
    }
    
    class func getTranslateWebServiceCall(requestModel: TranslateRequestModel, completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure) {
        /// Service URL
        let url = "http://oradev.alphasoftsys.net:8000/webservices/rest/xx_test/GET_SYSTEM_TRANSLATE/"
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
