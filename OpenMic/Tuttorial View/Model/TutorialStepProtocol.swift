//
//  TutorialStepProtocol.swift
//  Dart
//
//  Created by Michael Metzger  on 5/3/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

protocol CreateTutorialStepDelegate {
    var scrollView: UIScrollView {get}
    var viewController: UIViewController {get}
    
}

extension CreateTutorialStepDelegate {
    
    func createTutorialStep(title: String, message: String, image: String) -> TutorialStepViewController {
        let tutorialStep = viewController.storyboard?.instantiateViewController(withIdentifier: "TutorialStepViewController") as! TutorialStepViewController
        tutorialStep.view.translatesAutoresizingMaskIntoConstraints = false
        tutorialStep.header = title
        tutorialStep.message = message
        tutorialStep.imageForSlide = UIImage(named: "\(image).png")
        
        scrollView.addSubview(tutorialStep.view)
        viewController.addChildViewController(tutorialStep)
        tutorialStep.didMove(toParentViewController: viewController)
        return tutorialStep
    }
    
    func setConstraints(with tutorialStepControllers: [TutorialStepViewController]) {
        scrollView.isPagingEnabled = true
        
        
        let metrics = ["edgeMargin" : 0, "betweenMargin" : 0]

        let views: [String : UIView] = ["view" : viewController.view, "page1" : tutorialStepControllers[0].view, "page2" : tutorialStepControllers[1].view, "page3" : tutorialStepControllers[2].view]
        let verticalContraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: [], metrics: nil, views: views)
        let horizontalContrains = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[page1(==view)]-betweenMargin-[page2(==view)]-betweenMargin-[page3(==view)]-edgeMargin-|", options: [.alignAllTop, .alignAllBottom], metrics: metrics, views: views)
        NSLayoutConstraint.activate(verticalContraints + horizontalContrains)
        
    }
    
}

