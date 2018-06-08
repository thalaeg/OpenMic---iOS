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
    private var scrollToNextPageDelegate: ScrollToNextPageDelegate?
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var pageController: UIPageControl!
    
    @IBOutlet var getStartedButton: UIButton!
    
    
    @IBAction func getStartedAction(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: self)
        
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
        scrollToNextPageDelegate?.scrollToNextPage()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialStepModel = TutorialStepModel(view: self, pageController: pageController, scrollView: scrollView)
        scrollToNextPageDelegate = tutorialStepModel

    }
    
    
    override func viewDidLayoutSubviews() {
        pageController.transform = CGAffineTransform(scaleX: 3, y: 3)
        pageController.subviews.forEach{
            $0.layer.borderWidth  = 0.5
            $0.layer.borderColor = #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8196078431, alpha: 1)
        }
    }

}

