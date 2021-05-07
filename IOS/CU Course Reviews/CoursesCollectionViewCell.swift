//
//  CoursesCollectionViewCell.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/5/21.
//

import UIKit

class CoursesCollectionViewCell: UICollectionViewCell {
    
    var cellBackground = UIView()
    var rosterName = UILabel()
    var courseDescription = UILabel()
    var rating : Int = 5
    let grayRec = UIView()
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()

     
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Creating the cell background
        cellBackground.translatesAutoresizingMaskIntoConstraints = false
        cellBackground.layer.cornerRadius = 10
        cellBackground.layer.masksToBounds = true
        cellBackground.backgroundColor = UIColor.white
        cellBackground.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.addSubview(cellBackground)
        // Creating the roster name
        rosterName.text = "CS 1110"
        rosterName.translatesAutoresizingMaskIntoConstraints = false
        rosterName.font = UIFont.boldSystemFont(ofSize: 18)
        rosterName.numberOfLines = 3
        rosterName.textColor = UIColor.black
        contentView.addSubview(rosterName)
        // Creating the course description
        courseDescription.text = "Introductory Design and Programming for the Web"
        courseDescription.translatesAutoresizingMaskIntoConstraints = false
        courseDescription.font = UIFont.systemFont(ofSize: 14)
        courseDescription.numberOfLines = 3
        courseDescription.textColor = UIColor.black
        contentView.addSubview(courseDescription)
        // Creating the rating (this will be edited later on but for now just leave at 5)
        rating = 5
        // Creating the gray rectangle that goes below the roster name
        grayRec.translatesAutoresizingMaskIntoConstraints = false
        grayRec.backgroundColor = UIColor.init(displayP3Red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        contentView.addSubview(grayRec)
        // Creating each of the five stars (will be edited later once data comes in)
        star1.image = UIImage(named: "Home Star")
        star1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(star1)
        star2.image = UIImage(named: "Home Star")
        star2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(star2)
        star3.image = UIImage(named: "Home Star")
        star3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(star3)
        star4.image = UIImage(named: "Home Star")
        star4.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(star4)
        star5.image = UIImage(named: "Home Star")
        star5.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(star5)
        setupConstraints()
    }
    
    // func that is called in ViewController that allows us to change every cell with the data we have to implment each of them
    func configure(for course: Course) {
        rosterName.text = course.rosterName
        courseDescription.text = course.description
        rating = course.rating
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            cellBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            cellBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3)
        ])

        NSLayoutConstraint.activate([
            rosterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            rosterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            rosterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            rosterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -110)
        ])

        NSLayoutConstraint.activate([
            courseDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 43),
            courseDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            courseDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            courseDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            grayRec.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 44),
            grayRec.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            grayRec.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            grayRec.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 45)
        ])
        
        NSLayoutConstraint.activate([
            star1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 121),
            star1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            star1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -108),
            star1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            star2.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 121),
            star2.leadingAnchor.constraint(equalTo: star1.trailingAnchor, constant: 3),
            star2.trailingAnchor.constraint(equalTo: star1.trailingAnchor, constant: 18),
            star2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            star3.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 121),
            star3.leadingAnchor.constraint(equalTo: star2.trailingAnchor, constant: 3),
            star3.trailingAnchor.constraint(equalTo: star2.trailingAnchor, constant: 18),
            star3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            star4.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 121),
            star4.leadingAnchor.constraint(equalTo: star3.trailingAnchor, constant: 3),
            star4.trailingAnchor.constraint(equalTo: star3.trailingAnchor, constant: 18),
            star4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            star5.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 121),
            star5.leadingAnchor.constraint(equalTo: star4.trailingAnchor, constant: 3),
            star5.trailingAnchor.constraint(equalTo: star4.trailingAnchor, constant: 18),
            star5.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
        
    
    


