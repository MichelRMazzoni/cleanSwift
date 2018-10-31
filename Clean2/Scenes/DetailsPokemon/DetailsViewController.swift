//
//  DetailsViewController.swift
//  Clean2
//
//  Created by Michel Mazzoni on 29/10/18.
//  Copyright (c) 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

class DetailsViewController: UIViewController {

    // Var's
    var interactor: DetailsBusinessLogic?
    var router: (NSObjectProtocol & DetailsRoutingLogic & DetailsDataPassing)?
    
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var base_experience: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    // Load
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show()
        getDetails()
    }
    
    func getDetails(){
        let request = Details.ListDetails.Request()
        interactor?.getDetail(request: request)
    }
}
