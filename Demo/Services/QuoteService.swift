//
//  QuoteService.swift
//  Demo
//
//  Created by Josue Hernandez on 17/03/22.
//

import Foundation
class QuoteService{
    private let apiClient = APIClient.sharedInstance
        
    func getAllQuotes(callback:@escaping(Result<[Quote]>)->Void){
        apiClient.load(Resource(url:URL(string: "\(BASE_URL)quotes?count=20")!)){result in
            switch result{
            case .success(let data):
                do{
                    let items = try JSONDecoder().decode([Quote].self,from:data)
                    callback(.success(items))
                }catch{
                    callback(.failure(error))
                }
                break
            case .failure(let error):
                callback(.failure(error))
                break
            }
        }
    }
}
