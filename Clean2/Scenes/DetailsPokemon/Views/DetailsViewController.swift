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
    //var statsLists = [Details.ListDetails.ViewModel.StatsDisplay]()
    
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var base_experience: UILabel!
    @IBOutlet weak var lblStatsSpeed: UILabel!
    @IBOutlet weak var lblStatsSpeedValue: UILabel!
    @IBOutlet weak var lblStatsSpecialDefense: UILabel!
    @IBOutlet weak var lblStatsSpecialDefenseValue: UILabel!
    @IBOutlet weak var lblStatsSpecialAttack: UILabel!
    @IBOutlet weak var lblStatsSpecialAttackValue: UILabel!
    @IBOutlet weak var lblStatsDefense: UILabel!
    @IBOutlet weak var lblStatsDefenseValue: UILabel!
    @IBOutlet weak var lblStatsAttack: UILabel!
    @IBOutlet weak var lblStatsAttackValue: UILabel!
    @IBOutlet weak var lblStatsHP: UILabel!
    @IBOutlet weak var lblStatsHPValue: UILabel!
    
    
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
        getDetails()
        
        //tableView.register(UINib(nibName: "StatsDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "statsCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SVProgressHUD.dismiss()
    }
    
    func showSpinner(){
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show()
    }
    
    func getDetails(){
        showSpinner()
        let request = Details.ListDetails.Request()
        interactor?.getDetail(request: request)
    }
}
