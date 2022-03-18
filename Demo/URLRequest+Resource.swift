//
//  URLRequest+Resource.swift
//  Demo
//
//  Created by Josue Hernandez on 17/03/22.
//

import Foundation

extension URLRequest {
    
    init(_ resource: Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
    }
    
}
