import Foundation
import UIKit
public class Quiz{
    
    private var view: UIView
    private var labelSubTitle: UILabel
    private var labelQuestion: UILabel
    private var answerOne: UIButton
    private var answerTwo: UIButton
    private var answerThree: UIButton
    private var suplementQuiz: SuplementQuiz
    private var i: Int
    
    public var goFinalScene: (()->())?
    private var clicked: Int{
        didSet {
            if clicked == 1{
                goFinalScene?()
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
        self.i = Int()
        self.clicked = 0
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        self.labelQuestion = UILabel()
        self.labelSubTitle = UILabel()
        self.answerOne = UIButton()
        self.answerTwo = UIButton()
        self.answerThree = UIButton()
        
        
    }
    
    public func startQuiz(){
        buildQuiz()
    }
    private func buildQuiz(){
        i = 0
        self.view.alpha = 0
        self.labelSubTitle.alpha = 0
        self.labelQuestion.alpha = 0
        self.answerOne.alpha = 0
        self.answerTwo.alpha = 0
        self.answerThree.alpha = 0
        
        self.view.backgroundColor = UIColor.quizBackgroundColor()
        
        
        //label Subtitle
        self.labelSubTitle.frame = CGRect(x: 30, y: 10, width: 300, height: 50)
        self.labelSubTitle.text = "Do you want to help the earth?"
        self.labelSubTitle.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.labelSubTitle.textColor = UIColor.white
        self.view.addSubview(self.labelSubTitle)
        
        
        //label
        self.labelQuestion.frame = CGRect(x: 30, y: 60, width: 600, height: 50)
        let text0 = self.suplementQuiz.chooseQuestion(i:i)
        self.labelQuestion.text = text0
        self.labelQuestion.font = UIFont.systemFont(ofSize: 27, weight: UIFont.Weight.bold)
        self.labelQuestion.textColor = UIColor.white
        self.view.addSubview(self.labelQuestion)
        
        //answer one
        self.answerOne.frame = CGRect(x: 30, y: 120, width: 500, height: 50)
        let text1 = self.suplementQuiz.chooseAnswer1(i:i)
        self.answerOne.setTitle(text1, for: .normal)
        self.answerOne.backgroundColor = UIColor.white
        self.answerOne.setTitleColor(UIColor.quizButtonTextColor(), for: .normal)
        self.answerOne.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.answerOne.contentHorizontalAlignment = .left
        self.answerOne.layer.cornerRadius = 3
        self.answerOne.addTarget(self, action: #selector(buttonOnePressed), for: .touchUpInside)
        self.view.addSubview(answerOne)
        
        //button one
        self.answerTwo.frame = CGRect(x: 30, y: 180, width: 500, height: 50)
        let text2 = self.suplementQuiz.chooseAnswer2(i:i)
        self.answerTwo.setTitle(text2, for: .normal)
        self.answerTwo.setTitleColor(UIColor.quizButtonTextColor(), for: .normal)
        self.answerTwo.backgroundColor = UIColor.white
        self.answerTwo.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.answerTwo.contentHorizontalAlignment = .left
        self.answerTwo.layer.cornerRadius = 3
        self.answerTwo.addTarget(self, action: #selector(buttonTwoPressed), for: .touchUpInside)
        self.view.addSubview(answerTwo)
        
        //button one
        self.answerThree.frame = CGRect(x: 30, y: 240, width: 500, height: 50)
        let text3 = self.suplementQuiz.chooseAnswer3(i:i)
        self.answerThree.setTitle(text3, for: .normal)
        self.answerThree.backgroundColor = UIColor.white
        self.answerThree.setTitleColor(UIColor.quizButtonTextColor(), for: .normal)
        self.answerThree.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.answerThree.contentHorizontalAlignment = .left
        self.answerThree.layer.cornerRadius = 3
        self.answerThree.addTarget(self, action: #selector(buttonThreePressed), for: .touchUpInside)
        self.view.addSubview(answerThree)
        
        
        UIView.animate(withDuration: 1, animations: {
            self.view.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 1) {

            self.labelSubTitle.alpha = 1
            self.labelQuestion.alpha = 1
            self.answerOne.alpha = 1
            self.answerTwo.alpha = 1
            self.answerThree.alpha = 1
            }
        }
        
    }
    
    func nextQuestion(){
        i = i + 1
        let text0 = self.suplementQuiz.chooseQuestion(i:i)
        self.labelQuestion.text = text0
        let text1 = self.suplementQuiz.chooseAnswer1(i:i)
        self.answerOne.setTitle(text1, for: .normal)
        let text2 = self.suplementQuiz.chooseAnswer2(i:i)
        self.answerTwo.setTitle(text2, for: .normal)
        let text3 = self.suplementQuiz.chooseAnswer3(i:i)
        self.answerThree.setTitle(text3, for: .normal)
    }
    
    
    @objc func buttonOnePressed() {
        print(#function,"one pressed")
        self.suplementQuiz.setSelectedAnswers(i: i, answer: self.suplementQuiz.chooseAnswer1(i:i))
            if i < 2{
                nextQuestion()
            }else{
                UIView.animate(withDuration: 1, animations: {
                    self.view.alpha = 0
                }) { (true) in
                    self.clicked = 1
                }
                
            }
    }
    
    @objc func buttonTwoPressed() {
        print(#function,"two pressed")
        self.suplementQuiz.setSelectedAnswers(i: i, answer: self.suplementQuiz.chooseAnswer2(i:i))
            if i < 2{
                nextQuestion()
            }else{
                self.clicked = 1
            }
    }
    
    @objc func buttonThreePressed() {
        print(#function,"three pressed")
        self.suplementQuiz.setSelectedAnswers(i: i, answer: self.suplementQuiz.chooseAnswer3(i:i))
            if i < 2{
                nextQuestion()
            }else{
                self.clicked = 1
            }
    }
    
    public func getSuplement() -> SuplementQuiz{
        return self.suplementQuiz
    }
    
    public func getView() -> UIView{
        return self.view
    }
    
}

