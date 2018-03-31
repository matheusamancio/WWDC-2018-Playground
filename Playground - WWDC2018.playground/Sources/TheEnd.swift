import Foundation
import UIKit
public class TheEnd{
    
    private var view: UIView
    private var labelSubTitle: UILabel
    private var labelTitle: UILabel
    private var labelExplanation: UILabel
    private var watchAgainButton: UIButton
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
        self.watchAgainButton = UIButton()
        
    }
    
    public func startTheEnd(){
        buildTheEnd()
    }
    private func buildTheEnd(){
        // center
        self.view.backgroundColor = UIColor.white
        
        //label subtitle
        self.labelSubTitle.frame = CGRect(x: 30, y: 10, width: 100, height: 50)
        self.labelSubTitle.text = "Hi, I’m earth"
        self.labelTitle.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.labelSubTitle.tintColor = UIColor.black
        self.view.addSubview(self.labelSubTitle)
        
        //label Title
        self.labelTitle.frame = CGRect(x: 30, y: 60, width: 400, height: 50)
        self.labelTitle.text = "Thank you for your time"
        self.labelTitle.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        self.labelTitle.tintColor = UIColor.black
        self.view.addSubview(self.labelTitle)
        
        //label Explanation
        self.labelExplanation.frame = CGRect(x: 30, y: 80, width: 400, height: 150)
        self.labelExplanation.text = "Matheus Amancio"
        self.labelExplanation.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        self.labelExplanation.tintColor = UIColor.black
        self.view.addSubview(self.labelExplanation)
        
        //button
        self.watchAgainButton.frame = CGRect(x: 30, y: 220, width: 70, height: 40)
        self.watchAgainButton.backgroundColor = UIColor.black
        self.watchAgainButton.setTitle("  Watch now", for: .normal)
        self.watchAgainButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.watchAgainButton.contentHorizontalAlignment = .left
        self.watchAgainButton.layer.cornerRadius = 8
        self.watchAgainButton.addTarget(self, action: #selector(StartAnimation), for: .touchUpInside)
        self.view.addSubview(watchAgainButton)
    }
    
    @objc func StartAnimation() {
        self.clicked = 1
    }
    
    public func getView() -> UIView{
        return self.view
    }
    
}
