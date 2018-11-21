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
highlightingView.addSubview(stackView)

let label = UILabel()
label.text = "HIGHLIGHTING"
label.font = UIFont.systemFont(ofSize: 20)
stackView.addArrangedSubview(label)

let rect = UIView()
rect.backgroundColor = UIColor.red
stackView.addArrangedSubview(rect)

liveView.addSubview(highlightingView)

NSLayoutConstraint.activate([
    rect.widthAnchor.constraint(equalToConstant: 24),
    rect.heightAnchor.constraint(equalToConstant: 24),
    
    highlightingView.topAnchor.constraint(equalTo: stackView.topAnchor),
    highlightingView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
    highlightingView.leftAnchor.constraint(equalTo: stackView.leftAnchor),
    highlightingView.rightAnchor.constraint(equalTo: stackView.rightAnchor),

    liveView.centerXAnchor.constraint(equalTo: highlightingView.centerXAnchor),
    liveView.centerYAnchor.constraint(equalTo: highlightingView.centerYAnchor)
    ])
