//
//  ViewController.swift
//  ASToast
//
//  Created by Abdullah Selek on 10/06/15.
//  Copyright (c) 2015 Abdullah Selek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isShowingActivity: Bool! = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Button action
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        switch(sender.tag) {
        case 0:
            // make a toast with single text
            self.view.makeToast("Single text toast", backgroundColor: nil)
            break
        case 1:
            // make a toast with text, title, position and duration
            self.view.makeToast("Toast with custom text, title and duration", duration: TimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject, title: "Title", backgroundColor: UIColor.blue)
            break
        case 2:
            // Make toast with an image
            self.view.makeToast("Toast with an image", duration: TimeInterval(3.0), position: ASToastPosition.ASToastPositionTop.rawValue as AnyObject, image: UIImage(named: "apple_logo"), backgroundColor: UIColor.blue)
            break
        case 3:
            // Make toast with an title & image
            self.view.makeToast("Toast with an title & image", duration: TimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject, title: "Title", image: UIImage(named: "apple_logo"), backgroundColor: UIColor.blue)
            break
        case 4:
            // Show a custom view as toast
            let customView: UIView! = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 300.0))
            customView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin]
            customView.backgroundColor = UIColor.green

            self.view.showToast(customView, duration: TimeInterval(3.0), position: ASToastPosition.ASToastPositionCenter.rawValue as AnyObject)
            break
        case 5:
            // Show an imageView as toast, on center at point (110,110)
            let toastImageView: UIImageView! = UIImageView(image: UIImage(named: "apple_logo"))
            self.view.showToast(toastImageView, duration: TimeInterval(3.0), position: NSValue(cgPoint: CGPoint(x: 110, y: 110)))
            break;
        case 6:
            let button: UIButton! = sender as! UIButton
            if !isShowingActivity {
                self.view.makeToastActivity()
                button.setTitle("Hide Activity", for: UIControlState())
            } else {
                self.view.hideToastActivity()
                button.setTitle("Show Activity", for: UIControlState())
            }
            
            isShowingActivity = !isShowingActivity
            break
        default:
            break
        }
    }

}

