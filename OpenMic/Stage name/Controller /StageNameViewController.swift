//
//  StageNameViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/8/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
class StageNameViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customizeButtons()
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

@IBDesignable extension StageNameViewController {
    private func customizeButtons() {
        let nextButton = UIButton()
        nextButton.frame = CGRect(x: 0, y: 0, width: 50, height: 21)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)

        nextButton.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1)
        nextButton.layer.cornerRadius = 15
            //nextButton.bounds.midY
        let rightbarbuttonItem = UIBarButtonItem(customView: nextButton)
        self.navigationItem.rightBarButtonItem = rightbarbuttonItem
        
        
    }
    
}
