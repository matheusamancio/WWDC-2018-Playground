import Foundation
import UIKit
public class Intro{
    
    private var view: UIView
    private var label: UILabel
    private var startButton: UIButton
    public var goToScenes: (()->())?
    private var clicked: Int{
        didSet {
            if clicked == 1{
                goToScenes?()
            }
        }
    }
    
    public init(){
        self.clicked = 0
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 400))
        self.label = UILabel()
        self.startButton = UIButton()

    }
    
    public func startIntro(){
        buildIntro()
    }
    private func buildIntro(){
        // center
        let centerWidth = view.frame.width/2
        let centerHeight = view.frame.height/2
        
        //label
        self.label.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
        self.label.text = "teste"
        self.label.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.yellow
        self.view.addSubview(self.label)
        
        //button
        self.startButton.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        self.startButton.setTitle("Click", for: .normal)
        self.startButton.bounds = view.bounds
        self.startButton.addTarget(self, action: #selector(StartAnimation), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    @objc func StartAnimation() {
        self.clicked = 1
    }
    
    public func getView() -> UIView{
        return self.view
    }

}
