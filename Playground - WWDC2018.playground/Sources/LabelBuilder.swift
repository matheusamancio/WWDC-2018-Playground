import Foundation
import UIKit

public class LabelBuilder{
    
    private var text: Texts
    private var label: UILabel
    
    public init(text: Texts){
        self.text = text
        self.label = UILabel()
        buildLabel()
    }
    
    private func buildLabel() {
        self.label.textColor = self.text.getColor()
        self.label.font = UIFont.systemFont(ofSize: self.text.getSize())
        let amountText = NSMutableAttributedString.init(string: self.text.getTexts())
        amountText.setAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: self.text.getSizeImp())], range: NSMakeRange(self.text.getRangeImp().0, self.text.getRangeImp().1))
        //        label.font = UIFont.systemFont(ofSize: textSize)
        //        let amountText = NSMutableAttributedString.init(string: self.text)
        //        amountText.setAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: textImpactSize ?? textSize),
        //                                  NSAttributedStringKey.foregroundColor: self.textInfoColor ?? textColor],
        //                                 range: NSMakeRange(rangetTextInfo?.0 ?? 0, rangetTextInfo?.1 ?? 0))
        
        self.label.attributedText = amountText
    }
    
    public func getLabel() -> UILabel{
        return self.label
    }
}
