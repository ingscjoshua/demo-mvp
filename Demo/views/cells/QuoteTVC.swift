//
//  QuoteTVC.swift
//  Demo
//
//  Created by Josue Hernandez on 18/03/22.
//

import UIKit

class QuoteTVC: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var quoteImg: UIImageView!
    @IBOutlet weak var quoteLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setup(quote:Quote){
        quoteImg.load(url: URL(string: quote.image)!)
        quoteLbl.text = quote.quote
    }
}
