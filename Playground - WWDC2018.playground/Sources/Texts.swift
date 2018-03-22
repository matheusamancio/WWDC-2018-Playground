import Foundation

public class Texts{
    
    private var text: [String]
    
    public init(){
        self.text = []
        self.autoAppend()
    }
    
    private func autoAppend(){
        let text1 = "Hi, I'm Earth..."
        let text2 = "Are you my friend?"
        let text3 = "So if you're, I will tell something"
        let text4 = "I'm sad... You know why..."
        let text5 = "Don't you?"
        let text6 = "Do you know that i'm sofering about deforestation? "
        let text7 = "more than 13Mi hectares are cutted out every Year"
        let text8 = "... And this is only one thing that I'm sad"
        
        self.text += [text1, text2, text3, text4, text5, text6, text7, text8]
    }
    public func getTexts() -> [String]{
        return self.text
    }
}

