//
//  FavGenreViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class FavGenreViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    private var generModel: FaveGenreModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generModel = FaveGenreModel(collectionView: collectionView)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
