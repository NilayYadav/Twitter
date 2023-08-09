//
//  HomeViewController.swift
//  Tweeter
//
//  Created by Nilay on 31/07/23.
//

import UIKit

class HomeViewController: UIViewController {

    private func ConfigtureNavigationBar() {
       let size: CGFloat = 36
       let TwitterLogoimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        TwitterLogoimageView.contentMode = .scaleAspectFill
        TwitterLogoimageView.image = UIImage(named: "Twitterlogo")
        
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        middleView.addSubview(TwitterLogoimageView)
        navigationItem.titleView = middleView
        
        let ProfileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: ProfileImage, style: .plain, target: self, action: #selector(didTapProfile))
    }
    
    @objc private func didTapProfile() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let timeLineTabView: UITableView = {
        let tabView = UITableView()
        tabView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tabView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timeLineTabView)
        timeLineTabView.delegate = self
        timeLineTabView.dataSource = self
        ConfigtureNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timeLineTabView.frame = view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

  
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
             return UITableViewCell()
        }
        
        cell.delgate = self
        return cell
    }
}

extension HomeViewController: TweetTableViewCellDelegate {
    
    func TweetTableViewCellDidReply() {
        print("Hello, Reply")
    }
    
    func TweetTableViewCellDidLike() {
        print("Hello,Like")
    }
    
    func TweetTableViewCellDidShare() {
        print("Hello, Share")
    }
    
    func TweetTableViewCellDidReTweet() {
        print("Hello, ReTweet")
    }
}
