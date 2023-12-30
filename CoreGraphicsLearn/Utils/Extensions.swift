//
//  Extensions.swift
//  CoreGraphicsLearn
//
//  Created by SAHIL AMRUT AGASHE on 30/12/23.
//

import UIKit

extension UIImage {
    func image(toNewSize size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        let newImage = renderer.image { (context: UIGraphicsImageRendererContext) in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return newImage
    }
}
extension UIViewController {
    func setTitle(_ title: String, andImage image: UIImage) {
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.textColor = UIColor.white
        titleLbl.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        let imageView = UIImageView(image: image)
        let titleView = UIStackView(arrangedSubviews: [imageView, titleLbl])
        titleView.axis = .horizontal
        titleView.spacing = 10.0
        navigationItem.titleView = titleView
    }
}
