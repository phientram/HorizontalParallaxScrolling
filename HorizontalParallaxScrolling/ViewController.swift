//
//  ViewController.swift
//  HorizontalParallaxScrolling
//
//  Created by Phien Tram on 4/21/16.
//  Copyright © 2016 Phien Tram. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var contentScrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func maximumOffsetForScrollView(scrollView: UIScrollView) -> CGFloat {
        let contentWidth = scrollView.contentSize.width;
        let frameWidth = CGRectGetWidth(scrollView.frame);
    
        return contentWidth - frameWidth;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // this is the delegate method for the content scroll view.
        // I'm only doing horizontal stuff here, you can do vertical too if you want
        
        let maximumContentOffset = maximumOffsetForScrollView(self.contentScrollView);
        let currentOffset = self.contentScrollView.contentOffset.x;
        
        let percentageOffset = currentOffset/maximumContentOffset;
        
        let maximumImageOffset = maximumOffsetForScrollView(self.imageScrollView);
        let actualImageOffset = maximumImageOffset * percentageOffset;
        
        imageScrollView.setContentOffset( CGPointMake(actualImageOffset, 0), animated: false);
    }
    
}

