//  ViewController.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/5/21.
//

import UIKit

class ViewController: UIViewController {

    // Views
    private var coursesCollection: UICollectionView!
    private var viewedCollection: UICollectionView!
    private var reviewedCollection: UICollectionView!
    let backgroundRed = UIImageView()
    let searchBar = UITextField()
    let searchBarEllipse = UIView()
    let searchImage = UIButton()
    let suggestionsLabel = UILabel()
    let viewedLabel = UILabel()
    let reviewedLabel = UILabel()
    let logo = UIImageView()
    
    // Come back to later in case changing the font to bold doesn't work
//    let suggestionsImage = UIImageView()
//    let viewedImage = UIImageView()
//    let reviewedImage = UIImageView()
    
    // Data
    private var courseData: [Course] = []
    private var viewedData: [Course] = []
    private var reviewedData: [Course] = []
    private var sections: [String] = []
    private var reviewsSugg: [Review] = []
    private var reviewsViewed: [Review] = []
    private var reviewsData: [Review] = []
    var searchedCourses: [Course] = []
    
    // Constants
    private let coursesCellReuseIdentifier = "coursesCellReuseIdentifier"
    private let coursesCellReuseIdentifier2 = "coursesCellReuseIdentifier"
    private let coursesCellReuseIdentifier3 = "coursesCellReuseIdentifier3"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 20
    
    // Dummy Data
    var course1 : Course?
    var course2 : Course?
    var course3 : Course?
    var course4 : Course?
    var course5 : Course?
    
