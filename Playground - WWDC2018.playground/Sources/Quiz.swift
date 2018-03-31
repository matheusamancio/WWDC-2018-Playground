import Foundation
import UIKit
public class Quiz{
    
    private var view: UIView
    private var label: UILabel
    private var answerOne: UIButton
    private var answerTwo: UIButton
    private var answerThree: UIButton
    public var goToTheEnd: (()->())?
    private var clicked: Int{
        didSet {
            if clicked == 1{
                goToTheEnd?()
            }
        }
    }
    
    public init(){
        self.clicked = 0
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 400))
        self.label = UILabel()
        self.answerOne = UIButton()
        self.answerTwo = UIButton()
        self.answerThree = UIButton()
        
        
    }
    
    public func startQuiz(){
        buildQuiz()
    }
    private func buildQuiz(){
        // center
        let centerWidth = view.frame.width/2
        let centerHeight = view.frame.height/2
        
        //label
        self.label.frame = CGRect(x: 30, y: 30, width: 400, height: 150)
        self.label.text = "teste"
        self.label.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.yellow
        self.view.addSubview(self.label)
        
        //button one
        self.answerOne.frame = CGRect(x: 50, y: 100, width: 50, height: 50)
        self.answerOne.setTitle("One", for: .normal)
        self.answerOne.backgroundColor = UIColor.black
        self.answerOne.addTarget(self, action: #selector(buttonOnePressed), for: .touchUpInside)
        self.view.addSubview(answerOne)
        
        //button one
        self.answerTwo.frame = CGRect(x: 120, y: 100, width: 50, height: 50)
        self.answerTwo.setTitle("Two", for: .normal)
        self.answerTwo.backgroundColor = UIColor.black
        self.answerTwo.addTarget(self, action: #selector(buttonTwoPressed), for: .touchUpInside)
        self.view.addSubview(answerTwo)
        
        //button one
        self.answerThree.frame = CGRect(x: 190, y: 100, width: 50, height: 50)
        self.answerThree.setTitle("three", for: .normal)
        self.answerThree.backgroundColor = UIColor.black
        self.answerThree.addTarget(self, action: #selector(buttonThreePressed), for: .touchUpInside)
        self.view.addSubview(answerThree)
        
    }
    
    @objc func buttonOnePressed() {
        print(#function,"one pressed")
        self.clicked = 1
    }
    
    @objc func buttonTwoPressed() {
        print(#function,"two pressed")
        self.clicked = 1
    }
    
    @objc func buttonThreePressed() {
        print(#function,"three pressed")
        self.clicked = 1
    }
    
    public func getView() -> UIView{
        return self.view
    }
    
}

