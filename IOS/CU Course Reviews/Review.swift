//
//  Review.swift
//  cu_reviews
//
//  Created by Heysil Baez on 5/5/21.
//

import Foundation


//a review object
class Review {
    let core : CoreRatings
    let review : String
    let name : String
    
    init(core: CoreRatings, review: String, name: String) {
        self.core = core
        self.review = review
        self.name = name
    }
}
// MARK: CONFORMED TO CODABLE - commented out until we're ready for backend
// struct Review: Codable {
//    let core : CoreRatings
//    let review : String
//    let name : String
//}
