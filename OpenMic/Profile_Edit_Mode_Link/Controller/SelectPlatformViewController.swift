//
//  SelectPlatformViewController.swift
//  OpenMic
//
//  Created by Mike on 9/2/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class SelectPlatformViewController: UIViewController {
    
    internal var platform: PlatFormType?
    internal var platformSelectedControlDelegate: PlatformSelectedControlDelegate?
    
    
    @IBAction func cancelAction(_ sender: Any) {
        if let platform = platform {
            platformSelectedControlDelegate?.didRemovePlatform(platform: platform)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var platformImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let platform = platform else {return}
        platformImage.image = platform.platFormImage()

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
