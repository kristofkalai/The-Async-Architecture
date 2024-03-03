//
//  MainScreen.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import UIKit
import TheAsyncArchitecture

final class MainScreen: BaseScreen<MainState, MainCommand, MainViewModel> {
    private static let cellIdentifier = "cell"

    private let tableView = UITableView()
    private var items = [MainItem]()

    override init() {
        super.init()
        setupUI()
    }

    override func receiveState(_ state: MainState) {
        super.receiveState(state)
        items = state.items
        tableView.reloadData()
    }
}

extension MainScreen {
    private func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
}

extension MainScreen: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Task {
            await send(command: .selected(items[indexPath.row]))
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
