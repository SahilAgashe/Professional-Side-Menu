//
//  MenuOptionCell.swift
//  CoreGraphicsLearn
//
//  Created by SAHIL AMRUT AGASHE on 30/12/23.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    // MARK: - Properties
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 26).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 26).isActive = true
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Sample text"
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
        
        let hStack = UIStackView(arrangedSubviews: [iconImageView, descriptionLabel])
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.spacing = 15
        contentView.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
