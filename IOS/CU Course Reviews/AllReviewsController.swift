//
//  AllReviewsController.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/11/21.
//

import Foundation
import UIKit


class AllReviewsController: UIViewController {
   
    private var reviewCollection : UICollectionView!
    private let reviewCellReuseIdentifier = "reviewCellReuseIdentifier"
   

    var review1 = Review(core: CoreRatings(course: Course(rosterName: "CS 1110", description: "Introduction to Computing Using Python", rating: 5), difficulty: 2, time: 8), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
    var review2 = Review(core: CoreRatings(course: Course(rosterName: "CS 1110", description: "Introduction to Computing Using Python", rating: 5), difficulty: 2, time: 9), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
    var review3 = Review(core: CoreRatings(course: Course(rosterName: "CS 1110", description: "Introduction to Computing Using Python", rating: 5), difficulty: 4, time: 8), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
    var review4 = Review(core: CoreRatings(course: Course(rosterName: "CS 1110", description: "Introduction to Computing Using Python", rating: 5), difficulty: 5, time: 16), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
    var review5 = Review(core: CoreRatings(course: Course(rosterName: "CS 1110", description: "Introduction to Computing Using Python", rating: 5), difficulty: 5, time: 14), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
    
        
    let backgroundWhite = UIImageView()
    let backButton = UIButton()
    let titleLabel = UILabel()
    
    private var reviewData : [Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reviewData = [review1, review2, review3, review4, review5]

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .red
        // Creating the white background that goes over the red
        backgroundWhite.translatesAutoresizingMaskIntoConstraints = false
        backgroundWhite.image = UIImage(named: "All Reviews Background")
        view.addSubview(backgroundWhite)
        // Creating the back button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.layer.cornerRadius = 25
        backButton.layer.shadowRadius = 3
        backButton.layer.shadowOffset = .zero
        backButton.layer.shadowOpacity = 0.20
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(backButton)
        // Creating the title label that says "Reviews"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.text = "Reviews"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white 
        view.addSubview(titleLabel)
        
        // Creating the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        // Creating the course collection (1st row of home screen)
        reviewCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        reviewCollection.translatesAutoresizingMaskIntoConstraints = false
        reviewCollection.backgroundColor = .clear
        reviewCollection.register(ReviewCollectionViewCell.self, forCellWithReuseIdentifier: reviewCellReuseIdentifier)
        reviewCollection.dataSource = self
        reviewCollection.delegate = self
        view.addSubview(reviewCollection)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundWhite.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundWhite.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28)
        ])
        
        NSLayoutConstraint.activate([
            reviewCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            reviewCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            reviewCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            reviewCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    @objc func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
    }
     
}

extension AllReviewsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.reviewCollection.dequeueReusableCell(withReuseIdentifier: reviewCellReuseIdentifier, for: indexPath) as! ReviewCollectionViewCell
        cell.layer.shadowRadius = 3
        cell.layer.shadowOffset = .zero
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        cell.configure(for: reviewData[indexPath.item])
        return cell
    }
    
    func collectionView(_ CollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewData.count
    }
}

extension AllReviewsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ CollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->
    CGSize {
        return CGSize(width: 345, height: 160)
    }
}
