//
//  GetItemsModels.swift
//  Clean2
//
//  Created by Michel Mazzoni on 25/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

enum GetItems {

    enum GetListItems {
        struct Request {
            
        }
        
        struct Response {
            
            struct Success {
                let itemsList: [String]
            }
            
            struct Failure {
                let error: Error
            }
            
        }
        
        struct ViewModel {
         
            struct ItemsDisplay {
                let title: String
            }
            
            struct Success {
                let items: [ItemsDisplay]
            }
            
            struct Failure {
                let message: String
            }
            
        }
    }
    
}
