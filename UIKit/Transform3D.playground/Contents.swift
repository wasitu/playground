import UIKit
import PlaygroundSupport

let liveView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
liveView.backgroundColor = .white

let imageView = UIImageView(image: UIImage(named: "logo"))
imageView.contentMode = .scaleAspectFit

let rotatedImageView = UIImageView(image: UIImage(named: "logo"))
rotatedImageView.contentMode = .scaleAspectFit

var perspectiveTransform = CATransform3DIdentity
perspectiveTransform.m34 = -(1.0 / liveView.bounds.width)
rotatedImageView.layer.transform = CATransform3DRotate(perspectiveTransform, CGFloat(.pi / 4.0), 1.0, 1.0, 0)

let stackView = UIStackView()
stackView.translatesAutoresizingMaskIntoConstraints = false
stackView.axis = .vertical
stackView.distribution = .fillEqually
stackView.spacing = 16
stackView.addArrangedSubview(imageView)
stackView.addArrangedSubview(rotatedImageView)

liveView.addSubview(stackView)
liveView.addConstraints([
    NSLayoutAttribute.top,
    NSLayoutAttribute.bottom,
    NSLayoutAttribute.left,
    NSLayoutAttribute.right,
    ].map { NSLayoutConstraint(item: stackView, attribute: $0, relatedBy: .equal, toItem: liveView, attribute: $0, multiplier: 1, constant: 0) })

PlaygroundPage.current.liveView = liveView
PlaygroundPage.current.needsIndefiniteExecution = true
