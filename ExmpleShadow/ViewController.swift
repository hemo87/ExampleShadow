//
//  ViewController.swift
//  ExmpleShadow
//
//  Created by Marc Heminsley on 13/04/2019.
//  Copyright © 2019 MarcHeminsley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var someView: UIView!
    @IBOutlet var someButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View Shadow
        let shadowWidth: CGFloat = 1.2 // Shadow width, will be the width furthest away from the view, this is equivalent to 120% of the views width
        let shadowHeight: CGFloat = 0.3 // Shadow height, again this is equivalent to 10%
        let shadowRadius: CGFloat = 5
        let width = someView.frame.width
        let height = someView.frame.height // Get width and height of the view
        
        // Plot the path
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: shadowRadius / 2, y: height - shadowRadius / 2))
        shadowPath.addLine(to: CGPoint(x: width - shadowRadius / 2, y: height - shadowRadius / 2))
        shadowPath.addLine(to: CGPoint(x: width * shadowWidth, y: height + (height * shadowHeight)))
        shadowPath.addLine(to: CGPoint(x: width * -(shadowWidth - 1), y: height + (height * shadowHeight)))
        // Add shadow
        someView.layer.shadowPath = shadowPath.cgPath
        someView.layer.shadowRadius = shadowRadius
        someView.layer.shadowOffset = .zero
        someView.layer.shadowOpacity = 0.2
        
        
        // Button Shadow
        
        let buttonHeight = someButton.frame.height
        let buttonWidth = someButton.frame.width
        
        let shadowSize: CGFloat = 15
        let contactRect = CGRect(x: -shadowSize, y: buttonHeight - (shadowSize * 0.2), width: buttonWidth + shadowSize * 2, height: shadowSize)
        someButton.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        someButton.layer.shadowRadius = 5
        someButton.layer.shadowOpacity = 0.6
    }


}

