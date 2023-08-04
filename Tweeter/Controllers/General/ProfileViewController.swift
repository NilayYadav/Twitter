//
//  ProfileViewController.swift
//  Tweeter
//
//  Created by Nilay on 04/08/23.
//

import UIKit

class ProfileViewController: UIViewController {

    private let ProfileTableView:  UITableView = {
        let tableview = UITableView()
        tableview.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        view.addSubview(ProfileTableView)
        
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: ProfileTableView.frame.width, height: 380))
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self
        ProfileTableView.tableHeaderView = headerView
        configureConstraints()
    }
    
    private func configureConstraints() {
        let profileTableViewConstraints = [
            ProfileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ProfileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            ProfileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ProfileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(profileTableViewConstraints)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
             return UITableViewCell()
        }
        return cell
    }
}