    var review1 : Review?
    var review2 : Review?
    var review3 : Review?
    var review4 : Review?
    var review5 : Review?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        createDummyData()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        // Making the background of the screen white
        view.backgroundColor = UIColor.white
        // Creating the background to have the red on top of the white
        backgroundRed.translatesAutoresizingMaskIntoConstraints = false
        backgroundRed.image = UIImage(named:"Home Ellipse")
        view.addSubview(backgroundRed)
        // Creating the ellispe for the search bar
        searchBarEllipse.translatesAutoresizingMaskIntoConstraints = false
        searchBarEllipse.layer.cornerRadius = 25
        searchBarEllipse.backgroundColor = UIColor.white
        view.addSubview(searchBarEllipse)
        // Creating the logo
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named:"Logo")
        view.addSubview(logo)
        // Creating the search bar on the home page
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.text = "Search Keywords e.g. INFO or FWS"
        searchBar.font = UIFont.boldSystemFont(ofSize: 14)
        searchBar.textColor = UIColor(displayP3Red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        searchBar.addTarget(self, action: #selector(emptySearchBar), for: .touchDown)
        view.addSubview(searchBar)
        // Creating the magnifying glass for the search bar
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.backgroundColor = .clear
        searchImage.setImage(UIImage(named: "Search.png"), for: .normal)
        searchImage.layer.cornerRadius = 25
        searchImage.layer.shadowRadius = 3
        searchImage.layer.shadowOffset = .zero
        searchImage.layer.shadowOpacity = 0.20
        searchImage.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(searchImage)
        // Creating the suggestions label
        suggestionsLabel.translatesAutoresizingMaskIntoConstraints = false
        suggestionsLabel.text = "Suggestions"
        suggestionsLabel.font = UIFont.boldSystemFont(ofSize: 22)
        suggestionsLabel.textColor = UIColor.white
        view.addSubview(suggestionsLabel)
        // Creating the viewed label
        viewedLabel.translatesAutoresizingMaskIntoConstraints = false
        viewedLabel.text = "Viewed"
        viewedLabel.font = UIFont.boldSystemFont(ofSize: 22)
        viewedLabel.textColor = UIColor.white
        view.addSubview(viewedLabel)
        // Creating the reviewed label
        reviewedLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewedLabel.text = "Reviewed"
        reviewedLabel.font = UIFont.boldSystemFont(ofSize: 22)
        reviewedLabel.textColor = UIColor.white
        view.addSubview(reviewedLabel)
        
        // Perhaps using an image in order to use the font in bold (come back to later)
//        suggestionsImage.translatesAutoresizingMaskIntoConstraints = false
//        suggestionsImage.image = UIImage(named:"Search")
//        view.addSubview(suggestionsImage)
//        viewedImage.translatesAutoresizingMaskIntoConstraints = false
//        viewedImage.image = UIImage(named:"Search")
//        view.addSubview(viewedImage)
//        reviewedImage.translatesAutoresizingMaskIntoConstraints = false
//        reviewedImage.image = UIImage(named:"Search")
//        view.addSubview(reviewedImage)
        //
        
        
        // Creating the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        // Creating the course collection (1st row of home screen)
        coursesCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coursesCollection.translatesAutoresizingMaskIntoConstraints = false
        coursesCollection.backgroundColor = .clear
        coursesCollection.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: coursesCellReuseIdentifier)
        coursesCollection.dataSource = self
        coursesCollection.delegate = self
        layout.sectionInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
        view.addSubview(coursesCollection)
        // Creating the viewed collection (2nd row of home screen)
        viewedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        viewedCollection.translatesAutoresizingMaskIntoConstraints = false
        viewedCollection.backgroundColor = .clear
        viewedCollection.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: coursesCellReuseIdentifier2)
        viewedCollection.dataSource = self
        viewedCollection.delegate = self
        view.addSubview(viewedCollection)
        // Creating the reviewed collection (3rd row of home screen)
        reviewedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        reviewedCollection.translatesAutoresizingMaskIntoConstraints = false
        reviewedCollection.backgroundColor = .clear
        reviewedCollection.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: coursesCellReuseIdentifier3)
        reviewedCollection.dataSource = self
        reviewedCollection.delegate = self
        view.addSubview(reviewedCollection)
    }
    
    func setupConstraints() {
        let collectionPadding = CGFloat(16)
        
        NSLayoutConstraint.activate([
            searchBarEllipse.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            searchBarEllipse.heightAnchor.constraint(equalToConstant: 50),
            searchBarEllipse.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            searchBarEllipse.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.centerYAnchor.constraint(equalTo: searchBarEllipse.centerYAnchor),
            searchBar.leadingAnchor.constraint(equalTo: searchBarEllipse.leadingAnchor, constant: 21),
            searchBar.trailingAnchor.constraint(equalTo: searchBarEllipse.trailingAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            searchImage.centerYAnchor.constraint(equalTo: searchBarEllipse.centerYAnchor),
            searchImage.trailingAnchor.constraint(equalTo: searchBarEllipse.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            coursesCollection.topAnchor.constraint(equalTo: searchBarEllipse.bottomAnchor, constant: 40),
            coursesCollection.bottomAnchor.constraint(equalTo: searchBarEllipse.bottomAnchor, constant: 204),
            coursesCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: collectionPadding),
            coursesCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            viewedCollection.topAnchor.constraint(equalTo: searchBarEllipse.bottomAnchor, constant: 234),
            viewedCollection.bottomAnchor.constraint(equalTo: searchBarEllipse.bottomAnchor, constant: 398),
            viewedCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: collectionPadding),
            viewedCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            reviewedCollection.topAnchor.constraint(equalTo: searchBarEllipse.bottomAnchor, constant: 428),
            reviewedCollection.bottomAnchor.constraint(equalTo: searchBarEllipse.bottomAnchor, constant: 592),
            reviewedCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: collectionPadding),
            reviewedCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            suggestionsLabel.bottomAnchor.constraint(equalTo: coursesCollection.topAnchor, constant: 3),
            suggestionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 19),
            suggestionsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            viewedLabel.bottomAnchor.constraint(equalTo: viewedCollection.topAnchor, constant: 3),
            viewedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 19),
            viewedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            reviewedLabel.bottomAnchor.constraint(equalTo: reviewedCollection.topAnchor, constant: 3),
            reviewedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 19),
            reviewedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            logo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logo.heightAnchor.constraint(equalToConstant: 75),
            logo.widthAnchor.constraint(equalToConstant: 75),
        ])
    }

    func createDummyData() {
        course1 = Course(rosterName: "CS 1110", description: "Introduction to Computing Using Python", rating: 5)
        course2 = Course(rosterName: "CS 2110", description: "Object-Oriented Programming and Data Structures", rating: 5)
        course3 = Course(rosterName: "CS 2800", description: "Discrete Structures", rating: 5)
        course4 = Course(rosterName: "CS 3110", description: "Data Structures and Functional Programming", rating: 5)
        course5 = Course(rosterName: "CS 3410", description: "Computer System Organization and Programming", rating: 5)
        courseData = [course1!, course2!, course3!, course4!, course5!]
        viewedData = [course3!, course5!, course2!, course1!, course4!]
        reviewedData = [course5!, course4!, course3!, course2!, course1!]
    }
    func setReviewData(){
        review1 = Review(core: CoreRatings(course: course1!, difficulty: 2, time: 8), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
        review2 = Review(core: CoreRatings(course: course2!, difficulty: 2, time: 9), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
        review3 = Review(core: CoreRatings(course: course3!, difficulty: 4, time: 8), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
        review4 = Review(core: CoreRatings(course: course4!, difficulty: 5, time: 16), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
        review5 = Review(core: CoreRatings(course: course5!, difficulty: 5, time: 14), review: "“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio pellentesque leo phasellus fermentum tempor, cursus nisi neque orci. Vulputate tellus morbi ac praesent vulputate commodo suspendisse id etiam.”", name: "John Doe")
        reviewsSugg = [review1!, review2!, review3!, review4!, review5!]
        reviewsViewed = [review3!, review5!, review2!, review1!, review4!]
        reviewsData = [review5!, review4!, review3!, review2!, review1!]
    }
    
    @objc func emptySearchBar() {
        searchBar.text = ""
        searchBar.textColor = .black
    }
    @objc func dismissViewController() {
        let searchController = SearchController()
        for i in courseData {
            if i.rosterName == searchBar.text {
                searchedCourses.append(i)
            }
        }
//        print(searchedCourses[0].rosterName)
        searchController.courseData = searchedCourses
        self.navigationController?.pushViewController(searchController, animated: true)
        searchedCourses = []
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.coursesCollection {
            let cellA = self.coursesCollection.dequeueReusableCell(withReuseIdentifier: coursesCellReuseIdentifier, for: indexPath) as! CoursesCollectionViewCell
            cellA.layer.shadowRadius = 3
            cellA.layer.shadowOffset = .zero
            cellA.layer.shadowOpacity = 0.4
            cellA.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            cellA.configure(for: courseData[indexPath.item])
            return cellA
        } else if collectionView == self.viewedCollection {
            let cellB = self.viewedCollection.dequeueReusableCell(withReuseIdentifier: coursesCellReuseIdentifier2, for: indexPath) as! CoursesCollectionViewCell
            cellB.layer.shadowRadius = 3
            cellB.layer.shadowOffset = .zero
            cellB.layer.shadowOpacity = 0.4
            cellB.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            cellB.configure(for: viewedData[indexPath.item])
            return cellB
        } else {
            let cellC = self.reviewedCollection.dequeueReusableCell(withReuseIdentifier: coursesCellReuseIdentifier3, for: indexPath) as! CoursesCollectionViewCell
            cellC.layer.shadowRadius = 3
            cellC.layer.shadowOffset = .zero
            cellC.layer.shadowOpacity = 0.4
            cellC.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            cellC.configure(for: reviewedData[indexPath.item])
            return cellC
        }
    }
    
    
    
    func collectionView(_ CollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if CollectionView == self.coursesCollection{
            return courseData.count
        } else if CollectionView == self.viewedCollection{
            return viewedData.count
        } else {
            return reviewedData.count
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ CollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 158, height: 158)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setReviewData()
        let reviewController = ReviewController()
        if collectionView == self.coursesCollection {
            reviewController.reviewB = reviewsSugg[indexPath.row]
        }else if collectionView == self.viewedCollection {
            reviewController.reviewB = reviewsViewed[indexPath.row]
        }
        else {
            reviewController.reviewB = reviewsData[indexPath.row]
        }
        self.navigationController?.pushViewController(reviewController, animated: true)
    }
}
