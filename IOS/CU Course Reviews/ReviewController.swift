//
//  ViewController.swift
//  cu_reviews
//
//  Created by Heysil Baez on 5/5/21.
//

import UIKit

class ReviewController: UIViewController {
    
    let bckImage = UIImageView()
    let backButton = UIButton()
    // class information things
    let classInfoView = UIView()
    let classTitleLabel = UILabel()
    let dividerView = UIView()
    let classNameLabel = UILabel()
    let bigStars = UIImageView()
    //rating box things
    let ratingTitle = UILabel()
    let ratingView = UIView()
    let ratingLabel = UILabel()
    //difficulty box things
    let difficultyView = UIView()
    let difficultyLabel = UILabel()
    let difficultyTitle = UILabel()
    // avg class time box
    let timeView = UIView()
    let timeLabel = UILabel()
    let timeUnit = UILabel()
    let timeTitle = UILabel()
    // review details box
    let reviewTitle = UILabel()
    let reviewView = UIView()
    let reviewLabel = UILabel()
    let reviewUser = UILabel()
    let moreButton = UILabel()
    let spacedStars = UIImageView()
    // write a review button
    let buttonView = UIButton()
    let buttonImage = UIImageView()
    var reviewB : Review = Review(core: CoreRatings(course: Course(rosterName: "CS 1110", description: "Introductory Design and Programming for the Web", rating: 5), difficulty: 3, time: 8), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "Firstname Lastname")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        setupViews()
        setupConstraints()
        
    }
    func setupViews(){
        //red ellipse in backdrop
        bckImage.image = UIImage(named: "review-ellipse.png")
        bckImage.translatesAutoresizingMaskIntoConstraints = false
        bckImage.clipsToBounds = false
        bckImage.contentMode = .scaleAspectFit
        view.addSubview(bckImage)
        
        //back Button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.layer.cornerRadius = 25
        backButton.layer.shadowRadius = 3
        backButton.layer.shadowOffset = .zero
        backButton.layer.shadowOpacity = 0.20
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(backButton)
         
        //class information
        classInfoView.translatesAutoresizingMaskIntoConstraints = false
        classInfoView.alpha = 0.94
        classInfoView.layer.shadowRadius = 3
        classInfoView.layer.shadowOffset = .zero
        classInfoView.layer.shadowOpacity = 0.25
        classInfoView.layer.cornerRadius = 10
        classInfoView.backgroundColor = .white
        view.addSubview(classInfoView)
        
        classTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        classTitleLabel.text = reviewB.core.course.rosterName
        classTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(classTitleLabel)
        
        spacedStars.translatesAutoresizingMaskIntoConstraints = false
        spacedStars.image = UIImage(named: "5-stars.png")
        spacedStars.clipsToBounds = false
        spacedStars.contentMode = .scaleAspectFit
        view.addSubview(spacedStars)
        
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        dividerView.layer.borderWidth = 1
        dividerView.layer.borderColor = UIColor(red: 0.746, green: 0.746, blue: 0.746, alpha: 1).cgColor
        view.addSubview(dividerView)
        
        classNameLabel.translatesAutoresizingMaskIntoConstraints = false
        classNameLabel.text = reviewB.core.course.description
        classNameLabel.numberOfLines = 2
        classNameLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(classNameLabel)
        
    
        // rating
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.alpha = 0.94
        ratingView.layer.cornerRadius = 10
        ratingView.layer.shadowRadius = 3
        ratingView.layer.shadowOffset = .zero
        ratingView.layer.shadowOpacity = 0.25
        ratingView.backgroundColor = .white
        view.addSubview(ratingView)
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "\(reviewB.core.course.rating)/5"
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(ratingLabel)
        
        ratingTitle.translatesAutoresizingMaskIntoConstraints = false
        ratingTitle.text = "Satisfactory"
        ratingTitle.font = UIFont.systemFont(ofSize: 14)
        ratingTitle.textColor = UIColor(red: 0.604, green: 0.604, blue: 0.604, alpha: 1)
        view.addSubview(ratingTitle)
        
        //difficulty
        difficultyView.translatesAutoresizingMaskIntoConstraints = false
        difficultyView.alpha = 0.94
        difficultyView.layer.cornerRadius = 10
        difficultyView.layer.shadowRadius = 3
        difficultyView.layer.shadowOffset = .zero
        difficultyView.layer.shadowOpacity = 0.25
        difficultyView.backgroundColor = .white
        view.addSubview(difficultyView)
        
        difficultyLabel.translatesAutoresizingMaskIntoConstraints = false
        difficultyLabel.text = "\(reviewB.core.difficulty)/5"
        difficultyLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(difficultyLabel)
        
        difficultyTitle.translatesAutoresizingMaskIntoConstraints = false
        difficultyTitle.text = "Difficulty"
        difficultyTitle.font = UIFont.systemFont(ofSize: 14)
        difficultyTitle.textColor = UIColor(red: 0.604, green: 0.604, blue: 0.604, alpha: 1)
        view.addSubview(difficultyTitle)
        
        //time
        timeView.translatesAutoresizingMaskIntoConstraints = false
        timeView.alpha = 0.94
        timeView.layer.cornerRadius = 10
        timeView.layer.shadowRadius = 3
        timeView.layer.shadowOffset = .zero
        timeView.layer.shadowOpacity = 0.25
        timeView.backgroundColor = .white
        view.addSubview(timeView)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "\(reviewB.core.time)"
        timeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(timeLabel)
        
        timeUnit.translatesAutoresizingMaskIntoConstraints = false
        timeUnit.text = "hr/wk"
        timeUnit.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(timeUnit)
        
        timeTitle.translatesAutoresizingMaskIntoConstraints = false
        timeTitle.text = "Time"
        timeTitle.font = UIFont.systemFont(ofSize: 14)
        timeTitle.textColor = UIColor(red: 0.604, green: 0.604, blue: 0.604, alpha: 1)
        view.addSubview(timeTitle)

        
        //review
        reviewView.translatesAutoresizingMaskIntoConstraints = false
        reviewView.alpha = 0.94
        reviewView.layer.cornerRadius = 10
        reviewView.layer.shadowRadius = 3
        reviewView.layer.shadowOffset = .zero
        reviewView.layer.shadowOpacity = 0.20
        reviewView.backgroundColor = .white
        view.addSubview(reviewView)
        
        reviewTitle.translatesAutoresizingMaskIntoConstraints = false
        reviewTitle.text = "Reviews"
        reviewTitle.font = UIFont.systemFont(ofSize: 18)
        reviewTitle.textColor = .black
        view.addSubview(reviewTitle)
        
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.text = "\(reviewB.review)"
        reviewLabel.numberOfLines = 10
        reviewLabel.textColor = UIColor(red: 0.512, green: 0.512, blue: 0.512, alpha: 1)
        reviewLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(reviewLabel)
        
        reviewUser.translatesAutoresizingMaskIntoConstraints = false
        reviewUser.text = "\(reviewB.name)"
        reviewUser.textColor = UIColor(red: 0.512, green: 0.512, blue: 0.512, alpha: 1)
        reviewUser.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(reviewUser)
        
        bigStars.translatesAutoresizingMaskIntoConstraints = false
        bigStars.image = UIImage(named: "Review-Stars.png")
        bigStars.clipsToBounds = false
        bigStars.contentMode = .scaleAspectFit
        view.addSubview(bigStars)
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.text = "More"
        moreButton.font = UIFont.boldSystemFont(ofSize: 14)
        moreButton.textColor = UIColor(red: 0.831, green: 0, blue: 0, alpha: 1)
        view.addSubview(moreButton)
        
        //write review button
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = .white
        buttonView.layer.cornerRadius = 25
        buttonView.layer.shadowRadius = 3
        buttonView.layer.shadowOffset = .zero
        buttonView.layer.shadowOpacity = 0.20
        buttonView.setTitle("Review This Course" , for: .normal)
        buttonView.setTitleColor(UIColor(red: 0.831, green: 0, blue: 0, alpha: 1), for: .normal)
        view.addSubview(buttonView)
        
        //button image
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.image = UIImage(named: "pencil.png")
        buttonImage.clipsToBounds = false
        buttonImage.contentMode = .scaleAspectFit
        view.addSubview(buttonImage)
        
        
    }
    
    func setupConstraints(){
        //constrainst for background ellipse
        NSLayoutConstraint.activate([
            bckImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -180),
            bckImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 115),
            bckImage.heightAnchor.constraint(equalToConstant: 600),
            bckImage.widthAnchor.constraint(equalToConstant: 600)
        ])
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        //CLASS INFORMATION CONSTRAINTS
        NSLayoutConstraint.activate([
            classInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 104),
            classInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            classInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            classInfoView.heightAnchor.constraint(equalToConstant: 116)
        ])
        NSLayoutConstraint.activate([
            classTitleLabel.topAnchor.constraint(equalTo: classInfoView.topAnchor, constant: 20),
            classTitleLabel.leadingAnchor.constraint(equalTo: classInfoView.leadingAnchor, constant: 26),
        ])
        NSLayoutConstraint.activate([
            spacedStars.centerYAnchor.constraint(equalTo: classTitleLabel.centerYAnchor),
            spacedStars.trailingAnchor.constraint(equalTo: classInfoView.trailingAnchor, constant: -33)
        ])
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: classTitleLabel.bottomAnchor, constant: 4),
            dividerView.leadingAnchor.constraint(equalTo: classInfoView.leadingAnchor, constant: 26),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.widthAnchor.constraint(equalToConstant: 290)
        ])
        NSLayoutConstraint.activate([
            classNameLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 2),
            classNameLabel.leadingAnchor.constraint(equalTo: classInfoView.leadingAnchor, constant: 26),
            classNameLabel.widthAnchor.constraint(equalToConstant: 291)
        ])
        
        //RATING CONSTRAINTS
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: classInfoView.bottomAnchor, constant: 10),
            ratingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ratingView.heightAnchor.constraint(equalToConstant: 100),
            ratingView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: ratingView.topAnchor, constant: 28),
            ratingLabel.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ratingTitle.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: -15),
            ratingTitle.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor)
        ])
        
        // DIFFICULTY CONSTRAINTS
        NSLayoutConstraint.activate([
            difficultyView.topAnchor.constraint(equalTo: classInfoView.bottomAnchor, constant: 10),
            difficultyView.leadingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: 22),
            difficultyView.heightAnchor.constraint(equalToConstant: 100),
            difficultyView.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            difficultyLabel.topAnchor.constraint(equalTo: difficultyView.topAnchor, constant: 28),
            difficultyLabel.centerXAnchor.constraint(equalTo: difficultyView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            difficultyTitle.bottomAnchor.constraint(equalTo: difficultyView.bottomAnchor, constant: -15),
            difficultyTitle.centerXAnchor.constraint(equalTo: difficultyView.centerXAnchor)
        ])
        // AVG TIME CONSTRAINTS
        NSLayoutConstraint.activate([
            timeView.topAnchor.constraint(equalTo: classInfoView.bottomAnchor, constant: 10),
            timeView.leadingAnchor.constraint(equalTo: difficultyView.trailingAnchor, constant: 22),
            timeView.heightAnchor.constraint(equalToConstant: 100),
            timeView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 28),
            timeLabel.leadingAnchor.constraint(equalTo: timeView.leadingAnchor, constant: 25),
            timeUnit.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 5),
            timeUnit.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timeTitle.bottomAnchor.constraint(equalTo: timeView.bottomAnchor, constant: -15),
            timeTitle.centerXAnchor.constraint(equalTo: timeView.centerXAnchor)
        ])
        // REVIEW BOX CONSTRAINTS
        NSLayoutConstraint.activate([
            reviewTitle.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 10),
            reviewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            reviewView.topAnchor.constraint(equalTo: reviewTitle.bottomAnchor, constant: 5),
            reviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            reviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            reviewView.heightAnchor.constraint(equalToConstant: 161)
        ])
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: reviewView.topAnchor, constant: 23),
            reviewLabel.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: 26),
            reviewLabel.trailingAnchor.constraint(equalTo: reviewView.trailingAnchor, constant: -26),
        ])
        NSLayoutConstraint.activate([
            reviewUser.trailingAnchor.constraint(equalTo: reviewView.trailingAnchor, constant: -18),
            reviewUser.bottomAnchor.constraint(equalTo: reviewView.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            bigStars.centerYAnchor.constraint(equalTo: reviewUser.centerYAnchor),
            bigStars.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: 25)
        ])
        //more button
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: reviewUser.bottomAnchor, constant: 20),
            moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27)
        ])
        //write review
        NSLayoutConstraint.activate([
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 61),
            buttonView.centerYAnchor.constraint(equalTo: reviewView.centerYAnchor, constant: 186.5),
            buttonView.widthAnchor.constraint(equalToConstant: 303)
        ])
        NSLayoutConstraint.activate([
            buttonImage.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor, constant: 90),
            buttonImage.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor)

        ])
        
    }
    @objc func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    

}

