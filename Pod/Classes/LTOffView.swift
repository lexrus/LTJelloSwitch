//
//  LTOffView.swift
//  LTJelloSwitch
//
//  Created by Lex Tang on 4/13/15.
//  Copyright (c) 2015 Lex Tang. All rights reserved.
//

import UIKit

public class LTOffView: UIView
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
        let tintColor = UIColor.whiteColor()
        
        //// Oval Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 10, 15)
        CGContextRotateCTM(context, -5.59 * CGFloat(M_PI) / 180)
        
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 9, 3))
        tintColor.setFill()
        ovalPath.fill()
        
        CGContextRestoreGState(context)
        
        
        //// Oval 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 21, 15)
        CGContextRotateCTM(context, 15.13 * CGFloat(M_PI) / 180)
        
        var oval2Path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 9, 3))
        tintColor.setFill()
        oval2Path.fill()
        
        CGContextRestoreGState(context)
        
        
        //// Bezier Drawing
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(15, 25))
        bezierPath.addCurveToPoint(CGPointMake(18.5, 23.5), controlPoint1: CGPointMake(15, 25), controlPoint2: CGPointMake(14.5, 23.5))
        bezierPath.addCurveToPoint(CGPointMake(25, 28), controlPoint1: CGPointMake(22.5, 23.5), controlPoint2: CGPointMake(25, 28))
        bezierPath.addCurveToPoint(CGPointMake(17.5, 25.5), controlPoint1: CGPointMake(25, 28), controlPoint2: CGPointMake(20.5, 25.5))
        bezierPath.addCurveToPoint(CGPointMake(15, 25), controlPoint1: CGPointMake(14.5, 25.5), controlPoint2: CGPointMake(15, 25))
        bezierPath.closePath()
        tintColor.setFill()
        bezierPath.fill()
        
        
        //// Oval 3 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 10, 12)
        CGContextRotateCTM(context, 7.23 * CGFloat(M_PI) / 180)
        
        var oval3Path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 9, 1))
        tintColor.setFill()
        oval3Path.fill()
        
        CGContextRestoreGState(context)
        
        
        //// Oval 4 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 21, 14)
        CGContextRotateCTM(context, -8.04 * CGFloat(M_PI) / 180)
        
        var oval4Path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 9, 1))
        tintColor.setFill()
        oval4Path.fill()
        
        CGContextRestoreGState(context)

    }

}
