//
//  ReviewCollectionViewCell.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/11/21.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    
    var reviewMessage = UITextView()
    var reviewName = UITextField()
    var reviewRating : Int = 5
    var star1 = UIImageView()
    var star2 = UIImageView()
    var star3 = UIImageView()
    var star4 = UIImageView()
    var star5 = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        // Creating the review message
        reviewMessage.translatesAutoresizingMaskIntoConstraints = false
        reviewMessage.text = "Deault Words"
        reviewMessage.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(reviewMessage)
        // Creating the name of reviewer
        reviewName.translatesAutoresizingMaskIntoConstraints = false
        reviewName.text = "Deault Text"
        reviewName.font = UIFont.systemFont(ofSize: 12)
        reviewName.textColor = UIColor(red: 0.512, green: 0.512, blue: 0.512, alpha: 1)
        contentView.addSubview(reviewName)
        // Creating the stars for the review
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.image = UIImage(named: "Home Star")
        contentView.addSubview(star1)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.image = UIImage(named: "Home Star")
        contentView.addSubview(star2)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.image = UIImage(named: "Home Star")
        contentView.addSubview(star3)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.image = UIImage(named: "Home Star")
        contentView.addSubview(star4)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.image = UIImage(named: "Home Star")
        contentView.addSubview(star5)
    }
    
    func setupConstraints() {
       
        NSLayoutConstraint.activate([
            reviewMessage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            reviewMessage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            reviewMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            reviewMessage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            reviewName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            reviewName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])

        NSLayoutConstraint.activate([
            star1.centerYAnchor.constraint(equalTo: reviewName.centerYAnchor, constant: -1),
            star1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            star1.heightAnchor.constraint(equalToConstant: 17),
            star1.widthAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            star2.centerYAnchor.constraint(equalTo: star1.centerYAnchor),
            star2.leadingAnchor.constraint(equalTo: star1.trailingAnchor, constant: 3),
            star2.heightAnchor.constraint(equalToConstant: 17),
            star2.widthAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            star3.centerYAnchor.constraint(equalTo: star1.centerYAnchor),
            star3.leadingAnchor.constraint(equalTo: star2.trailingAnchor, constant: 3),
            star3.heightAnchor.constraint(equalToConstant: 17),
            star3.widthAnchor.constraint(equalToConstant: 17)
        ])
        NSLayoutConstraint.activate([
            star4.centerYAnchor.constraint(equalTo: star1.centerYAnchor),
            star4.leadingAnchor.constraint(equalTo: star3.trailingAnchor, constant: 3),
            star4.heightAnchor.constraint(equalToConstant: 17),
            star4.widthAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            star5.centerYAnchor.constraint(equalTo: star1.centerYAnchor),
            star5.leadingAnchor.constraint(equalTo: star4.trailingAnchor, constant: 3),
            star5.heightAnchor.constraint(equalToConstant: 17),
            star5.widthAnchor.constraint(equalToConstant: 17)
        ])
    }

    func configure(for review: Review) {
        reviewMessage.text = review.review
        reviewName.text = review.name
        reviewRating = review.core.course.rating
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
