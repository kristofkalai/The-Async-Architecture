//
//  NavigationController.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import UIKit

final class NavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
