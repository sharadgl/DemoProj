//
//  ViewController.swift
//  TransformDemo
//
//  Created by Sharad Goyal on 20/06/17.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTree: UILabel!
    
    let attrRedColor: [String: UIColor]? = [NSForegroundColorAttributeName: UIColor.red]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        underlinedText(text: "tree")
        labelTree.attributedText = translateStringToHTMLForm(text: "tr_e_e")
    }

    
    private func underlinedText(text: String) {
        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: text, attributes: underlineAttribute)
        labelTree.attributedText = underlineAttributedString
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func translateStringToHTMLForm(text: String) -> NSAttributedString {
        // This method basically changes the word 'w_ord' into 'w<span class="redText">rd'
        
        let returnString: NSMutableAttributedString = NSMutableAttributedString.init(string: "")
        var shouldTransform = false
        
        for currentCharacter in text.characters {
            if currentCharacter == "_" {
                shouldTransform = true
                
            }else {
                if shouldTransform {
                    returnString.append(NSAttributedString.init(string: currentCharacter.description, attributes: attrRedColor))
                    shouldTransform = false
                    
                }else {
                    returnString.append(NSAttributedString.init(string: currentCharacter.description))
                }
            }
        }
        
        return returnString
    }

}

