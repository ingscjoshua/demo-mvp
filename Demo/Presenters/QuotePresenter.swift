//
//  QuotePresenter.swift
//  Demo
//
//  Created by Josue Hernandez on 17/03/22.
//

import Foundation

protocol QuoteViewDelegate:AnyObject{
    func diplayQuotes(quotes:[Quote])
    func displayError(response: String)
}

class QuotePresenter{
    private let quoteService:QuoteService
    weak private var viewDelegate:QuoteViewDelegate?
    
    init(quoteService:QuoteService){
        self.quoteService = quoteService
    }
    
    func setViewDeletagate(quouteViewDelegate:QuoteViewDelegate){
        self.viewDelegate = quouteViewDelegate
    }
    
    func getAllQuotes(){
        self.quoteService.getAllQuotes{[weak self]result in
            switch result{
            case .success(let items):
                self?.viewDelegate?.diplayQuotes(quotes: items)
                break
            case .failure(let error):
                debugPrint(error)
                self?.viewDelegate?.displayError(response: "No pudimos obtener las citas de los simpson")
                break
            }
        }
    }
}
