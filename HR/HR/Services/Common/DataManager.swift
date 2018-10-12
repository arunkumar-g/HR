//
//  DataManager.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

///Data manager for storing data in the Singleton Instance
class DataManager: NSObject {
    static let sharedInstance: DataManager = DataManager()

    /// authToken instance for Post Login API's
    var authToken: String?
    
    // Last Update Date String
    var lastUpdateDate: String?
    
    // Language item Model
    var languageItems: [LanguageTableItemModel]?
    
    // Message item Model
    var messageItems: [MessageTableItemModel]?
    
    // Translate item Model
    var translateItems: [TranslateTableItemModel]?
}
