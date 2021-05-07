//
//  HeaderView.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/6/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    private var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Creating the labels for "Recently Viewed", "Suggestions", and "Reviewed"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        addSubview(label)
        
        setupContraints()
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setTitle(title: String) {
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
