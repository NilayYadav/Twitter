//
//  TweetTableViewCell.swift
//  Tweeter
//
//  Created by Nilay on 01/08/23.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    
    private let ProfileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 25
        imageview.layer.masksToBounds = true
        imageview.clipsToBounds = true
        imageview.image = UIImage(systemName: "person")
        imageview.backgroundColor = .red
        return imageview
    }()
    
    private let DisplayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nilay Yadav"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let DisplayUserNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@Nilay Yadav"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let TweetTextContentLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "Hello, World"
       label.numberOfLines = 0
       return label
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(ProfileImageView)
        contentView.addSubview(DisplayNameLabel)
        contentView.addSubview(DisplayUserNameLabel)
        contentView.addSubview(TweetTextContentLabel)
        configureConstraints()
    }

    private func configureConstraints() {

        let ProfileImageConstraints = [
            ProfileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ProfileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            ProfileImageView.heightAnchor.constraint(equalToConstant:  50),
            ProfileImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let DisplayNameLabelConstraints = [
            DisplayNameLabel.leadingAnchor.constraint(equalTo: ProfileImageView.trailingAnchor, constant: 20),
            DisplayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
        ]

       let DisplayUserNameLabelConstraints = [
           DisplayUserNameLabel.leadingAnchor.constraint(equalTo: DisplayNameLabel.trailingAnchor, constant: 40),
           DisplayUserNameLabel.centerYAnchor.constraint(equalTo: DisplayNameLabel.centerYAnchor),
       ]

       let TweetTextContentLabelConstraints = [
           TweetTextContentLabel.leadingAnchor.constraint(equalTo: DisplayNameLabel.leadingAnchor),
           TweetTextContentLabel.topAnchor.constraint(equalTo: DisplayNameLabel.bottomAnchor, constant: 10),
           TweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
           TweetTextContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ]
        
        NSLayoutConstraint.activate(ProfileImageConstraints)
        NSLayoutConstraint.activate(DisplayNameLabelConstraints)
        NSLayoutConstraint.activate(DisplayUserNameLabelConstraints)
        NSLayoutConstraint.activate(TweetTextContentLabelConstraints)

    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
