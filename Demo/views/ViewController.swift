//
//  ViewController.swift
//  Demo
//
//  Created by Josue Hernandez on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
    //MARK:Outlets
    @IBOutlet weak var quoteList: UITableView!
    var quotes:[Quote] = []
    
    
    //MARK: Properties
    var presenter:QuotePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quoteList.register(UINib(nibName: "QuoteTVC", bundle: nil), forCellReuseIdentifier: "quoteCell")
        setup()
    }
    func setup(){
        self.presenter = QuotePresenter(quoteService: QuoteService())
        self.presenter.setViewDeletagate(quouteViewDelegate: self)
        self.presenter.getAllQuotes()
    }

}


extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as? QuoteTVC else {fatalError("")}
        cell.setup(quote: self.quotes[indexPath.row])
        return cell
    }
    
}

extension ViewController:QuoteViewDelegate{
    func diplayQuotes(quotes: [Quote]) {
        self.quotes = quotes
        DispatchQueue.main.async { [weak self] in
            self?.quoteList.reloadData()
        }
    }

    func displayError(response: String) {
        debugPrint(response)
    }
}
