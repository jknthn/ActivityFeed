//
//  ActivityTableViewCell.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 23/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit
import Kingfisher

class ActivityTableViewCell: UITableViewCell, ActivityCell {
    
    private let messageLabel = LabelFactory().create(for: .message)
    private let dateLabel = LabelFactory().create(for: .date)
    private let amountLabel = LabelFactory().create(for: .amount)
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 15.0
        return stackView
    }()
    
    private let middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 13.0
        return stackView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    // MARK: - UITableViewCell
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        messageLabel.attributedText = nil
        dateLabel.text = nil
        amountLabel.text = nil
    }
    
    // MARK: - Setup
    
    func setupCell() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(avatarImageView)
        mainStackView.addArrangedSubview(middleStackView)
        mainStackView.addArrangedSubview(amountLabel)
        middleStackView.addArrangedSubview(messageLabel)
        middleStackView.addArrangedSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.5),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17.0),
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 30.0),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
        ])
    }
    
    // MARK: - Public
    
    func cancelImageDownload() {
        avatarImageView.kf.cancelDownloadTask()
    }
    
    // MARK: - ActivityCell
    
    func updateImageUrl(_ url: URL) {
        avatarImageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
    
    func updateMessage(_ message: String) {
        messageLabel.text = message
    }
    
    func updateDate(_ date: String) {
        dateLabel.text = date
    }
    
    func updateAmount(_ amount: String) {
        amountLabel.text = amount
    }
}
