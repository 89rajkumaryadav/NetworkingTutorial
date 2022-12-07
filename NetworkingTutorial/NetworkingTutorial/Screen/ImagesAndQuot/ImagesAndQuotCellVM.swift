//
//  ImagesAndQuotCellVM.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/30/22.
//

import Foundation
import UIKit

struct ImagesAndQuotCellVM: Identifiable {
    
    let id = UUID()
    let randomImages:RandomImage
    
    var image:UIImage {
        UIImage(data: randomImages.image ?? Data()) ?? UIImage(systemName: "brain.head.profile")!
    }
    
    var quote:String {
        randomImages.quote?.content ?? "N/A"
    }
    
}
