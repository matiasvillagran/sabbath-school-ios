//
//  URL.swift
//  SabbathSchool
//
//  Created by Heberti Almeida on 08/12/16.
//  Copyright © 2016 Adventech. All rights reserved.
//

import Foundation

extension URL {
    
    /**
     Get the value for a paramter key from URL.
     
     - parameter key: The parameter key.
     - returns: The value if exists.
     */
    func valueForParameter(key: String) -> String? {
        if let components = URLComponents(string: absoluteString), let queryItems = components.queryItems {
            for item in queryItems {
                if item.name == key {
                    return item.value
                }
            }
        }
        
        guard let fragment = fragment else { return nil }
        if let components = URLComponents(string: fragment), let queryItems = components.queryItems {
            for item in queryItems {
                if item.name == key {
                    return item.value
                }
            }
        }
        
        return nil
    }
}
