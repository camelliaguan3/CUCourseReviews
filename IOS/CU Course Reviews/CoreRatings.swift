//
//  CoreRatings.swift
//  CU Course Reviews
//
//  Created by Heysil Baez on 5/5/21.
//

import Foundation
// difficulty, name, star rating, avg time
class CoreRatings {
    let course : Course
    let difficulty : Int
    let time : Int
    init(course : Course, difficulty : Int, time: Int){
        self.course = course
        self.difficulty = difficulty
        self.time = time
    }
}

