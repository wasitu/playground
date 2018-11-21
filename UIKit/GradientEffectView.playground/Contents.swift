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

stackView.addArrangedSubview(rect)
gradientEffectView.addSubview(stackView)
liveView.addSubview(gradientEffectView)

NSLayoutConstraint.activate([
    rect.widthAnchor.constraint(equalToConstant: 24),
    rect.heightAnchor.constraint(equalToConstant: 24),
    
    gradientEffectView.topAnchor.constraint(equalTo: stackView.topAnchor),
    gradientEffectView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
    gradientEffectView.leftAnchor.constraint(equalTo: stackView.leftAnchor),
    gradientEffectView.rightAnchor.constraint(equalTo: stackView.rightAnchor),
    
    liveView.centerXAnchor.constraint(equalTo: gradientEffectView.centerXAnchor),
    liveView.centerYAnchor.constraint(equalTo: gradientEffectView.centerYAnchor)
    ])
