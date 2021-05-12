//  SearchController.swift
//  CU Course Reviews
//
//  Created by Heysil Baez on 5/12/21.
//

import UIKit

class SearchController: UIViewController {

    // Views
    private var coursesCollection: UICollectionView!
    let backgroundRed = UIImageView()
    let suggestionsLabel = UILabel()
    let logo = UIImageView()
    let backButton = UIButton()
    
    // Come back to later in case changing the font to bold doesn't work
//    let suggestionsImage = UIImageView()
//    let viewedImage = UIImageView()
//    let reviewedImage = UIImageView()
    
    // Data
    var courseData: [Course] = []
    
    // Constants
    private let coursesCellReuseIdentifier = "coursesCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 20

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
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

        // Creating the logo
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named:"Logo")
        view.addSubview(logo)
        
        // Creating the suggestions label
        suggestionsLabel.translatesAutoresizingMaskIntoConstraints = false
        suggestionsLabel.text = "Search Results"
        suggestionsLabel.font = UIFont.boldSystemFont(ofSize: 22)
        suggestionsLabel.textColor = UIColor.white
        view.addSubview(suggestionsLabel)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.layer.cornerRadius = 25
        backButton.layer.shadowRadius = 3
        backButton.layer.shadowOffset = .zero
        backButton.layer.shadowOpacity = 0.20
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(backButton)
        
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
        layout.scrollDirection = .vertical

        // Creating the course collection (1st row of home screen)
        coursesCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coursesCollection.translatesAutoresizingMaskIntoConstraints = false
        coursesCollection.backgroundColor = .clear
        coursesCollection.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: coursesCellReuseIdentifier)
        coursesCollection.dataSource = self
        coursesCollection.delegate = self
        layout.sectionInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
        view.addSubview(coursesCollection)
        
    }
    
    func setupConstraints() {
        let collectionPadding = CGFloat(16)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            suggestionsLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            suggestionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 19),
            suggestionsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            coursesCollection.topAnchor.constraint(equalTo: suggestionsLabel.bottomAnchor, constant: 25),
            coursesCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 204),
            coursesCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: collectionPadding),
            coursesCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        
        NSLayoutConstraint.activate([
            logo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logo.heightAnchor.constraint(equalToConstant: 75),
            logo.widthAnchor.constraint(equalToConstant: 75),
        ])
    }
    @objc func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
    }

    
}

extension SearchController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cellA = self.coursesCollection.dequeueReusableCell(withReuseIdentifier: coursesCellReuseIdentifier, for: indexPath) as! CoursesCollectionViewCell
            cellA.layer.shadowRadius = 3
            cellA.layer.shadowOffset = .zero
            cellA.layer.shadowOpacity = 0.4
            cellA.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            cellA.configure(for: courseData[indexPath.item])
            return cellA
        }
    
    
    
    func collectionView(_ CollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return courseData.count
        
    }
    
    
}

extension SearchController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ CollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 158, height: 158)
    }
}

extension SearchController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let reviewController = AllReviewsController()
        self.navigationController?.pushViewController(reviewController, animated: true)
    }
}
