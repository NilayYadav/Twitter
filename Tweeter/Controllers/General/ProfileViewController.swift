//
//  ProfileViewController.swift
//  Tweeter
//
//  Created by Nilay on 04/08/23.
//

import UIKit

class ProfileViewController: UIViewController {

    private var IsStatusBarHidden: Bool = true
    
    private let Statusbar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()
    
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
        view.addSubview(Statusbar)
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: ProfileTableView.frame.width, height: 380))
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self
        ProfileTableView.tableHeaderView = headerView
        ProfileTableView.contentInsetAdjustmentBehavior = .never
        navigationController?.navigationBar.isHidden = true
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let profileTableViewConstraints = [
            ProfileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ProfileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            ProfileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ProfileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let StatusBarConstraints = [
            Statusbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            Statusbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            Statusbar.topAnchor.constraint(equalTo: view.topAnchor),
            Statusbar.heightAnchor.constraint(equalToConstant: view.bounds.height > 800 ? 40 : 20)
        ]
        
        NSLayoutConstraint.activate(profileTableViewConstraints)
        NSLayoutConstraint.activate(StatusBarConstraints)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
             return UITableViewCell()
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        
        if yPosition > 150 && IsStatusBarHidden {
            IsStatusBarHidden = false
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear){ [weak self] in self?.Statusbar.layer.opacity = 1
               
            } completion: { _ in}
        } else if yPosition < 0 && !IsStatusBarHidden {
            IsStatusBarHidden = true
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear){ [weak self] in self?.Statusbar.layer.opacity = 0
               
            } completion: { _ in}
        }
    }
}
