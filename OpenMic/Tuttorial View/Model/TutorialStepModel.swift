 //
//  TutorialStepModel.swift
//  Dart
//
//  Created by Michael Metzger  on 5/3/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class TutorialStepModel: NSObject {
    
    var pageController: UIPageControl
    var viewController: UIViewController
    var scrollView: UIScrollView
    var tuttorialStepDelegate: CreateTutorialStepDelegate?
    
    init(view: UIViewController, pageController: UIPageControl, scrollView: UIScrollView) {
        self.viewController = view
        self.pageController = pageController
        self.scrollView = scrollView
        super.init()
        tuttorialStepDelegate = self
        self.scrollView.delegate = self
        SetupViews()
    }
        
    private func SetupViews() {
        guard let stepDelegate = tuttorialStepDelegate else {return}
        let page1 = stepDelegate.createTutorialStep(title: "Welcome", message: "Start using OpenMic like a pro", image: "page1")
        let page2 = stepDelegate.createTutorialStep(title: "Local Shows", message: "Keep up with your local performing arts scene by watching shows by artist who have gon live in your area", image: "page2")
        let page3 = stepDelegate.createTutorialStep(title: "Send Tips", message: "Help us in our mission to make staving artists a thing of the past.  If you like a show send the performer a tip!", image: "page3")
         let page4 = stepDelegate.createTutorialStep(title: "Upcoming Shows", message: "Never miss a show by setting reminders on upcoming shows you are interested in watching", image: "page4")
        let tutorialPages = [page1, page2, page3, page4]
        tuttorialStepDelegate?.setConstraints(with: tutorialPages)
        
        
    }
    

}


extension TutorialStepModel: UIScrollViewDelegate, CreateTutorialStepDelegate {
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        pageController.currentPage = Int(round(pageFraction))
       
    }
    
}

