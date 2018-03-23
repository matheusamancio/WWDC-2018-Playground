import Foundation
import UIKit


public class Texts{
    
    private var text: String
    private var textColor: UIColor
    private var textSize: CGFloat
    private var textImpactSize: CGFloat
    private var rangeTextImpact: (Int,Int)
    private var ind: Int
    
    public init(i: Int){
        self.text = String()
        self.textColor = UIColor()
        self.textSize = CGFloat()
        self.textImpactSize = CGFloat()
        self.rangeTextImpact = (0,0)
        self.ind = 0
        self.autoAppend(i:i)
    }
    
    private func autoAppend(i: Int){
        // texts
        let text0 = "Hi, I'm Earth..."
        let text1 = "Are you my friend?"
        let text2 = "So if you're, I will tell something"
        let text3 = "I'm sad... You know why..."
        let text4 = "Don't you?"
        let text5 = "Do you know that i'm sofering about deforestation? "
        let text6 = "more than 13Mi hectares are cutted out every Year"
        let text7 = "... And this is only one thing that I'm sad"
        let arrayText = [text0, text1, text2, text3, text4, text5, text6, text7]
        
        //textColor
        let colorTextBlack = UIColor.black
        let colorTextWhite = UIColor.white
        let arrayColor = [colorTextBlack, colorTextBlack,colorTextBlack,colorTextBlack,colorTextBlack,colorTextWhite, colorTextWhite, colorTextWhite, colorTextWhite, colorTextWhite, colorTextWhite]
        
        //textSize
        let size1: CGFloat = 12
        let size2: CGFloat = 20
        let arraySize = [size1, size1, size1, size1, size2, size2,size2, size1, size1, size1, size1]
        
        //textImpactSize
        let noSize: CGFloat = 0
        let sizeImp1: CGFloat = 80
        let arraySizeImp = [noSize, noSize, noSize, noSize, noSize, noSize, sizeImp1, noSize, noSize, noSize, noSize]
        
        //textImpactSize
        let noRange = (0,0)
        let rangeImp1 = (10,4)
        let arrayRangeImp = [noRange, noRange, noRange, noRange, noRange, noRange, rangeImp1, noRange, noRange, noRange]
        
        self.text = arrayText[i]
        self.textColor = arrayColor[i]
        self.textSize = arraySize[i]
        self.textImpactSize = arraySizeImp[i]
        self.rangeTextImpact = arrayRangeImp[i]
    }
    public func getTexts() -> String{
        return self.text
    }
    public func getColor() -> UIColor{
        return self.textColor
    }
    public func getSize() -> CGFloat{
        return self.textSize
    }
    public func getSizeImp() -> CGFloat{
        return self.textImpactSize
    }
    public func getRangeImp() -> (Int, Int){
        return self.rangeTextImpact
    }
    public func nextSentence(){
        self.ind = self.ind + 1
        self.autoAppend(i:ind)
    }
}

