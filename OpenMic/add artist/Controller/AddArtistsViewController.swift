//
//  AddArtistsViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class AddArtistsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Endpoints.topForty.getCall { (error, json) in
            print("error \(error), json \(json)")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
