//
//  BaseService.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import Foundation
import UIKit

public typealias HTTPHeaders = [String: String]
/// Created protocol for the "Serializable" the data for Encoding.
protocol Serializable: Codable {
    func serialize() -> Data?
}

// MARK: - Extension to Serializable
extension Serializable {
    /// Json Encoder for the ecoding the data
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}

/// Base service class defination
class BaseService: NSObject {
    /// instance of NSData that holds response data
    var responseData: NSData!
    /// deafult header of the request
    var defaultHeaders: [String: String] = [:]
    /// serviceIdentifier for the Service Request
    var serviceIdentifier: ServiceIdentifier!
    /// serviceType for the type of the service
    var serviceType: ServiceType!
    /// requestBody for the request
    var requestBody: [String: AnyObject] = ["": "" as AnyObject]
    /// serviceURL for the request URL
    var serviceURL: String = ""
    /// includeSSO for including SSO Token in request headers
    var includeSSO: Bool!
    /// headers for including type and API Key
    var headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    /// Purpose of this method is to initialization
    override init() {
        super.init()
    }
    
    /// Initializers for the BaseService class
    ///
    /// - Parameters:
    ///   - includeSSO: Bool value
    ///   - serviceIdentifier: ServiceIdentifier enum type
    ///   - serviceType: ServiceType enum type
    ///   - serviceURL: String value
    ///   - requestData: Data value
    convenience init(includeSSO: Bool, serviceIdentifier: ServiceIdentifier? = nil, serviceType: ServiceType, serviceURL: String, requestData: Data? = nil) {
        self.init()
        self.serviceIdentifier = serviceIdentifier
        self.serviceType = serviceType
        self.serviceURL = serviceURL
        self.includeSSO = includeSSO
        if let requestData = requestData, let reqBody = Utilities.convertToDict(data: requestData) {
            self.requestBody = reqBody
        }
    }
    
    /// Start the Service for the request
    ///
    /// - Parameters:
    ///   - completionHandler: to return success or failure with the message
    ///   - failureHandler: to return failure with the message
    func startService(completionHandler:@escaping SuccessDataClosure, failureHandler:@escaping FailureDataClosure) {
        print("startService CALLED")
        
        var url: String
        let configuration = URLSessionConfiguration.default
        
        url = self.serviceURL
        configuration.timeoutIntervalForRequest = TimeInterval(Constants.kRequestTimeOut)
        
        url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        let session: URLSession = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        if includeSSO {
            headers["Authorization"] = DataManager.sharedInstance.authToken ?? ""
        }
        
        request.allHTTPHeaderFields = headers
        request.httpMethod = serviceType.rawValue
        
        if serviceType == .POST || serviceType == .PUT || serviceType == .PATCH {
            //request.httpBody = requestModel.serialize()
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
            print("===================== RequestBody =======================")
            print("StartService : RequestBody=\(String(describing: requestBody.description))")
            print("===================== RequestBody =======================")
            print(" ")
        }
        
        print("startService Before DataTask")
        
        let dataTask = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let error = error {
                /// Managing the -1001 timeout error. We can't use
                let err = error as NSError
                if (err.code == -1001) {
                    let errorModel = ErrorModel()
                    errorModel.code = -1001
                    errorModel.errorCode = "-1001"
                    failureHandler(false, errorModel)
                }
                else {
                    failureHandler(false, error as? ErrorModel)
                }
                session.finishTasksAndInvalidate()
            } else if let httpResponse = response as? HTTPURLResponse {
                
                print("StartService : RequestURL=\(String(describing: request.url))")
                print("===================== Status Code: =======================")
                print("Status Code: \(httpResponse.statusCode)")
                print("===================== Status Code: =======================")
                
                if (httpResponse.statusCode != 200 && httpResponse.statusCode != 201) {
                    
                    if let errorModel = error as? ErrorModel {
                        failureHandler(false, errorModel)
                    } else {
                        let errorModel = ErrorModel()
                        errorModel.code = httpResponse.statusCode
                        errorModel.errorCode = httpResponse.statusCode.description
                        
                        failureHandler(false, errorModel)
                    }
                } else {
                    if let responseData = data {
                        print("===================== Response JSON: =======================")
                        print(String(decoding: responseData, as: UTF8.self))
                        print("===================== Response JSON: =======================")
                    }
                    completionHandler(true, data)
                }
            } else {
                completionHandler(true, data)
                session.finishTasksAndInvalidate()
            }
        })
        dataTask.resume()
    }
}
