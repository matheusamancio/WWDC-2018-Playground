import Foundation
import UIKit

public class LabelBuilder{
    
    private var story: Story
    private var label: UILabel

    public init(story: Story){
        self.story = story
        self.label = UILabel()
        buildLabel()
    }

    private func buildLabel() {
        self.label.textColor = self.story.getColor()
        self.label.font = UIFont.systemFont(ofSize: self.story.getSize())
        let amountText = NSMutableAttributedString.init(string: self.story.getTexts())
        amountText.setAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: self.story.getSizeImp())], range: NSMakeRange(self.story.getRangeImp().0, self.story.getRangeImp().1))
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

