//
//  ProfileHeader.swift
//  Tweeter
//
//  Created by Nilay on 04/08/23.
//

import UIKit

class ProfileTableViewHeader: UIView {
 
    private let ProfileHeaderImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(named: "header")
        return imageview
    }()
    
    private let ProfileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.clipsToBounds = true
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 40
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "person")
        imageview.backgroundColor = .red
        return imageview
    }()
    
    private let ProfileDisplayNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nilay"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let ProfileDisplayUserNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@nilay"
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let ProfileUserBioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Developer"
        label.numberOfLines = 3
        label.textColor = .label
        return label
    }()
    
    private let ProfileJoinedDate: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        imageview.tintColor = .secondaryLabel
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private let ProfileJoinedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Joined May 2021"
        label.textColor = .secondaryLabel
        label.font = (.systemFont(ofSize: 14, weight: .regular))
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ProfileHeaderImageView)
        addSubview(ProfileImageView)
        addSubview(ProfileDisplayNameLabel)
        addSubview(ProfileDisplayUserNameLabel)
        addSubview(ProfileUserBioLabel)
        addSubview(ProfileJoinedDate)
        addSubview(ProfileJoinedDateLabel)
        configureConstraints()
    }
    
    private func configureConstraints(){
        
        let ProfileHeaderImageViewConstraints = [
            ProfileHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
            ProfileHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ProfileHeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ProfileHeaderImageView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let ProfileImageViewConstraints = [
            ProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ProfileImageView.centerYAnchor.constraint(equalTo: ProfileHeaderImageView.bottomAnchor, constant: 10),
            ProfileImageView.widthAnchor.constraint(equalToConstant: 80),
            ProfileImageView.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        let ProfileDisplayNameLabelConstraints = [
            ProfileDisplayNameLabel.leadingAnchor.constraint(equalTo: ProfileImageView.leadingAnchor),
            ProfileDisplayNameLabel.topAnchor.constraint(equalTo: ProfileImageView.bottomAnchor, constant: 20),
        ]
        
        let ProfileDisplayUserNameLabelConstraints = [
            ProfileDisplayUserNameLabel.leadingAnchor.constraint(equalTo: ProfileDisplayNameLabel.leadingAnchor),
            ProfileDisplayUserNameLabel.bottomAnchor.constraint(equalTo: ProfileDisplayNameLabel.bottomAnchor, constant: 25)
             
        ]
        
        let ProfileUserBioLabelConstraints = [
            ProfileUserBioLabel.leadingAnchor.constraint(equalTo: ProfileDisplayNameLabel.leadingAnchor),
            ProfileUserBioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            ProfileUserBioLabel.topAnchor.constraint(equalTo: ProfileDisplayUserNameLabel.bottomAnchor, constant: 5)
        ]
        
        let ProfileJoinedDateConstraints = [
            ProfileJoinedDate.leadingAnchor.constraint(equalTo: ProfileDisplayNameLabel.leadingAnchor),
            ProfileJoinedDate.topAnchor.constraint(equalTo: ProfileUserBioLabel.bottomAnchor, constant: 5)
        ]
        
        let ProfileJoinedDateLabelConstraints = [
            ProfileJoinedDateLabel.leadingAnchor.constraint(equalTo: ProfileJoinedDate.trailingAnchor),
            ProfileJoinedDateLabel.bottomAnchor.constraint(equalTo: ProfileJoinedDate.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(ProfileHeaderImageViewConstraints)
        NSLayoutConstraint.activate(ProfileImageViewConstraints)
        NSLayoutConstraint.activate(ProfileDisplayNameLabelConstraints)
        NSLayoutConstraint.activate(ProfileDisplayUserNameLabelConstraints)
        NSLayoutConstraint.activate(ProfileUserBioLabelConstraints)
        NSLayoutConstraint.activate(ProfileJoinedDateConstraints)
        NSLayoutConstraint.activate(ProfileJoinedDateLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
