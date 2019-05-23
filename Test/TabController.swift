//
//  TabController.swift
//  Test
//
//  Created by Amadeu Cavalcante Filho on 23/05/19.
//  Copyright © 2019 Amadeu. All rights reserved.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    let vc = ViewController2()
    let nav = UINavigationController()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        vc.randomLabel.text = "from tabbar with my random number is \(vc.random)"
        nav.viewControllers = [vc]
        viewControllers = [nav]
    }
}

final class ViewController2: UIViewController {
    let random = Int.random(in: 1...10000)

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
        print("init ViewController2 called, random: \(random)\n")
    }

    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 110, y: 110, width: 200, height: 100))
        button.setTitle("Add View Controller", for: .normal)
        button.backgroundColor = .gray
        return button
    }()

    let label = UILabel(frame: CGRect(x: 30, y: 200, width: 300, height: 100))
    let randomLabel = UILabel(frame: CGRect(x: 30, y: 250, width: 300, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.backgroundColor = .white

        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(randomLabel)
        label.numberOfLines = 0
        randomLabel.numberOfLines = 0
        label.text = "ViewController2 with number: \(random)"
    }

    @objc func buttonTapped() {
        print("buttonTapped ViewController2\n")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let vc = ViewController()
            let label = UILabel(frame: CGRect(x: 50, y: 230, width: 300, height: 100))
            vc.label.text = "my real ramdom number is \(vc.random)"
            label.text = "You should be seing my -> real ramdom number is \(vc.random)"
            label.numberOfLines = 0
            vc.view.addSubview(label)
            appDelegate.navigation.pushViewController(vc, animated: true)
            appDelegate.window?.rootViewController = appDelegate.navigation
            appDelegate.number += 1
        }
    }
}
