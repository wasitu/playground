//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let customModalTransition = CustomModalTransition()
    
    convenience init(customTransition: Bool = false) {
        self.init()
        if customTransition {
            transitioningDelegate = customModalTransition
            modalPresentationStyle = .custom
        }
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor(hue: CGFloat(drand48()), saturation: 1, brightness: 1, alpha: 1)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: stackView.centerYAnchor)
            ])
        do {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("TRANSIT", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(transit), for: .touchUpInside)
            button.sizeToFit()
            stackView.addArrangedSubview(button)
        }

        do {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("TRANSIT CUSTOM", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(transitCustom), for: .touchUpInside)
            button.sizeToFit()
            stackView.addArrangedSubview(button)
        }
        
        do {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("DISMISS", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(untransit), for: .touchUpInside)
            button.sizeToFit()
            stackView.addArrangedSubview(button)
        }
        
        self.view = view
    }
    
    @objc private func transit() {
        present(MyViewController(), animated: true, completion: nil)
    }
    
    @objc private func transitCustom() {
        present(MyViewController(customTransition: true), animated: true, completion: nil)
    }
    
    @objc private func untransit() {
        dismiss(animated: true, completion: nil)
    }
}
// Present the view controller in the Live View window
let window = UIWindow(frame: CGRect(origin: CGPoint(), size: CGSize(width: 375, height: 812)))

let viewController = MyViewController()

window.rootViewController = viewController
window.makeKeyAndVisible()

PlaygroundPage.current.liveView = window
