import Foundation
import UIKit


public class SuplementQuiz{
    
    private var arrayQuestion: [String]
    private var arrayAnswer1: [String]
    private var arrayAnswer2: [String]
    private var arrayAnswer3: [String]
    private var arrayNumCorrect:[Int]
    private var arrayWrongMessage: [String]
    private var arrayCorrectMessage: [String]


    
    public init(){
        
        self.arrayQuestion = []
        self.arrayAnswer1 = []
        self.arrayAnswer2 = []
        self.arrayAnswer3 = []
        self.arrayNumCorrect = []
        self.arrayWrongMessage = []
        self.arrayCorrectMessage = []


        self.autoAppend()
    }
    
    private func autoAppend(){
        // Questions
        let q1 = "Who will receive a WWDC schollarship this year"
        let q2 = "Who will give his life to Jesus?"
        let q3 = "Who will enjoy the family in this weekend?"
        self.arrayQuestion = [q1,q2,q3]
        
        //Answer one
        let a11 = "  me"
        let a12 = "  me again"
        let a13 = "  me too"
        self.arrayAnswer1 = [a11,a12,a13]
        
        //Answer two
        let a21 = "  me too"
        let a22 = "  me"
        let a23 = "  me again"
        self.arrayAnswer2 = [a21,a22,a23]
        
        //Answer three
        let a31 = "  me again"
        let a32 = "  me too"
        let a33 = "  me"
        self.arrayAnswer3 = [a31,a32,a33]
        
        //num Correct
        let n1 = 1
        let n2 = 2
        let n3 = 3
        self.arrayNumCorrect = [n1,n2,n3]
        
        //wrong message
        let w1 = "nooooo"
        let w2 = "you bastard"
        let w3 = "are you kidding me?"
        self.arrayWrongMessage = [w1,w2,w3]
        
        //correct message
        let c1 = "iuuupi"
        let c2 = "great dude"
        let c3 = "My man"
        self.arrayCorrectMessage = [c1,c2,c3]

    }
    
    public func chooseQuestion(i:Int) -> String{
        return arrayQuestion[i]
    }
    
    public func chooseAnswer1(i:Int) -> String{
        return arrayAnswer1[i]
    }
    
    public func chooseAnswer2(i:Int) -> String{
        return arrayAnswer2[i]
    }
    
    public func chooseAnswer3(i:Int) -> String{
        return arrayAnswer3[i]
    }
    
    public func chooseNumCorrect(i:Int) -> Int{
        return arrayNumCorrect[i]
    }
    
    public func chooseWrongMessage(i:Int) -> String{
        return arrayWrongMessage[i]
    }
    
    public func chooseCorrectMessage(i:Int) -> String{
        return arrayCorrectMessage[i]
    }
}

