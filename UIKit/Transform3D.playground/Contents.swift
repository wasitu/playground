import UIKit
import PlaygroundSupport

let liveView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
liveView.backgroundColor = .white

let imageView = UIImageView(image: UIImage(named: "logo"))
imageView.contentMode = .scaleAspectFit

let rotatedImageView = UIImageView(image: UIImage(named: "logo"))
rotatedImageView.contentMode = .scaleAspectFit

// build  an animation
let animation = CABasicAnimation(keyPath: "transform")
animation.fromValue = CATransform3DRotate(CATransform3DIdentity, -0.5 * .pi, 1.0, 1.0, 0)
animation.toValue = CATransform3DRotate(CATransform3DIdentity, 0.5 * .pi, 1.0, 1.0, 0)
animation.repeatCount = .infinity
animation.duration = 1.5
rotatedImageView.layer.add(animation, forKey: "transform")

let stackView = UIStackView()
stackView.translatesAutoresizingMaskIntoConstraints = false
stackView.axis = .vertical
stackView.distribution = .fillEqually
stackView.spacing = 16
stackView.addArrangedSubview(imageView)
stackView.addArrangedSubview(rotatedImageView)

liveView.addSubview(stackView)

NSLayoutConstraint.activate([
    stackView.topAnchor.constraint(equalTo: liveView.topAnchor),
    stackView.bottomAnchor.constraint(equalTo: liveView.bottomAnchor),
    stackView.leftAnchor.constraint(equalTo: liveView.leftAnchor),
    stackView.rightAnchor.constraint(equalTo: liveView.rightAnchor),
    ])

PlaygroundPage.current.liveView = liveView
