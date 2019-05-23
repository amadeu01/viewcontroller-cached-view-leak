//
//  ViewController.swift
//  Test
//
//  Created by Amadeu Cavalcante Filho on 15/05/19.
//  Copyright © 2019 Amadeu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let random = Int.random(in: 1...10000)

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
        print("init ViewController1 called random: \(random)")
    }

    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 110, y: 110, width: 200, height: 100))
        button.setTitle("Add View Controller", for: .normal)
        button.backgroundColor = .gray
        return button
    }()

    let label = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 100))

    let randomLabel = UILabel(frame: CGRect(x: 100, y: 450, width: 300, height: 100))

    override func loadView() {
        view = RootView()
        print("load view called, random: \(random), \(label.text ?? "--")\n")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.backgroundColor = .white

        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(randomLabel)
    }

    @objc func buttonTapped() {
        print("buttonTapped ViewController1")
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.navigation.viewControllers = []
            appDelegate.window?.rootViewController = appDelegate.tabController
            appDelegate.number += 1
        }
    }
}

final class RootView: UIView {
    let random = Int.random(in: 1...10000)

    let colors: [UIColor] = [.gray, .green, .gray, .red, .orange, .brown]

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        self.backgroundColor = colors.randomElement()
    }
}

