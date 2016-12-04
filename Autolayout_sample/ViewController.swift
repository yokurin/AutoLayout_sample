//
//  ViewController.swift
//  Autolayout_sample
//
//  Created by Hayashi Tsubasa on 12/4/16.
//  Copyright © 2016 Tsubasa Hayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView: UIView = UIView()
    let yellowView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTap(sender:)))
        self.view.addGestureRecognizer(tap)
        
        redView.backgroundColor = .red
        self.view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: redView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: redView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -10)
        ])
        
        yellowView.backgroundColor = .yellow
        self.view.addSubview(yellowView)
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: yellowView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: yellowView, attribute: .left, relatedBy: .equal, toItem: redView, attribute: .right, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: yellowView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: yellowView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: yellowView, attribute: .width, relatedBy: .equal, toItem: redView, attribute: .width, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: yellowView, attribute: .height, relatedBy: .equal, toItem: redView, attribute: .height, multiplier: 1, constant: 0)
        ])
    }

    func onTap(sender: UITapGestureRecognizer) {
        
        self.view.removeConstraints(redView.constraints)
        self.view.addConstraints([
            NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: redView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 150)
        ])
        self.view.removeConstraints(yellowView.constraints)
        self.view.addConstraints([
            NSLayoutConstraint(item: yellowView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: yellowView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: yellowView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: yellowView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 110)
        ])
        
        UIView.animate(withDuration: 1.0, animations: { _ in
            self.view.layoutIfNeeded()
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

