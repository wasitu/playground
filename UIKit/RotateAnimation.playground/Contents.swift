//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = .white
let animator = UIViewPropertyAnimator(duration: 5, curve: .easeInOut) {
    for _ in 0..<20 {
        let rotation = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        view.transform = view.transform.concatenating(rotation)
    }
}
animator.startAnimation()

PlaygroundPage.current.liveView = view
