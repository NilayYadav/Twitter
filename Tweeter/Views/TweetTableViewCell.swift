//
//  TweetTableViewCell.swift
//  Tweeter
//
//  Created by Nilay on 01/08/23.
//

import UIKit

protocol TweetTableViewCellDelegate: AnyObject {
    func TweetTableViewCellDidReply()
    func TweetTableViewCellDidLike()
    func TweetTableViewCellDidShare()
    func TweetTableViewCellDidReTweet()
}

class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    
    weak var delgate: TweetTableViewCellDelegate?
    
    private let activespacing: CGFloat = 60
    
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
    
    private let ReplyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let ReTweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let LikeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let ShareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(ProfileImageView)
        contentView.addSubview(DisplayNameLabel)
        contentView.addSubview(DisplayUserNameLabel)
        contentView.addSubview(TweetTextContentLabel)
        contentView.addSubview(ReplyButton)
        contentView.addSubview(LikeButton)
        contentView.addSubview(ReTweetButton)
        contentView.addSubview(ShareButton)
        configureConstraints()
        configureButtons()
    }

    @objc private func didtabReply() {
        delgate?.TweetTableViewCellDidReply()
    }
    
    @objc private func didtabReTweet() {
        delgate?.TweetTableViewCellDidReTweet()
    }
    
    @objc private func didtabLike() {
        delgate?.TweetTableViewCellDidLike()
    }

    @objc private func didtabShare() {
        delgate?.TweetTableViewCellDidShare()
    }
    
    private func configureButtons() {
        ReplyButton.addTarget(self, action: #selector(didtabReply), for: .touchUpInside)
        ReTweetButton.addTarget(self, action: #selector(didtabReTweet), for: .touchUpInside)
        LikeButton.addTarget(self, action: #selector(didtabLike), for: .touchUpInside)
        ShareButton.addTarget(self, action: #selector(didtabShare), for: .touchUpInside)
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
           DisplayUserNameLabel.leadingAnchor.constraint(equalTo: DisplayNameLabel.trailingAnchor, constant: 10),
           DisplayUserNameLabel.centerYAnchor.constraint(equalTo: DisplayNameLabel.centerYAnchor),
       ]

       let TweetTextContentLabelConstraints = [
           TweetTextContentLabel.leadingAnchor.constraint(equalTo: DisplayNameLabel.leadingAnchor),
           TweetTextContentLabel.topAnchor.constraint(equalTo: DisplayNameLabel.bottomAnchor, constant: 10),
           TweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ]
        
        let ReplyButtonConstraints = [
            ReplyButton.leadingAnchor.constraint(equalTo: TweetTextContentLabel.leadingAnchor),
            ReplyButton.topAnchor.constraint(equalTo: TweetTextContentLabel.bottomAnchor, constant: 10),
            ReplyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        
        let ReTweetButtonConstraints = [
            ReTweetButton.leadingAnchor.constraint(equalTo: ReplyButton.leadingAnchor, constant: activespacing),
            ReTweetButton.centerYAnchor.constraint(equalTo: ReplyButton.centerYAnchor)
        ]
        
        let LikeButtonConstraints = [
            LikeButton.leadingAnchor.constraint(equalTo: ReTweetButton.trailingAnchor, constant: activespacing),
            LikeButton.centerYAnchor.constraint(equalTo: ReplyButton.centerYAnchor)
        ]
        
        let ShareButtonConstraints = [
            ShareButton.leadingAnchor.constraint(equalTo: LikeButton.trailingAnchor, constant: activespacing),
            ShareButton.centerYAnchor.constraint(equalTo: ReplyButton.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(ProfileImageConstraints)
        NSLayoutConstraint.activate(DisplayNameLabelConstraints)
        NSLayoutConstraint.activate(DisplayUserNameLabelConstraints)
        NSLayoutConstraint.activate(TweetTextContentLabelConstraints)
        NSLayoutConstraint.activate(ReplyButtonConstraints)
        NSLayoutConstraint.activate(LikeButtonConstraints)
        NSLayoutConstraint.activate(ReTweetButtonConstraints)
        NSLayoutConstraint.activate(ShareButtonConstraints)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
