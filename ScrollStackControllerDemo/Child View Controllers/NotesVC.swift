//
//  NotesVC.swift
//  ScrollStackControllerDemo
//
//  Created by Daniele Margutti on 06/10/2019.
//  Copyright © 2019 ScrollStackController. All rights reserved.
//

import UIKit

public protocol NotesVCProtocol {
    
}

public class NotesVC: UIViewController, ScrollStackContainableController {
    
    @IBOutlet public var textView: UITextView!
    @IBOutlet public var textViewHeightConstraint: NSLayoutConstraint!

    public static func create(delegate: NotesVCProtocol) -> NotesVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "NotesVC") as! NotesVC
        return vc
    }
    
    public func scrollStackRowSizeForAxis(_ axis: NSLayoutConstraint.Axis, row: ScrollStackRow, in stackView: ScrollStack) -> ScrollStack.ControllerSize? {
        return .fitLayoutForAxis
    }
    
    
    override public func updateViewConstraints() {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        self.textViewHeightConstraint.constant = newSize.height
        
        view.height(constant: nil)
        super.updateViewConstraints()
     }
    
    public func reloadContentFromStackView(stackView: ScrollStack, row: ScrollStackRow, animated: Bool) {

    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.height(constant: nil)
        textView.isScrollEnabled = false
        textView.delegate = self
    }
    

}

extension NotesVC: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        updateViewConstraints()
    }
    
}
