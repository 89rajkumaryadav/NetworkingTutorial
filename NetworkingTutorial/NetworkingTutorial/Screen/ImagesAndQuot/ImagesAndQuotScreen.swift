//
//  ImagesAndQuot.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/30/22.
//

import SwiftUI

struct ImagesAndQuot: View {
    
    @ObservedObject var randomImgListVM = ImagesAndQuotListVM()
    
    
    var body: some View {
        
        List{
            ForEach(randomImgListVM.randomImages, id: \.id) { randomImag in
                
                HStack{
                    Image(uiImage: randomImag.image)
                    Text(randomImag.quote)
                    
                }
            }
        }
            .task {
                await randomImgListVM.getRandomImages(ids: Array(100...101))
            }
    }
}

struct ImagesAndQuot_Previews: PreviewProvider {
    static var previews: some View {
        ImagesAndQuot()
    }
}
