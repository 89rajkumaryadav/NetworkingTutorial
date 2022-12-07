//
//  RandomImage.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/30/22.
//

import Foundation

struct RandomImage: Decodable {
    let image: Data?
    let quote: Quote?
}

struct Quote: Decodable {
    let content: String?
}
