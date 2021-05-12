//
//  TitleViewController.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/11/21.
//

import Foundation
import UIKit

class TitleViewController: UIViewController {
    
    let titleScreen = UIImageView()
    let titleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .white
        // Creating the home screen
        titleScreen.translatesAutoresizingMaskIntoConstraints = false
        titleScreen.image = UIImage(named: "Title Screen")
        view.addSubview(titleScreen)
        // Creating the title button
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.setImage(UIImage(named: "Title Button"), for: .normal)
        titleButton.backgroundColor = .clear
        titleButton.addTarget(self , action: #selector(enterMainScreen), for: .touchUpInside)
        view.addSubview(titleButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleScreen.topAnchor.constraint(equalTo: view.topAnchor),
            titleScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            titleScreen.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleScreen.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 352),

            titleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33)
        ])
    }
    
    @objc func enterMainScreen() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
}
