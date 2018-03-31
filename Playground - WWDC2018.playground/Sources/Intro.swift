import Foundation
import UIKit
public class Intro{
    
    private var view: UIView
    private var labelSubTitle: UILabel
    private var labelTitle: UILabel
    private var labelExplanation: UILabel
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
        self.labelSubTitle = UILabel()
        self.labelTitle = UILabel()
        self.labelExplanation = UILabel()
        self.startButton = UIButton()

    }
    
    public func startIntro(){
        buildIntro()
    }
    private func buildIntro(){
        // center
        self.view.backgroundColor = UIColor.white
        let centerWidth = view.frame.width/2
        let centerHeight = view.frame.height/2
        
        //label subtitle
        self.labelSubTitle.frame = CGRect(x: 30, y: 10, width: 100, height: 50)
        self.labelSubTitle.text = "Hi, I’m earth"
        self.labelTitle.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.labelSubTitle.tintColor = UIColor.black
        self.view.addSubview(self.labelSubTitle)
        
        //label Title
        self.labelTitle.frame = CGRect(x: 30, y: 60, width: 400, height: 50)
        self.labelTitle.text = "Welcome to my Playground"
        self.labelTitle.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        self.labelTitle.tintColor = UIColor.black
        self.view.addSubview(self.labelTitle)

        //label Explanation
        self.labelExplanation.frame = CGRect(x: 30, y: 80, width: 400, height: 150)
        self.labelExplanation.numberOfLines = 3
        self.labelExplanation.text = "This is a short scene, that you will listen what \nthe earth has to speak. \nSo, prepare your heart to listen and help her."

        self.labelExplanation.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        self.labelExplanation.tintColor = UIColor.black
        self.view.addSubview(self.labelExplanation)
        
        //button
        self.startButton.frame = CGRect(x: 30, y: 220, width: 180, height: 40)
        self.startButton.backgroundColor = UIColor.black
        self.startButton.setTitle("  Watch now", for: .normal)
        self.startButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.startButton.contentHorizontalAlignment = .left
        self.startButton.layer.cornerRadius = 8
        self.startButton.addTarget(self, action: #selector(StartAnimation), for: .touchUpInside)
        let imageView1 = UIImageView()
        imageView1.image = #imageLiteral(resourceName: "iArrow.png")
        imageView1.frame = CGRect(x: 115, y: 12.5, width: 56, height: 15)
        self.startButton.layer.masksToBounds = true
        self.startButton.addSubview(imageView1)
        self.view.addSubview(startButton)
    }
    
    @objc func StartAnimation() {
        self.clicked = 1
    }
    
    public func getView() -> UIView{
        return self.view
    }

}
