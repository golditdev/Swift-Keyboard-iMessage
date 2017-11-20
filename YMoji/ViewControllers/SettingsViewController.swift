//
//  SettingsViewController.swift
//  YMoji
//
//  Created by Crane on 9/3/17.
//  Copyright © 2017 GoldITDev. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    
    // MARK: -
    // MARK: - MFMailComposeViewController Delegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func actionCancel(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionRateApp(_ sender: Any) {
        
        let appId = "your app id"
        guard let url = URL(string: "itms-apps://itunes.apple.com/app/" + appId) else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func actionInstallKeyboard(_ sender: Any) {
        
        guard let url = URL(string: "App-Prefs:root=General&path=Keyboard/KEYBOARDS") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func actionShare(_ sender: Any) {
        
        var items: NSArray = NSArray()
        
        let appId = "your app id"
        guard let appLink = URL(string: "itms-apps://itunes.apple.com/app/" + appId) else {
            return //be safe
        }
        items = [appLink]
        
        let controller = UIActivityViewController.init(activityItems: items as [AnyObject], applicationActivities: nil)
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func actionContact(_ sender: Any) {
     
        let mailController: MFMailComposeViewController = MFMailComposeViewController()

        if MFMailComposeViewController.canSendMail() {
            mailController.mailComposeDelegate = self
            
            mailController.setToRecipients(["contact@yourmail.com"])
            self.present(mailController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func actionFollowInstagram(_ sender: Any) {
        
        guard let url = URL(string: "your instagram url") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func actionPrivacy(_ sender: Any) {
        
        guard let url = URL(string: "your privacy page url") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
