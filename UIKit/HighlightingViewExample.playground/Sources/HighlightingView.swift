import UIKit

public class HighlightingView: UIView {
    
    var rangeRate = 0.75
    
    private let gradientLayer = CAGradientLayer()
    private var isAnimating: Bool = false
    private var observer: NSObjectProtocol?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    deinit {
        if let observer = self.observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    private func initialize() {
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor,
            UIColor.white.cgColor,
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = [
            NSNumber(value: -1.0 * rangeRate * 2),
            NSNumber(value: -1.0 * rangeRate),
            NSNumber(value: 0.0)
        ]
        
        layer.mask = gradientLayer
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { [weak self] (notification) in
            if self?.isAnimating ?? false { self?.startAnimation() }
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    public func startAnimation() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [
            NSNumber(value: -1.0 * rangeRate * 2),
            NSNumber(value: -1.0 * rangeRate),
            NSNumber(value: 0.0)
        ]
        animation.toValue = [
            NSNumber(value: 1.0),
            NSNumber(value: 1.0 + rangeRate),
            NSNumber(value: 1.0 + rangeRate * 2)
        ]
        animation.repeatCount = .infinity
        animation.duration = 1.5
        
        layer.mask?.add(animation, forKey: "gradient")
        
        isAnimating = true
    }
    
    public func endAnimation() {
        layer.mask?.removeAllAnimations()
        isAnimating = false
    }
}
