//
//  UIViewController+Extension.swift
//  Demo
//
//  Created by Josue Hernandez on 18/03/22.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
}

