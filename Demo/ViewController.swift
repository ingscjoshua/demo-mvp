//
//  ViewController.swift
//  Demo
//
//  Created by Josue Hernandez on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
    var presenter:QuotePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    func setup(){
        self.presenter = QuotePresenter(quoteService: QuoteService())
        self.presenter.setViewDeletagate(quouteViewDelegate: self)
        self.presenter.getAllQuotes()
    }

}

extension ViewController:QuoteViewDelegate{
    func diplayQuotes(quotes: [Quote]) {
        debugPrint("los quotes:\(quotes)")
    }

    func displayError(response: String) {
        debugPrint(response)
    }
}
