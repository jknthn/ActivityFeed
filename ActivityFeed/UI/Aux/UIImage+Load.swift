//
//  UIImage+Load.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 27/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//


import UIKit

extension UIImageView {
    
    func load(from url: URL) {
        URLSession.shared.downloadTask(with: url) { [weak self] (url: URL?, response: URLResponse?, error: Error?) in
            guard
                error == nil,
                let url = url,
                let imageData = try? Data(contentsOf: url),
                let image = UIImage(data: imageData)
            else {
                    return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}
