//
//  AlbumScreen.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/22/22.
//

import Foundation
import SwiftUI

struct AlbumScreen: View {
  @ObservedObject  var  albumVM = AlbumScreenListVM()
    var body: some View {
        VStack{
            List{
                ForEach(albumVM.allAlbum) { album in
                    Text(album.title).padding()
                }
            }
        
        }.overlay{
            if albumVM.isLoading {
              ProgressView("Loading Album...")
            }
        }
        .onAppear(){
        
            Task{
                await albumVM.getAlbumList()
            }
           
        }
    }
}

struct AlbumScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScreen()
    }
}








