//
//  InitialViewModel.swift
//  HR
//
//  Created by Arunkumar G on 10/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

class InitialViewModel: NSObject {
    
    // Object instance for UpdateDateResponseModel
    var updateDateResponseModel = UpdateDateResponseModel()
    
    // Object instance for LanguageResponseModel
    var languageResponseModel = LanguageResponseModel()
    
    // Object instance for TranslateResponseModel
    var translateResponseModel = TranslateResponseModel()
    
    // Object instance for MessageResponseModel
    var messageResponseModel = MessageResponseModel()
    
    /**
     @Get Last Update Date web service call.
     @param  successHandler : closure , failureHandler : closure
     @return nil.
     */
    func getUpdateDate(requestModel: UpdateDateRequestModel, successHandler : @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        LoginServiceManager.getUpdateDateWebServiceCall(requestModel: requestModel, completionHandler: { [weak self](status, data) in
            if let responseData = CustomJSONDecoder.decodeResponseModelObject(model: UpdateDateResponseModel.self, data: data) {
                self?.updateDateResponseModel = responseData
                successHandler(true, "Success")
            } else {
                successHandler(false, "Failed")
            }
            }, failureHandler: { (status, error) in
                let errorMessage = ErrorModel.checkErrorCode(error?.code ?? 0)
                failureHandler(status ?? false, errorMessage)
        })
    }
    
    /**
     @Get Language web service call.
     @param  successHandler : closure , failureHandler : closure
     @return nil.
     */
    func getLanguages(requestModel: LanguageRequestModel, successHandler : @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        LoginServiceManager.getLanguageWebServiceCall(requestModel: requestModel, completionHandler: { [weak self](status, data) in
            if let responseData = CustomJSONDecoder.decodeResponseModelObject(model: LanguageResponseModel.self, data: data) {
                self?.languageResponseModel = responseData
                successHandler(true, "Success")
            } else {
                successHandler(false, "Failed")
            }
            }, failureHandler: { (status, error) in
                let errorMessage = ErrorModel.checkErrorCode(error?.code ?? 0)
                failureHandler(status ?? false, errorMessage)
        })
    }
    
    /**
     @Get Translate web service call.
     @param  successHandler : closure , failureHandler : closure
     @return nil.
     */
    func getTranslate(requestModel: TranslateRequestModel, successHandler : @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        LoginServiceManager.getTranslateWebServiceCall(requestModel: requestModel, completionHandler: { [weak self](status, data) in
            if let responseData = CustomJSONDecoder.decodeResponseModelObject(model: TranslateResponseModel.self, data: data) {
                self?.translateResponseModel = responseData
                successHandler(true, "Success")
            } else {
                successHandler(false, "Failed")
            }
            }, failureHandler: { (status, error) in
                let errorMessage = ErrorModel.checkErrorCode(error?.code ?? 0)
                failureHandler(status ?? false, errorMessage)
        })
    }
    
    /**
     @Get Message web service call.
     @param  successHandler : closure , failureHandler : closure
     @return nil.
     */
    func getMessage(requestModel: MessageRequestModel, successHandler : @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        LoginServiceManager.getMessageWebServiceCall(requestModel: requestModel, completionHandler: { [weak self](status, data) in
            if let responseData = CustomJSONDecoder.decodeResponseModelObject(model: MessageResponseModel.self, data: data) {
                self?.messageResponseModel = responseData
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
