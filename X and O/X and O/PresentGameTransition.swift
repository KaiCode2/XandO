//
//  PresentGameTransition.swift
//  X and O
//
//  Created by Kai Aldag on 2016-03-17.
//  Copyright © 2016 Kai Aldag. All rights reserved.
//

import UIKit

class presentGameTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    //MARK: UIViewControllerAnimatedTransitioning conformance methods
    
    @objc func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    @objc func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        guard (toView != nil && fromView != nil) else { fatalError("toView and fromView cannot be nil. Terminating.") }
        
        toView?.alpha = 0
        fromView?.alpha = 1
        
        transitionContext.containerView()?.addSubview(toView!)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { _ in
            toView?.alpha = 1
            fromView?.alpha = 0
            }, completion: { _ in
                transitionContext.completeTransition(true)
        })
        
    }
}
