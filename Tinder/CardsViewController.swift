//
//  CardsViewController.swift
//  Tinder
//
//  Created by Corin Nader on 10/6/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit
import QuartzCore

class CardsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageViewCenter : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 15;


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onImagePan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
//        var imageViewMidpointY = imageView.frame.size.height / 2
//        var imageViewMidpointX = imageView.frame.size.width / 2
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began{
            //println("began")
            
            imageViewCenter = imageView.center
            
        }
            
        
        else if gestureRecognizer.state == UIGestureRecognizerState.Changed{
            //println("changed")
            
            var translationPercentage = Double((translation.x/320))
            var angle = translationPercentage * 10
            
            println(translationPercentage)
            
            //UIView.animateWithDuration(0.1, animations: { () -> Void in
                if translation.x > 50 {
                    // If translation is + rotate image +10 degrees
                    
                    imageView.transform = CGAffineTransformMakeRotation(CGFloat(angle * M_PI / 180))
                    
                } else {
                    
                    // If negetive rotate -10 degrees
                    
                    imageView.transform = CGAffineTransformMakeRotation(CGFloat(angle * M_PI / 180))
                }
                    imageView.center.x = imageViewCenter.x + translation.x

            //})
            
            
         

        }
        
        else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            println(50 > translation.x)
            println(translation.x > 0)
            // Snap back to origin if x translation is < 50
            
            switch translation.x {
            case 0...50:
                imageView.center = imageViewCenter
                // Reset the rotation transform
                imageView.transform = CGAffineTransformIdentity
            case -50...0:
                imageView.center = imageViewCenter
                // Reset the rotation transform
                imageView.transform = CGAffineTransformIdentity
            case 50...300:
                imageView.frame.origin.x = 320
                imageView.transform = CGAffineTransformIdentity
//            case -300...-50:
//                imageView.frame.origin.x = -320
//                imageView.transform = CGAffineTransformIdentity
            default :
                println()
                
            }
//            if translation.x < 50  && translation.x > 0 {
//                // Set back to original point in the center of the View
//                imageView.center = imageViewCenter
//                // Reset the rotation transform
//                imageView.transform = CGAffineTransformIdentity
//                
//            } else if translation.x > -50 && translation.x < 0 {
//                println("something")
//                // If negetive rotate -10 degrees
//                
//            }

            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
