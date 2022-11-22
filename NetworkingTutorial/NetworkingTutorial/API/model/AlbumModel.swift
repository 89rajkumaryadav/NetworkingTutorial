//
//  AlbumModel.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/22/22.
//

import Foundation


struct AlbumModel: Codable, Identifiable{
    let id: Int?
    let userId:Int?
    let title: String?
}
