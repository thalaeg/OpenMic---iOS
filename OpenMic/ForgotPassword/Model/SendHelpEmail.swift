//
//  ComposeMailProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/21/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import MessageUI


class SendHelpEmail: NSObject, MFMailComposeViewControllerDelegate {
    
    private let composeVC = MFMailComposeViewController()
    private var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        super.init()
        composeVC.mailComposeDelegate = self
        sendEmail()
        
    }
    
    
    private func sendEmail() {
        
        composeVC.setToRecipients(["teas@gmail.com"])
        composeVC.setSubject("test subject")
        viewController.present(composeVC, animated: true, completion: nil)
        
        
    }
    
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
   
    
}







