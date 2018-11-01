//
//  DetailsModels.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

enum Details {

    enum ListDetails {
        struct Request {
            
        }
        
        struct Response {
            
            struct Success {
                let detailsList: DetailsPokemon
            }
            
            struct Failure {
                let error: Error
            }
            
        }
        
        struct ViewModel {
            struct StatsDisplay {
                let name: String
                let baseAttribute: Int
            }
            
            struct DetailsDisplay {
                let id: Int
                let name: String
                let weight: Int
                let base_experience: Int
                let height: Int
                let sprites: String
                let statsList: [StatsDisplay]
            }
            
            struct Success {
                let items: DetailsDisplay
            }
            
            struct Failure {
                let message: String
            }
            
        }
    }
}
