//
//  QuoteModel.swift
//  Demo
//
//  Created by Josue Hernandez on 17/03/22.
//

import Foundation

struct Quote:Decodable{
    let quote:String
    let person:String
    let image:String
    
    enum CodingKeys:String,CodingKey{
        case quote
        case person = "character"
        case image
    }
}
