import UIKit
import PlaygroundSupport

let liveView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
liveView.backgroundColor = .white
PlaygroundPage.current.liveView = liveView

let gradientEffectView = GradientEffectView()
gradientEffectView.translatesAutoresizingMaskIntoConstraints = false

// contents
let stackView = UIStackView()
stackView.translatesAutoresizingMaskIntoConstraints = false
stackView.axis = .horizontal
stackView.spacing = 16

let label = UILabel()
label.text = "HIGHLIGHTING"
label.font = UIFont.systemFont(ofSize: 20)
stackView.addArrangedSubview(label)

let rect = UIView()
rect.backgroundColor = UIColor.red
rect.addConstraints([NSLayoutAttribute.width, NSLayoutAttribute.height].map {
    NSLayoutConstraint(item: rect, attribute: $0, relatedBy: .equal, toItem: nil, attribute: $0, multiplier: 1, constant: 24)
})
stackView.addArrangedSubview(rect)

gradientEffectView.addSubview(stackView)
gradientEffectView.addConstraints([
    NSLayoutAttribute.top,
    NSLayoutAttribute.left,
    NSLayoutAttribute.bottom,
    NSLayoutAttribute.right
    ].map { NSLayoutConstraint(item: stackView, attribute: $0, relatedBy: .equal, toItem: gradientEffectView, attribute: $0, multiplier: 1, constant: 0) })

liveView.addSubview(gradientEffectView)
liveView.addConstraints([
    NSLayoutAttribute.centerX,
    NSLayoutAttribute.centerY
    ].map { NSLayoutConstraint(item: gradientEffectView, attribute: $0, relatedBy: .equal, toItem: liveView, attribute: $0, multiplier: 1, constant: 0) })
