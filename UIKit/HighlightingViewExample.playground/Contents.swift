import UIKit
import PlaygroundSupport

let liveView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
liveView.backgroundColor = .white
PlaygroundPage.current.liveView = liveView

let highlightingView = HighlightingView()
highlightingView.translatesAutoresizingMaskIntoConstraints = false
highlightingView.startAnimation()

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

highlightingView.addSubview(stackView)
highlightingView.addConstraints([
    NSLayoutAttribute.top,
    NSLayoutAttribute.left,
    NSLayoutAttribute.bottom,
    NSLayoutAttribute.right
    ].map { NSLayoutConstraint(item: stackView, attribute: $0, relatedBy: .equal, toItem: highlightingView, attribute: $0, multiplier: 1, constant: 0) })

liveView.addSubview(highlightingView)
liveView.addConstraints([
    NSLayoutAttribute.centerX,
    NSLayoutAttribute.centerY
    ].map { NSLayoutConstraint(item: highlightingView, attribute: $0, relatedBy: .equal, toItem: liveView, attribute: $0, multiplier: 1, constant: 0) })
