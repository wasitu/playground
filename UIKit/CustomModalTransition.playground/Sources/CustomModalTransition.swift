
//
//  CustomModalTransition.swift
//  report
//
//  Created by Seiya Shimokawa on 2018/02/15.
//  Copyright © 2018 Seiya Shimokawa. All rights reserved.
//

import Foundation
import UIKit

public class CustomModalTransition: NSObject {
    var isPresent: Bool = false
}

// MARK: - UIViewControllerTransitioningDelegate
extension CustomModalTransition: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension CustomModalTransition: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            presentTransition(transitionContext: transitionContext)
        } else {
            dismissalTransition(transitionContext: transitionContext)
        }
    }
    
    private func presentTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let destViewController = transitionContext.viewController(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        let destViewFinalFrame = transitionContext.finalFrame(for: destViewController)
        
        // blur
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        
        var clipsToBounds = true
        if let destView = destViewController.view {
            containerView.addSubview(destView)
            destView.frame = destViewFinalFrame.offsetBy(dx: 0, dy: destViewFinalFrame.size.height/2)
            clipsToBounds = destView.clipsToBounds
            destView.clipsToBounds = true
            destView.addSubview(effectView)
            effectView.frame = destViewFinalFrame
        }
        
        let duration = transitionDuration(using: transitionContext)
        let parameters = UISpringTimingParameters(dampingRatio: 1.0, initialVelocity: CGVector(dx: 0.5, dy: 0.5))
        let animator = UIViewPropertyAnimator(duration: duration, timingParameters: parameters)
        animator.addAnimations {
            if let destView = destViewController.view {
                destView.frame = destViewFinalFrame
            }
            effectView.effect = nil
        }
        animator.addCompletion({ (position) in
            if let destView = destViewController.view {
                destView.clipsToBounds = clipsToBounds
            }
            effectView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        animator.startAnimation()
    }
    
    private func dismissalTransition(transitionContext: UIViewControllerContextTransitioning) {
        let sourceViewController = transitionContext.viewController(forKey: .from)
        
        // blur
        let effectView = UIVisualEffectView(effect: nil)
        
        if let srcView = sourceViewController?.view {
            srcView.clipsToBounds = true
            srcView.addSubview(effectView)
            effectView.frame = srcView.bounds
        }
        
        let duration = transitionDuration(using: transitionContext)
        let parameters = UICubicTimingParameters(animationCurve: .easeInOut)
            //UISpringTimingParameters(dampingRatio: 1.0, initialVelocity: CGVector(dx: 0.2, dy: 0.2))
        let animator = UIViewPropertyAnimator(duration: duration, timingParameters: parameters)
        animator.addAnimations {
            if let srcView = sourceViewController?.view {
                srcView.alpha = 0
                srcView.frame = srcView.frame.offsetBy(dx: 0, dy: srcView.bounds.height*0.8)
            }
            effectView.effect = UIBlurEffect(style: .light)
        }
        animator.addCompletion({ (position) in
            effectView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        animator.startAnimation()
    }
}
