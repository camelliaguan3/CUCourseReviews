//
//  CreateReviewController.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/9/21.
//

import Foundation
import UIKit

class CreateReviewController: UIViewController {
    
    let redBackground = UIImageView()
    var mainLabel = UILabel()
    var rosterName : String = ""
    var star1Button = UIButton()
    var star2Button = UIButton()
    var star3Button = UIButton()
    var star4Button = UIButton()
    var star5Button = UIButton()
    var tapLabel = UILabel()
    let rec1 = UIView()
    let rec2 = UIView()
    let rec3 = UIView()
    let rec4 = UIView()
    let rec5 = UIView()
    let reviewLabel = UILabel()
    let satisfactoryLabel = UILabel()
    let difficultyLabel = UILabel()
    let timeLabel = UILabel()
    var reviewText = UITextView()
    var hourText = UITextField()
    let reviewBorder = UIView()
    let sat1Button = UIButton()
    let sat2Button = UIButton()
    let sat3Button = UIButton()
    let sat4Button = UIButton()
    let sat5Button = UIButton()
    let dif1Button = UIButton()
    let dif2Button = UIButton()
    let dif3Button = UIButton()
    let dif4Button = UIButton()
    let dif5Button = UIButton()
    let shareButton = UIButton()
    let satRec = UIView()
    let difRec = UIView()
    let timeRec = UIView()
    let hourLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.red
        
        redBackground.translatesAutoresizingMaskIntoConstraints = false
        redBackground.image = UIImage(named: "Review Ellipse2")
        view.addSubview(redBackground)
        
        // Creating the main label at the top of the screen "Write a Review for " + (Roster Name)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.text = "Write a Review for \(rosterName)"
        mainLabel.font = UIFont.boldSystemFont(ofSize: 18)
        mainLabel.textColor = .black
        view.addSubview(mainLabel)
        // Creating the "Tap a Star" Label
        tapLabel.translatesAutoresizingMaskIntoConstraints = false
        tapLabel.text = "Tap a Star"
        tapLabel.font = UIFont.systemFont(ofSize: 10)
        tapLabel.textColor = UIColor.black
        view.addSubview(tapLabel)
        
