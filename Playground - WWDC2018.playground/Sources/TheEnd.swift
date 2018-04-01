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
        var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
        }
        var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        self.clicked = 0
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        self.labelSubTitle = UILabel()
        self.labelTitle = UILabel()
        self.labelExplanation = UILabel()
        self.watchAgainButton = UIButton()
        self.view.backgroundColor = .white
        
    }
    
    public func startTheEnd(){
        buildTheEnd()
    }
    private func buildTheEnd(){
        // center
        let centerWidth = view.frame.width/2
        let centerHeight = view.frame.height/2
        
        //label subtitle
        self.labelSubTitle.frame = CGRect(x: centerWidth - 100, y: 10, width: 200, height: 70)
        self.labelSubTitle.text = ""
        self.labelTitle.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.labelSubTitle.tintColor = UIColor.black
        self.labelSubTitle.textAlignment = .center
        self.view.addSubview(self.labelSubTitle)
        
        //label Title
        self.labelTitle.frame = CGRect(x: centerWidth - 300, y: centerHeight/2 - 80, width: 600, height: 100)
        self.labelTitle.text = "Small acts can make big impacts"
        self.labelTitle.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        self.labelTitle.tintColor = UIColor.black
        self.labelTitle.textAlignment = .center
        self.view.addSubview(self.labelTitle)
        
        //label Explanation
        self.labelExplanation.frame = CGRect(x: centerWidth - 200, y: centerHeight/2 - 20, width: 400, height: 59)
        self.labelExplanation.text = ""
        self.labelExplanation.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.labelExplanation.tintColor = UIColor.black
        self.labelExplanation.textAlignment = .center
        self.view.addSubview(self.labelExplanation)
        
        //button
        self.watchAgainButton.frame = CGRect(x: centerWidth - 75, y: centerHeight/2 + 60, width: 150, height: 40)
        self.watchAgainButton.backgroundColor = UIColor.black
        self.watchAgainButton.setTitle("Watch again", for: .normal)
        self.watchAgainButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        self.watchAgainButton.contentHorizontalAlignment = .center
        self.watchAgainButton.layer.cornerRadius = 8
        self.watchAgainButton.addTarget(self, action: #selector(StartAnimation), for: .touchUpInside)
        self.view.addSubview(watchAgainButton)
        
        self.labelSubTitle.alpha = 0
        self.labelTitle.alpha = 0
        self.labelExplanation.alpha = 0
        self.watchAgainButton.alpha = 0
        
        UIView.animate(withDuration: 3) {
            
            self.labelSubTitle.alpha = 1
            self.labelTitle.alpha = 1
            self.labelExplanation.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.finalSentence()
        }
        
    }
    
        func finalSentence(){
            
            UIView.animate(withDuration: 1, animations: {
                self.labelExplanation.alpha = 0
                self.labelTitle.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.labelSubTitle.text = "Hi, I'm Earth"
                    self.labelExplanation.text = "Matheus Amancio"
                    self.labelTitle.text = "Thank you for your time"
                    self.watchAgainButton.alpha = 1
                    self.labelExplanation.alpha = 1
                    self.labelTitle.alpha = 1
                }, completion: nil)
            }


        }
    
    
    
    @objc func StartAnimation() {
        self.clicked = 1
    }
    
    public func getView() -> UIView{
        return self.view
    }
    
}
