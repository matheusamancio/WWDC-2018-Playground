import Foundation
import UIKit


public class Texts{
    
    private var text: String
    private var textColor: UIColor
    private var textSize: CGFloat
//    private var textImpactSize: CGFloat
//    private var textInfoColor: UIColor
//    private var rangeTextImpact: (Int,Int)
//    private var rangetTextInfo: (Int,Int)
//
    
    public init(i: Int){
        self.text = String()
        self.textColor = UIColor()
        self.textSize = CGFloat()
//        self.textImpactSize = CGFloat()
//        self.textInfoColor = UIColor()
//        self.rangeTextImpact = (Int,Int)()
//        self.rangetTextInfo = (Int,Int)()
        self.autoAppend(i:i)
    }
    
    private func autoAppend(i: Int){
        let text1 = "Hi, I'm Earth..."
        let text2 = "Are you my friend?"
        let text3 = "So if you're, I will tell something"
        let text4 = "I'm sad... You know why..."
        let text5 = "Don't you?"
        let text6 = "Do you know that i'm sofering about deforestation? "
        let text7 = "more than 13Mi hectares are cutted out every Year"
        let text8 = "... And this is only one thing that I'm sad"
        let arrayText = [text1, text2, text3, text4, text5, text6, text7, text8]
        
        let colorTextBlack = UIColor.black
        let colorTextWhite = UIColor.white
        let arrayColor = [colorTextBlack, colorTextWhite,colorTextWhite,colorTextWhite,colorTextWhite,colorTextWhite]
        
        let size1: CGFloat = 30
        let size2: CGFloat = 12
        let arraySize = [size2, size2, size2, size2, size2, size1]
        
        
        self.text = arrayText[i]
        self.textColor = arrayColor[i]
        self.textSize = arraySize[i]
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
}