        // Creating the 5 star buttons that will determine the satisfactory rating
        // Creating star1Button
        star1Button.translatesAutoresizingMaskIntoConstraints = false
        star1Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star1Button.addTarget(self, action: #selector(oneStarReview), for: .touchUpInside)
        view.addSubview(star1Button)
        // Creating star2Button
        star2Button.translatesAutoresizingMaskIntoConstraints = false
        star2Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star2Button.addTarget(self, action: #selector(twoStarReview), for: .touchUpInside)
        view.addSubview(star2Button)
        // Creating star3Button
        star3Button.translatesAutoresizingMaskIntoConstraints = false
        star3Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star3Button.addTarget(self, action: #selector(threeStarReview), for: .touchUpInside)
        view.addSubview(star3Button)
        // Creating star4Button
        star4Button.translatesAutoresizingMaskIntoConstraints = false
        star4Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star4Button.addTarget(self, action: #selector(fourStarReview), for: .touchUpInside)
        view.addSubview(star4Button)
        // Creating star5Button
        star5Button.translatesAutoresizingMaskIntoConstraints = false
        star5Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star5Button.addTarget(self, action: #selector(fiveStarReview), for: .touchUpInside)
        view.addSubview(star5Button)
        
        
        // Creating the small gray rectangles that seperate each section
        // Creating the first gray rectangle
        rec1.translatesAutoresizingMaskIntoConstraints = false
        rec1.backgroundColor = UIColor.black
        rec1.backgroundColor = UIColor.black
        rec1.layer.shadowRadius = 3
        rec1.layer.shadowOffset = .zero
        rec1.layer.shadowOpacity = 0.4
        rec1.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        rec1.layer.cornerRadius = 8
        view.addSubview(rec1)
        // Creating the second gray rectangle
        rec2.translatesAutoresizingMaskIntoConstraints = false
        rec2.backgroundColor = UIColor.black
        rec2.backgroundColor = UIColor.black
        rec2.layer.shadowRadius = 3
        rec2.layer.shadowOffset = .zero
        rec2.layer.shadowOpacity = 0.4
        rec2.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        rec2.layer.cornerRadius = 8
        view.addSubview(rec2)
        // Creating the third gray rectangle
        rec3.translatesAutoresizingMaskIntoConstraints = false
        rec3.backgroundColor = UIColor.black
        rec3.backgroundColor = UIColor.black
        rec3.layer.shadowRadius = 3
        rec3.layer.shadowOffset = .zero
        rec3.layer.shadowOpacity = 0.4
        rec3.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        rec3.layer.cornerRadius = 8
        view.addSubview(rec3)
        // Creating the fourth gray rectangle
        rec4.translatesAutoresizingMaskIntoConstraints = false
        rec4.backgroundColor = UIColor.black
        rec4.backgroundColor = UIColor.black
        rec4.layer.shadowRadius = 3
        rec4.layer.shadowOffset = .zero
        rec4.layer.shadowOpacity = 0.4
        rec4.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        rec4.layer.cornerRadius = 8
        view.addSubview(rec4)
        // Creating the fifth gray rectangle
        rec5.translatesAutoresizingMaskIntoConstraints = false
        rec5.backgroundColor = UIColor.black
        rec5.layer.shadowRadius = 3
        rec5.layer.shadowOffset = .zero
        rec5.layer.shadowOpacity = 0.4
        rec5.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        rec5.layer.cornerRadius = 8
        view.addSubview(rec5)
        // Creating the broder rectangle for the review text field
        reviewBorder.translatesAutoresizingMaskIntoConstraints = false
        reviewBorder.backgroundColor = .white
        reviewBorder.layer.shadowRadius = 3
        reviewBorder.layer.shadowOffset = .zero
        reviewBorder.layer.shadowOpacity = 0.4
        reviewBorder.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        reviewBorder.layer.cornerRadius = 8
        view.addSubview(reviewBorder)
        // Creating the rectangle for satisfactory
        satRec.translatesAutoresizingMaskIntoConstraints = false
        satRec.backgroundColor = .white
        satRec.layer.shadowRadius = 3
        satRec.layer.shadowOffset = .zero
        satRec.layer.shadowOpacity = 0.4
        satRec.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        satRec.layer.cornerRadius = 8
        view.addSubview(satRec)
        // Creaitng the rectangle for difficulty
        difRec.translatesAutoresizingMaskIntoConstraints = false
        difRec.backgroundColor = .white
        difRec.layer.shadowRadius = 3
        difRec.layer.shadowOffset = .zero
        difRec.layer.shadowOpacity = 0.4
        difRec.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        difRec.layer.cornerRadius = 8
        view.addSubview(difRec)
        // Creating the rectangle for Time
        timeRec.translatesAutoresizingMaskIntoConstraints = false
        timeRec.backgroundColor = .white
        timeRec.layer.shadowRadius = 3
        timeRec.layer.shadowOffset = .zero
        timeRec.layer.shadowOpacity = 0.4
        timeRec.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        timeRec.layer.cornerRadius = 8
        view.addSubview(timeRec)
        
        // Creating the labels for each category
        // Creating the review label                UIColor.init(displayP3Red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.text = "Review"
        reviewLabel.font = UIFont.systemFont(ofSize: 14)
        reviewLabel.textColor = UIColor.black
        view.addSubview(reviewLabel)
        // Creating the Satisfactory Label
        satisfactoryLabel.translatesAutoresizingMaskIntoConstraints = false
        satisfactoryLabel.text = "Satisfactory"
        satisfactoryLabel.font = UIFont.systemFont(ofSize: 14)
        satisfactoryLabel.textColor = UIColor.black
        view.addSubview(satisfactoryLabel)
        // Creating the Difficulty Label
        difficultyLabel.translatesAutoresizingMaskIntoConstraints = false
        difficultyLabel.text = "Difficulty"
        difficultyLabel.font = UIFont.systemFont(ofSize: 14)
        difficultyLabel.textColor = UIColor.black
        view.addSubview(difficultyLabel)
        // Creating the Time Label
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "Time"
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = UIColor.black
        view.addSubview(timeLabel)
        // Creating the hour label in the time section
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.text = "hours"
        hourLabel.font = UIFont.boldSystemFont(ofSize: 14)
        hourLabel.textColor = .black
        view.addSubview(hourLabel)
        
        // Creating the buttons that text fields that make up the review
        // Creating the text field for the review itself
        reviewText.translatesAutoresizingMaskIntoConstraints = false
        reviewText.text = "Write review here..."
        reviewText.font = UIFont.systemFont(ofSize: 14)
        reviewText.backgroundColor = .clear
        view.addSubview(reviewText)
        // Creating the text field for the amount of hours worked
        hourText.translatesAutoresizingMaskIntoConstraints = false
        hourText.text = "# of"
        hourText.font = UIFont.systemFont(ofSize: 14)
        hourText.textAlignment = .center
        hourText.backgroundColor = .clear
        hourText.layer.borderWidth = 1
        hourText.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        hourText.layer.cornerRadius = 8
        hourText.addTarget(self, action: #selector(hourTextInput), for: .touchDown)
        view.addSubview(hourText)
        
        // Creating the first button for satisfactory
        sat1Button.translatesAutoresizingMaskIntoConstraints = false
        sat1Button.layer.cornerRadius = 25
        sat1Button.clipsToBounds = true
        sat1Button.backgroundColor = .clear
        sat1Button.setTitle("1", for: .normal)
        sat1Button.setTitleColor(.black, for: .normal)
        sat1Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sat1Button.layer.borderColor = UIColor.black.cgColor
        sat1Button.layer.borderWidth = 2
        sat1Button.addTarget(self, action: #selector(sat1Review), for: .touchUpInside)
        view.addSubview(sat1Button)
        // Creating the second button for satisfactory
        sat2Button.translatesAutoresizingMaskIntoConstraints = false
        sat2Button.layer.cornerRadius = 25
        sat2Button.clipsToBounds = true
        sat2Button.backgroundColor = .clear
        sat2Button.setTitle("2", for: .normal)
        sat2Button.setTitleColor(.black, for: .normal)
        sat2Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sat2Button.layer.borderColor = UIColor.black.cgColor
        sat2Button.layer.borderWidth = 2
        sat2Button.addTarget(self, action: #selector(sat2Review), for: .touchUpInside)
        view.addSubview(sat2Button)
        // Creating the third button for satisfactory
        sat3Button.translatesAutoresizingMaskIntoConstraints = false
        sat3Button.layer.cornerRadius = 25
        sat3Button.clipsToBounds = true
        sat3Button.backgroundColor = .clear
        sat3Button.setTitle("3", for: .normal)
        sat3Button.setTitleColor(.black, for: .normal)
        sat3Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sat3Button.layer.borderColor = UIColor.black.cgColor
        sat3Button.layer.borderWidth = 2
        sat3Button.addTarget(self, action: #selector(sat3Review), for: .touchUpInside)
        view.addSubview(sat3Button)
        // Creating the fourth button for satisfactory
        sat4Button.translatesAutoresizingMaskIntoConstraints = false
        sat4Button.layer.cornerRadius = 25
        sat4Button.clipsToBounds = true
        sat4Button.backgroundColor = .clear
        sat4Button.setTitle("4", for: .normal)
        sat4Button.setTitleColor(.black, for: .normal)
        sat4Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sat4Button.layer.borderColor = UIColor.black.cgColor
        sat4Button.layer.borderWidth = 2
        sat4Button.addTarget(self, action: #selector(sat4Review), for: .touchUpInside)
        view.addSubview(sat4Button)
        // Creating the fifth button for satisfactory
        sat5Button.translatesAutoresizingMaskIntoConstraints = false
        sat5Button.layer.cornerRadius = 25
        sat5Button.clipsToBounds = true
        sat5Button.backgroundColor = .clear
        sat5Button.setTitle("5", for: .normal)
        sat5Button.setTitleColor(.black, for: .normal)
        sat5Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sat5Button.layer.borderColor = UIColor.black.cgColor
        sat5Button.layer.borderWidth = 2
        sat5Button.addTarget(self, action: #selector(sat5Review), for: .touchUpInside)
        view.addSubview(sat5Button)

        // Creating the first button for difficulty
        dif1Button.translatesAutoresizingMaskIntoConstraints = false
        dif1Button.layer.cornerRadius = 25
        dif1Button.clipsToBounds = true
        dif1Button.backgroundColor = .clear
        dif1Button.setTitle("1", for: .normal)
        dif1Button.setTitleColor(.black, for: .normal)
        dif1Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dif1Button.layer.borderColor = UIColor.black.cgColor
        dif1Button.layer.borderWidth = 2
        dif1Button.addTarget(self, action: #selector(dif1Review), for: .touchUpInside)
        view.addSubview(dif1Button)
        // Creating the second button for difficulty
        dif2Button.translatesAutoresizingMaskIntoConstraints = false
        dif2Button.layer.cornerRadius = 25
        dif2Button.clipsToBounds = true
        dif2Button.backgroundColor = .clear
        dif2Button.setTitle("2", for: .normal)
        dif2Button.setTitleColor(.black, for: .normal)
        dif2Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dif2Button.layer.borderColor = UIColor.black.cgColor
        dif2Button.layer.borderWidth = 2
        dif2Button.addTarget(self, action: #selector(dif2Review), for: .touchUpInside)
        view.addSubview(dif2Button)
        // Creating the third button for difficulty
        dif3Button.translatesAutoresizingMaskIntoConstraints = false
        dif3Button.layer.cornerRadius = 25
        dif3Button.clipsToBounds = true
        dif3Button.backgroundColor = .clear
        dif3Button.setTitle("3", for: .normal)
        dif3Button.setTitleColor(.black, for: .normal)
        dif3Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dif3Button.layer.borderColor = UIColor.black.cgColor
        dif3Button.layer.borderWidth = 2
        dif3Button.addTarget(self, action: #selector(dif3Review), for: .touchUpInside)
        view.addSubview(dif3Button)
        // Creating the fourth button for difficulty
        dif4Button.translatesAutoresizingMaskIntoConstraints = false
        dif4Button.layer.cornerRadius = 25
        dif4Button.clipsToBounds = true
        dif4Button.backgroundColor = .clear
        dif4Button.setTitle("4", for: .normal)
        dif4Button.setTitleColor(.black, for: .normal)
        dif4Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dif4Button.layer.borderColor = UIColor.black.cgColor
        dif4Button.layer.borderWidth = 2
        dif4Button.addTarget(self, action: #selector(dif4Review), for: .touchUpInside)
        view.addSubview(dif4Button)
        // Creating the fifth button for difficulty
        dif5Button.translatesAutoresizingMaskIntoConstraints = false
        dif5Button.layer.cornerRadius = 25
        dif5Button.clipsToBounds = true
        dif5Button.backgroundColor = .clear
        dif5Button.setTitle("5", for: .normal)
        dif5Button.setTitleColor(.black, for: .normal)
        dif5Button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dif5Button.layer.borderColor = UIColor.black.cgColor
        dif5Button.layer.borderWidth = 2
        dif5Button.addTarget(self, action: #selector(dif5Review), for: .touchUpInside)
        view.addSubview(dif5Button)
        
        // Creating the share button at the bottom of the screen
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.backgroundColor = .white
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.red, for: .normal)
        shareButton.layer.shadowRadius = 3
        shareButton.layer.shadowOffset = .zero
        shareButton.layer.shadowOpacity = 0.4
        shareButton.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        shareButton.layer.cornerRadius = 15
        shareButton.addTarget(self, action: #selector(shareReview), for: .touchUpInside)
        view.addSubview(shareButton)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            star3Button.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            star3Button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            star3Button.widthAnchor.constraint(equalToConstant: 20),
            star3Button.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            star2Button.topAnchor.constraint(equalTo: star3Button.topAnchor),
            star2Button.trailingAnchor.constraint(equalTo: star3Button.leadingAnchor, constant: -4),
            star2Button.widthAnchor.constraint(equalToConstant: 20),
            star2Button.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            star4Button.topAnchor.constraint(equalTo: star3Button.topAnchor),
            star4Button.leadingAnchor.constraint(equalTo: star3Button.trailingAnchor, constant: 4),
            star4Button.widthAnchor.constraint(equalToConstant: 20),
            star4Button.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            star1Button.topAnchor.constraint(equalTo: star3Button.topAnchor),
            star1Button.trailingAnchor.constraint(equalTo: star2Button.leadingAnchor, constant: -4),
            star1Button.widthAnchor.constraint(equalToConstant: 20),
            star1Button.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            star5Button.topAnchor.constraint(equalTo: star3Button.topAnchor),
            star5Button.leadingAnchor.constraint(equalTo: star4Button.trailingAnchor, constant: 4),
            star5Button.widthAnchor.constraint(equalToConstant: 20),
            star5Button.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            tapLabel.topAnchor.constraint(equalTo: star3Button.bottomAnchor, constant: 5),
            tapLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            rec1.topAnchor.constraint(equalTo: tapLabel.bottomAnchor, constant: 20),
            rec1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rec1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rec1.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            rec2.topAnchor.constraint(equalTo: rec1.bottomAnchor, constant: 200),
            rec2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rec2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rec2.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            rec3.topAnchor.constraint(equalTo: rec2.bottomAnchor, constant: 120),
            rec3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rec3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rec3.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            rec4.topAnchor.constraint(equalTo: rec3.bottomAnchor, constant: 120),
            rec4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rec4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rec4.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            rec5.topAnchor.constraint(equalTo: rec4.bottomAnchor, constant: 70),
            rec5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rec5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rec5.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: rec1.bottomAnchor, constant: 10),
            reviewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            satisfactoryLabel.topAnchor.constraint(equalTo: rec2.bottomAnchor, constant: 10),
            satisfactoryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            difficultyLabel.topAnchor.constraint(equalTo: rec3.bottomAnchor, constant: 10),
            difficultyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: rec4.bottomAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            reviewBorder.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 10),
            reviewBorder.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            reviewBorder.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            reviewBorder.bottomAnchor.constraint(equalTo: rec2.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            reviewText.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 15),
            reviewText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            reviewText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            reviewText.bottomAnchor.constraint(equalTo: rec2.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            satRec.topAnchor.constraint(equalTo: satisfactoryLabel.bottomAnchor, constant: 10),
            satRec.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            satRec.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            satRec.bottomAnchor.constraint(equalTo: rec3.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            difRec.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 10),
            difRec.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            difRec.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            difRec.bottomAnchor.constraint(equalTo: rec4.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timeRec.topAnchor.constraint(equalTo: rec4.bottomAnchor, constant: 15),
            timeRec.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            timeRec.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            timeRec.bottomAnchor.constraint(equalTo: rec5.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            hourLabel.centerYAnchor.constraint(equalTo: timeRec.centerYAnchor),
            hourLabel.trailingAnchor.constraint(equalTo: timeRec.trailingAnchor, constant: -10),
            hourLabel.leadingAnchor.constraint(equalTo: timeRec.trailingAnchor, constant: -60),
        ])
        
        NSLayoutConstraint.activate([
            hourText.topAnchor.constraint(equalTo: timeRec.topAnchor, constant: 7),
            hourText.bottomAnchor.constraint(equalTo: timeRec.bottomAnchor, constant: -5),
            hourText.leadingAnchor.constraint(equalTo: timeRec.leadingAnchor, constant: 10),
            hourText.trailingAnchor.constraint(equalTo: hourLabel.leadingAnchor, constant: -5),
        ])
        
        
        NSLayoutConstraint.activate([
            sat1Button.centerYAnchor.constraint(equalTo: satRec.centerYAnchor),
            sat1Button.leadingAnchor.constraint(equalTo: satRec.leadingAnchor, constant: 15),
            sat1Button.heightAnchor.constraint(equalToConstant: 50),
            sat1Button.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            sat2Button.centerYAnchor.constraint(equalTo: satRec.centerYAnchor),
            sat2Button.leadingAnchor.constraint(equalTo: sat1Button.leadingAnchor, constant: 65),
            sat2Button.heightAnchor.constraint(equalToConstant: 50),
            sat2Button.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            sat3Button.centerYAnchor.constraint(equalTo: satRec.centerYAnchor),
            sat3Button.leadingAnchor.constraint(equalTo: sat2Button.leadingAnchor, constant: 65),
            sat3Button.heightAnchor.constraint(equalToConstant: 50),
            sat3Button.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            sat4Button.centerYAnchor.constraint(equalTo: satRec.centerYAnchor),
            sat4Button.leadingAnchor.constraint(equalTo: sat3Button.leadingAnchor, constant: 65),
            sat4Button.heightAnchor.constraint(equalToConstant: 50),
            sat4Button.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            sat5Button.centerYAnchor.constraint(equalTo: satRec.centerYAnchor),
            sat5Button.leadingAnchor.constraint(equalTo: sat4Button.leadingAnchor, constant: 65),
            sat5Button.heightAnchor.constraint(equalToConstant: 50),
            sat5Button.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            dif1Button.centerYAnchor.constraint(equalTo: difRec.centerYAnchor),
            dif1Button.leadingAnchor.constraint(equalTo: difRec.leadingAnchor, constant: 15),
            dif1Button.heightAnchor.constraint(equalToConstant: 50),
            dif1Button.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            dif2Button.centerYAnchor.constraint(equalTo: difRec.centerYAnchor),
            dif2Button.leadingAnchor.constraint(equalTo: dif1Button.leadingAnchor, constant: 65),
            dif2Button.heightAnchor.constraint(equalToConstant: 50),
            dif2Button.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            dif3Button.centerYAnchor.constraint(equalTo: difRec.centerYAnchor),
            dif3Button.leadingAnchor.constraint(equalTo: dif2Button.leadingAnchor, constant: 65),
            dif3Button.heightAnchor.constraint(equalToConstant: 50),
            dif3Button.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            dif4Button.centerYAnchor.constraint(equalTo: difRec.centerYAnchor),
            dif4Button.leadingAnchor.constraint(equalTo: dif3Button.leadingAnchor, constant: 65),
            dif4Button.heightAnchor.constraint(equalToConstant: 50),
            dif4Button.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            dif5Button.centerYAnchor.constraint(equalTo: difRec.centerYAnchor),
            dif5Button.leadingAnchor.constraint(equalTo: dif4Button.leadingAnchor, constant: 65),
            dif5Button.heightAnchor.constraint(equalToConstant: 50),
            dif5Button.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            shareButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            shareButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90),
            shareButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -90)
        ])
    }
    
    
    @objc func oneStarReview() {
        star1Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        
        star2Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star3Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star4Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star5Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
    }
    
    @objc func twoStarReview() {
        star1Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star2Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        
        star3Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star4Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star5Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
    }
    
    @objc func threeStarReview() {
        star1Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star2Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star3Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        
        star4Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
        star5Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
    }
    
    @objc func fourStarReview() {
        star1Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star2Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star3Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star4Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        
        star5Button.setImage(UIImage(named: "Hollow Star"), for: .normal)
    }
    
    @objc func fiveStarReview() {
        star1Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star2Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star3Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star4Button.setImage(UIImage(named: "Filled Star"), for: .normal)
        star5Button.setImage(UIImage(named: "Filled Star"), for: .normal)
    }
    
    @objc func sat1Review() {
        sat1Button.setTitleColor(.white, for: .normal)
        sat2Button.setTitleColor(.black, for: .normal)
        sat3Button.setTitleColor(.black, for: .normal)
        sat4Button.setTitleColor(.black, for: .normal)
        sat5Button.setTitleColor(.black, for: .normal)
        
        sat1Button.backgroundColor = .black
        sat2Button.backgroundColor = .clear
        sat3Button.backgroundColor = .clear
        sat4Button.backgroundColor = .clear
        sat5Button.backgroundColor = .clear
    }
    
    @objc func sat2Review() {
        sat1Button.setTitleColor(.white, for: .normal)
        sat2Button.setTitleColor(.white, for: .normal)
        sat3Button.setTitleColor(.black, for: .normal)
        sat4Button.setTitleColor(.black, for: .normal)
        sat5Button.setTitleColor(.black, for: .normal)
        
        sat1Button.backgroundColor = .black
        sat2Button.backgroundColor = .black
        sat3Button.backgroundColor = .clear
        sat4Button.backgroundColor = .clear
        sat5Button.backgroundColor = .clear
    }
    
    @objc func sat3Review() {
        sat1Button.setTitleColor(.white, for: .normal)
        sat2Button.setTitleColor(.white, for: .normal)
        sat3Button.setTitleColor(.white, for: .normal)
        sat4Button.setTitleColor(.black, for: .normal)
        sat5Button.setTitleColor(.black, for: .normal)
        
        sat1Button.backgroundColor = .black
        sat2Button.backgroundColor = .black
        sat3Button.backgroundColor = .black
        sat4Button.backgroundColor = .clear
        sat5Button.backgroundColor = .clear
    }
    
    @objc func sat4Review() {
        sat1Button.setTitleColor(.white, for: .normal)
        sat2Button.setTitleColor(.white, for: .normal)
        sat3Button.setTitleColor(.white, for: .normal)
        sat4Button.setTitleColor(.white, for: .normal)
        sat5Button.setTitleColor(.black, for: .normal)
        
        sat1Button.backgroundColor = .black
        sat2Button.backgroundColor = .black
        sat3Button.backgroundColor = .black
        sat4Button.backgroundColor = .black
        sat5Button.backgroundColor = .clear
    }
    
    @objc func sat5Review() {
        sat1Button.setTitleColor(.white, for: .normal)
        sat2Button.setTitleColor(.white, for: .normal)
        sat3Button.setTitleColor(.white, for: .normal)
        sat4Button.setTitleColor(.white, for: .normal)
        sat5Button.setTitleColor(.white, for: .normal)
        
        sat1Button.backgroundColor = .black
        sat2Button.backgroundColor = .black
        sat3Button.backgroundColor = .black
        sat4Button.backgroundColor = .black
        sat5Button.backgroundColor = .black
    }
    
    @objc func dif1Review() {
        dif1Button.setTitleColor(.white, for: .normal)
        dif2Button.setTitleColor(.black, for: .normal)
        dif3Button.setTitleColor(.black, for: .normal)
        dif4Button.setTitleColor(.black, for: .normal)
        dif5Button.setTitleColor(.black, for: .normal)
        
        dif1Button.backgroundColor = .black
        dif2Button.backgroundColor = .clear
        dif3Button.backgroundColor = .clear
        dif4Button.backgroundColor = .clear
        dif5Button.backgroundColor = .clear
    }
    
    @objc func dif2Review() {
        dif1Button.setTitleColor(.white, for: .normal)
        dif2Button.setTitleColor(.white, for: .normal)
        dif3Button.setTitleColor(.black, for: .normal)
        dif4Button.setTitleColor(.black, for: .normal)
        dif5Button.setTitleColor(.black, for: .normal)
        
        dif1Button.backgroundColor = .black
        dif2Button.backgroundColor = .black
        dif3Button.backgroundColor = .clear
        dif4Button.backgroundColor = .clear
        dif5Button.backgroundColor = .clear
    }
    
    @objc func dif3Review() {
        dif1Button.setTitleColor(.white, for: .normal)
        dif2Button.setTitleColor(.white, for: .normal)
        dif3Button.setTitleColor(.white, for: .normal)
        dif4Button.setTitleColor(.black, for: .normal)
        dif5Button.setTitleColor(.black, for: .normal)
        
        dif1Button.backgroundColor = .black
        dif2Button.backgroundColor = .black
        dif3Button.backgroundColor = .black
        dif4Button.backgroundColor = .clear
        dif5Button.backgroundColor = .clear
    }
    
    @objc func dif4Review() {
        dif1Button.setTitleColor(.white, for: .normal)
        dif2Button.setTitleColor(.white, for: .normal)
        dif3Button.setTitleColor(.white, for: .normal)
        dif4Button.setTitleColor(.white, for: .normal)
        dif5Button.setTitleColor(.black, for: .normal)
        
        dif1Button.backgroundColor = .black
        dif2Button.backgroundColor = .black
        dif3Button.backgroundColor = .black
        dif4Button.backgroundColor = .black
        dif5Button.backgroundColor = .clear
    }
    
    @objc func dif5Review() {
        dif1Button.setTitleColor(.white, for: .normal)
        dif2Button.setTitleColor(.white, for: .normal)
        dif3Button.setTitleColor(.white, for: .normal)
        dif4Button.setTitleColor(.white, for: .normal)
        dif5Button.setTitleColor(.white, for: .normal)
        
        dif1Button.backgroundColor = .black
        dif2Button.backgroundColor = .black
        dif3Button.backgroundColor = .black
        dif4Button.backgroundColor = .black
        dif5Button.backgroundColor = .black
    }
    
    @objc func shareReview() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hourTextInput() {
        hourText.text = ""
    }
    
        
//    @objc func dismissViewController() {
//        // TODO 9: call delegate function
//        // TODO 5: dismiss view controller
//        self.dismiss(animated: true, completion: nil)
//    }
    
}
