//
//  LTTriggerOnView.swift
//  LTJelloSwitch
//
//  Created by Lex Tang on 4/13/15.
//  Copyright (c) 2015 Lex Tang. All rights reserved.
//

import UIKit

public class LTTriggerOnView: UIView
{
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.clearColor()
    }

    public override func drawRect(rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let tintColor = UIColor.redColor()
        let titleColor = UIColor.whiteColor()
        
        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(7, 2, 32, 32))
        tintColor.setFill()
        ovalPath.fill()
        
        
        //// Polygon Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 5.07, 16.51)
        CGContextRotateCTM(context, 8 * CGFloat(M_PI) / 180)
        
        var polygonPath = UIBezierPath()
        polygonPath.moveToPoint(CGPointMake(6.5, 0))
        polygonPath.addLineToPoint(CGPointMake(12.13, 10.5))
        polygonPath.addLineToPoint(CGPointMake(0.87, 10.5))
        polygonPath.closePath()
        tintColor.setFill()
        polygonPath.fill()
        
        CGContextRestoreGState(context)
        
        
        //// Text Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 11, 13.76)
        CGContextRotateCTM(context, -20.44 * CGFloat(M_PI) / 180)
        
        let textRect = CGRectMake(0, 0, 21, 12)
        var textTextContent = NSString(string: "On")
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Left
        
        let textFontAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(UIFont.systemFontSize()), NSForegroundColorAttributeName: titleColor, NSParagraphStyleAttributeName: textStyle]
        
        let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        textTextContent.drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)

    }

}
