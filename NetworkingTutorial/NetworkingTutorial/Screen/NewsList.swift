//
//  NewsList.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/17/22.
//

import Foundation

import SwiftUI

struct NewsList: View {
   private let  newsVM = NewsListVM()
    var body: some View {
        VStack{
            
        
        }.onAppear(){
        
            Task{
                await newsVM.getNewsList()
            }
           
        }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}








