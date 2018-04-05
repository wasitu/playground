import UIKit

public class GradientEffectView: UIView {
    private let gradientLayer = CAGradientLayer()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(0).cgColor,
            UIColor.white.cgColor,
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        
        layer.mask = gradientLayer
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
