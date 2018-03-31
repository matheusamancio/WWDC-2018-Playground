import Foundation
import UIKit


public class Story{
    
    private var text: String
    private var textColor: UIColor
    private var textSize: CGFloat
    private var textImpactSize: CGFloat
    private var rangeTextImpact: (Int,Int)
    private var indBackGroundColor: Int
    private var ind: Int
    
    private var arrayText: [String]
    private var arrayBack: [Int]
    private var arrayDelay:[TimeInterval]
    private var arrayTextColor: [UIColor]
//    private var arraySize: [CGFloat]
//    private var arraySizeImp: [CGFloat]
//    private var arrayRangeImp: [(Int, Int)]
    
    public init(i: Int){
        self.text = String()
        self.textColor = UIColor()
        self.textSize = CGFloat()
        self.textImpactSize = CGFloat()
        self.rangeTextImpact = (0,0)
        self.indBackGroundColor = 0
        self.ind = 0
        
        self.arrayText = []
        self.arrayBack = []
        self.arrayDelay = []
        self.arrayTextColor = []
//        self.arraySize = []
//        self.arraySizeImp = []
//        self.arrayRangeImp = []
        
        self.autoAppend(i: i)
    }
    
    private func autoAppend(i: Int){
        // texts
        let t0 = "Hi, I'm Earth..."
        let t1 = "I'm here to tell you something"
        let t2 = "…"
        let t3 = "I'm sad"
        let t4 = "because my clean water is running out"
        let t5 = "every minute X litres are wasted around the world"
        let t6 = "844 million people don’t have clean water"
        let t7 = " ... And this is only one thing that I'm sad"
        let t8 = "because I'm beeing sick too"
        let t9 = "The doctor said something called pollution?"
        let t10 = "have you heard of it?"
        let t11 = "the symptoms are affecting my land"
        let t12 = "and what about this carbone"
        let t13 = "This carbone is killing me"
        let t14 = "It's killing You"
        let t15 = "The weather is changing"
        let t16 = "My temperature is growing sky-high"
        let t17 = "..."
        let t18 = "I need Help"
        let t19 = ""
        let arrayText1 = [t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19]
        

        //textColor
        let cB = UIColor.black
        let cW = UIColor.white
        self.arrayTextColor = [cB,cB,cB,cB,cB,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW]
        
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
        
        //FlagBackGroundColor
        let b1 = 0
        let b2 = 1
        let b3 = 2
        self.arrayBack = [b1,b1,b1,b1,b1,b2,b2,b2,b2,b2,b3,b3,b3,b3,b3,b3,b3,b3,b3,b3]
        
        //Delay
        let d1: TimeInterval = 0
        let d2: TimeInterval = 3
        self.arrayDelay = [d1,d1,d1,d1,d1,d2,d1,d1,d1,d1,d2,d1,d1,d1,d1,d1,d1,d1,d1,d1]
        
        
        self.arrayText = arrayText1
        self.text = arrayText[i]
        self.textColor = arrayTextColor[i]
        self.textSize = arraySize[i]
        self.textImpactSize = arraySizeImp[i]
        self.rangeTextImpact = arrayRangeImp[i]
    }
    
    public func chooseText(i:Int) -> String{
        return arrayText[i]
    }
    
    
    public func chooseBack(i:Int) -> Int{
        return arrayBack[i]
    }

    public func chooseDelay(i:Int) -> TimeInterval{
        return arrayDelay[i]
    }
    
    public func chooseTextColor(i:Int) -> UIColor{
        return arrayTextColor[i]
    }
//    public func chooseStory(i: Int){
//        self.text = self.arrayText[i]
//        self.textColor = self.arrayColor[i]
//        self.textSize = self.arraySize[i]
//        self.textImpactSize = self.arraySizeImp[i]
//        self.rangeTextImpact = self.arrayRangeImp[i]
//    }
    
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

}

