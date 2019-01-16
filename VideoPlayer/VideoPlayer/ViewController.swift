//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Ron Yi on 2019/1/16.
//  Copyright © 2019 Ron Yi. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @objc dynamic var player = AVPlayer()

    let constraintView = UIView()

    var searchController = UISearchController()

    let tableView = UITableView()

    @objc dynamic var playButton = UIButton()

    @objc dynamic var muteButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        setUp()

        configSearchBarController()

        tableView.tableHeaderView = searchController.searchBar

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            else { fatalError("TableViewCell error.")
        }

        cell.contentView.addSubview(constraintView)
        //cell.contentView.backgroundColor = .black

        constraintView.translatesAutoresizingMaskIntoConstraints = false
        constraintView.backgroundColor = .black

        constraintView.heightAnchor.constraint(equalToConstant: 667.0).isActive = true
        constraintView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 0).isActive = true
        constraintView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 0).isActive = true
        constraintView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 0).isActive = true
        constraintView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 0).isActive = true

        //playButton.tintColor = .red
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playAction), for: .touchUpInside)

        constraintView.addSubview(playButton)

        playButton.translatesAutoresizingMaskIntoConstraints = false

        playButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true

        playButton.leadingAnchor.constraint(equalTo: constraintView.leadingAnchor, constant: 10).isActive = true
        //playButton.topAnchor.constraint(equalTo: constraintView.topAnchor, constant: 0).isActive = true
        //playButton.trailingAnchor.constraint(equalTo: constraintView.trailingAnchor, constant: 0).isActive = true
        playButton.bottomAnchor.constraint(equalTo: constraintView.bottomAnchor, constant: -50).isActive = true

        return cell

    }

    @objc func playAction(sender: UIButton) {

//        let viewController = ViewController()
//        let observe = viewController
//        print("Test")

    }

    func updateSearchResults(for searchController: UISearchController) {

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        if let searchText = searchBar.text {

            guard
                let url = URL(string: searchText)
                else { print("URL error.")
                    return
            }

            let player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)

            playerLayer.frame = self.view.bounds
            self.view.layer.addSublayer(playerLayer)
            player.play()

            print(searchText)

        } else {

            print("searchText error.")

        }

    }

    func setUp() {

        view.addSubview(tableView)

        tableView.register(TableViewCell.self as AnyClass, forCellReuseIdentifier: "TableViewCell")
        tableView.backgroundColor = .black
        //tableView.separatorStyle = .none

        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }

    func configSearchBarController() {

        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false

        searchController.searchBar.placeholder = "Enter URL of video"
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()

    }

    func configButton() {

        playButton.tintColor = .red
        //playButton.backgroundColor = .red

        playButton.translatesAutoresizingMaskIntoConstraints = false

        playButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

        playButton.leadingAnchor.constraint(equalTo: constraintView.leadingAnchor, constant: 10).isActive = true
        playButton.topAnchor.constraint(equalTo: constraintView.topAnchor, constant: 0).isActive = true
        playButton.trailingAnchor.constraint(equalTo: constraintView.trailingAnchor, constant: 0).isActive = true
        playButton.bottomAnchor.constraint(equalTo: constraintView.bottomAnchor, constant: 10).isActive = true

    }

}
