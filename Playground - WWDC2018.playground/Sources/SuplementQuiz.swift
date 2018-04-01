import Foundation
import UIKit


public class SuplementQuiz{
    
    private var arrayQuestion: [String]
    private var arrayAnswer1: [String]
    private var arrayAnswer2: [String]
    private var arrayAnswer3: [String]


    
    public init(){
        
        self.arrayQuestion = []
        self.arrayAnswer1 = []
        self.arrayAnswer2 = []
        self.arrayAnswer3 = []


        self.autoAppend()
    }
    
    private func autoAppend(){
        // Questions
        let q1 = "Select one atitute to prevent carbon pollution"
        let q2 = "Select one act to prevent water waste"
        let q3 = "Select one attitude to prevent land pollution"
        self.arrayQuestion = [q1,q2,q3]
        
        //Answer one
        let a11 = "  Switch your car for public transportation, carpooling, biking, etc."
        let a12 = "  Reduce energy waste"
        let a13 = "  Encourage greenhouse-reducing acts in your community"
        
        //Answer two
        let a21 = "  Take shorter showers"
        let a22 = "  Turn water off when brushing your teeth"
        let a23 = "  Use a broom instead of a hose to clean driveways and sidewalks"
        
        //Answer three
        let a31 = "  Dispose of garbage correctly"
        let a32 = "  Recycle and reuse whenever possible"
        let a33 = "  Reduce the amount of plastic you use"
        self.arrayAnswer1 = [a11,a21,a31]
        self.arrayAnswer2 = [a12,a22,a32]
        self.arrayAnswer3 = [a13,a23,a33]

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
}

