import Foundation
import UIKit


public class Story{
    
    private var arrayText: [String]
    private var arrayBack: [Int]
    private var arrayDelay:[TimeInterval]
    private var arrayTextColor: [UIColor]
    private var arrayReferences: [String]

    
    public init(i: Int){        
        self.arrayText = []
        self.arrayBack = []
        self.arrayDelay = []
        self.arrayTextColor = []
        self.arrayReferences = []
        
        self.autoAppend(i: i)
    }
    
    private func autoAppend(i: Int){
        // texts
        let t0 = "Hi, I'm Earth..."
        let t1 = "I'm here to tell you something"
        let t2 = "…"
        let t3 = "I'm sad"
        let t4 = "Has been quite a while since i'm feeling sick"
        let t5 = "I used to have blue oceans and clean water for everyone"
        let t6 = "and now it's running out"
        let t7 = "Every minute a newborn dies from infection \ncaused by lack of safe water and an unclean environment."
        let t8 = "and 844 million people don’t have clean water"
        let t9 = " ... furthermore"
        let t10 = "my lungs are beeing affected as well"
        let t11 = "The doctor said something called carbon pollution"
        let t12 = "have you heard of it?"
        let t13 = "I'm losing 24 billion tons of topsoil each year because of land pollution"
        let t14 = "This carbon is killing me"
        let t15 = "It's killing You"
        let t16 = "and I'm getting fever"
        let t17 = "since the centure XIX my temperature grow 1,02%"
        let t18 = "does not seems like much?"
        let t19 = "but many species are being extinct"
        let t20 = "..."
        let t21 = "I need Help"
        let t22 = ""
        let t23 = ""

        
        self.arrayText = [t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23]
        

        //textColor
        let cB = UIColor.black
        let cW = UIColor.white
        self.arrayTextColor = [cB,cB,cB,cB,cB,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW,cW]
        
        
        //FlagBackGroundColor
        let b1 = 0
        let b2 = 1
        let b3 = 2
        self.arrayBack = [b1,b1,b1,b1,b1,b2,b2,b2,b2,b2,b3,b3,b3,b3,b3,b3,b3,b3,b3,b3,b3,b3,b3,b3]
        
        //Delay
        let d1: TimeInterval = 0
        let d2: TimeInterval = 3
        self.arrayDelay = [d2,d1,d1,d1,d1,d2,d1,d2,d1,d1,d2,d1,d1,d1,d1,d1,d1,d1,d1,d1,d1,d1,d1,d1]
        
        //References
        let r1 = ""
        let r2 = "(WHO, 2015)"
        let r3 = "(WHO/UNICEF (JMP) Report 2017)"
        let r4 = ""
        let r5 = ""
        self.arrayReferences = [r1,r1,r1,r1,r1,r1,r1,r2,r3,r1,r1,r1,r1,r4,r1,r1,r1,r5,r1,r1,r1,r1,r1,r1]
        
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
    
    public func chooseReferences(i:Int) -> String{
        return arrayReferences[i]
    }

}

