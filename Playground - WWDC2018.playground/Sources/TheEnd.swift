import Foundation
import UIKit
public class TheEnd{
    
    private var view: UIView
    private var labelSubTitle: UILabel
    private var labelTitle: UILabel
    private var labelExplanation: UILabel
    private var labelCredits: UILabel
    private var suplementQuiz: SuplementQuiz
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
        self.suplementQuiz = SuplementQuiz()
        self.clicked = 0
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        self.labelSubTitle = UILabel()
        self.labelTitle = UILabel()
        self.labelExplanation = UILabel()
        self.labelCredits = UILabel()
        self.view.backgroundColor = .white
        
    }
    
    public func startTheEnd(sup: SuplementQuiz){
        self.suplementQuiz = sup
        buildTheEnd()
    }
    private func buildTheEnd(){
        let arrayActs = self.suplementQuiz.getSelectedAnswers()
        let act1 = arrayActs[0]
        let act2 = arrayActs[1]
        let act3 = arrayActs[2]
        print(#function,act1)
        print(#function,act2)
        print(#function,act3)

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
        self.labelTitle.text = "Small acts can save the Earth"
        self.labelTitle.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        self.labelTitle.tintColor = UIColor.black
        self.labelTitle.textAlignment = .center
        self.view.addSubview(self.labelTitle)
        
        //label Explanation
        self.labelExplanation.frame = CGRect(x: centerWidth - 200, y: centerHeight/2 - 20, width: 400, height: 300)
        self.labelExplanation.text = "Like your acts:"
        self.labelExplanation.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.labelExplanation.tintColor = UIColor.black
        self.labelCredits.numberOfLines = 4
        self.labelExplanation.textAlignment = .center
        self.view.addSubview(self.labelExplanation)
        
        //button
        self.labelCredits.frame = CGRect(x: centerWidth - 300, y: centerHeight/2 + 60, width: 600, height: 400)
        self.labelCredits.text = "\n\(act1) \n\(act2) \n\(act3)"
        self.labelCredits.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        self.labelCredits.tintColor = UIColor.black
        self.labelCredits.textAlignment = .center
        self.labelCredits.numberOfLines = 4
        self.view.addSubview(self.labelCredits)
        
        self.labelSubTitle.alpha = 0
        self.labelTitle.alpha = 0
        self.labelExplanation.alpha = 0
        self.labelCredits.alpha = 0
        
        UIView.animate(withDuration: 3) {
            
            self.labelSubTitle.alpha = 1
            self.labelTitle.alpha = 1
            self.labelExplanation.alpha = 1
            self.labelCredits.alpha = 1
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
                    self.labelCredits.text = "Credits Background music:\n Touch - Mattia Cupelli \n https://soundcloud.com/mattiacupelli/touch-download-and-royalty-free-piano-music"
                    self.labelCredits.alpha = 1
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
