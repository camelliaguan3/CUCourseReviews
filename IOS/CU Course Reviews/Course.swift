//
//  Course.swift
//  CU Course Reviews
//
//  Created by John Fernandez on 5/5/21.
//

import Foundation
import UIKit

class Course {
    
    // roster name of the course that will be in each cell e.g. "CS 1110"
    var rosterName : String
    // description of course that will be in each cell e.g. "Discrete Structures"
    var description : String
    // rating for the course e.g. 5/5 stars (will be useful when implementing stars later) 
    var rating : Int
    
    init(rosterName: String, description: String, rating: Int) {
        self.rosterName = rosterName
        self.description = description
        self.rating = rating
    }
}

// MARK: CONFORMED TO CODABLE - commented out until we're ready for backend
//struct Course: Codable {
//
//    // roster name of the course that will be in each cell e.g. "CS 1110"
//    var rosterName : String
//    // description of course that will be in each cell e.g. "Discrete Structures"
//    var description : String
//    // rating for the course e.g. 5/5 stars (will be useful when implementing stars later)
//    var rating : Int
//}


