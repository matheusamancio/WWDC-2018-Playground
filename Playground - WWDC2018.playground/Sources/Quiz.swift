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
    
    public var goToTheEnd: (()->())?
    private var clicked: Int{
        didSet {
            if clicked == 1{
                goToTheEnd?()
            }
        }
    }
    
    public init(){
        self.suplementQuiz = SuplementQuiz()
        self.i = Int()
        self.clicked = 0
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 400))
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
        self.view.backgroundColor = UIColor.quizBackgroundColor()

        
        //label Subtitle
        self.labelSubTitle.frame = CGRect(x: 30, y: 10, width: 200, height: 50)
        self.labelSubTitle.text = "Let's save the earth"
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
        self.answerOne.frame = CGRect(x: 50, y: 150, width: 80, height: 50)
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
        self.answerTwo.frame = CGRect(x: 150, y: 150, width: 80, height: 50)
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
        self.answerThree.frame = CGRect(x: 250, y: 150, width: 80, height: 50)
        let text3 = self.suplementQuiz.chooseAnswer3(i:i)
        self.answerThree.setTitle(text3, for: .normal)
        self.answerThree.backgroundColor = UIColor.white
        self.answerThree.setTitleColor(UIColor.quizButtonTextColor(), for: .normal)
        self.answerThree.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.answerThree.contentHorizontalAlignment = .left
        self.answerThree.layer.cornerRadius = 3
        self.answerThree.addTarget(self, action: #selector(buttonThreePressed), for: .touchUpInside)
        self.view.addSubview(answerThree)
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
        if suplementQuiz.chooseNumCorrect(i:i) == 1 {
            if i < 2{
                nextQuestion()
            }else{
                self.clicked = 1
            }
        }
    }
    
    @objc func buttonTwoPressed() {
        print(#function,"two pressed")
        if suplementQuiz.chooseNumCorrect(i:i) == 2 {
            if i < 2{
                nextQuestion()
            }else{
                self.clicked = 1
            }
        }
    }
    
    @objc func buttonThreePressed() {
        print(#function,"three pressed")
        if suplementQuiz.chooseNumCorrect(i:i) == 3 {
            if i < 2{
                nextQuestion()
            }else{
                self.clicked = 1
            }
        }
    }
    
    public func getView() -> UIView{
        return self.view
    }
    
}

