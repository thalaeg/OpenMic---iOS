//
//  TutorialViewController.swift
//  Dart
//
//  Created by Michael Metzger  on 5/3/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
class TutorialViewController: UIViewController {
    private var tutorialStepModel: TutorialStepModel?
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var pageController: UIPageControl!
    
    @IBOutlet var getStartedButton: UIButton!
    
    
    @IBAction func getStartedAction(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialStepModel = TutorialStepModel(view: self, pageController: pageController, scrollView: scrollView)

    }
    
    
    override func viewDidLayoutSubviews() {
        pageController.transform = CGAffineTransform(scaleX: 3, y: 3)
//        pageController.subviews.forEach{
//            $0.transform = CGAffineTransform(scaleX: 3, y: 3)
//        }
    }

}

