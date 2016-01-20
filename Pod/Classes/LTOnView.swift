//
//  LTOnView.swift
//  LTJelloSwitch
//
//  Created by Lex Tang on 4/13/15.
//  Copyright (c) 2015 Lex Tang. All rights reserved.
//

import UIKit

public class LTOnView: UIView
{
    required public init?(coder aDecoder: NSCoder) {
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
        //// Color Declarations
        let tintColor = UIColor.whiteColor()
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(9, 12))
        bezierPath.addCurveToPoint(CGPointMake(13, 9), controlPoint1: CGPointMake(9, 12), controlPoint2: CGPointMake(11, 9))
        bezierPath.addCurveToPoint(CGPointMake(17, 12), controlPoint1: CGPointMake(15, 9), controlPoint2: CGPointMake(17, 12))
        bezierPath.addCurveToPoint(CGPointMake(13.5, 10.5), controlPoint1: CGPointMake(17, 12), controlPoint2: CGPointMake(15, 11))
        bezierPath.addCurveToPoint(CGPointMake(9, 12), controlPoint1: CGPointMake(12, 10), controlPoint2: CGPointMake(9, 12))
        bezierPath.closePath()
        tintColor.setFill()
        bezierPath.fill()
        
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(20, 13))
        bezier2Path.addCurveToPoint(CGPointMake(24, 10), controlPoint1: CGPointMake(20, 13), controlPoint2: CGPointMake(22, 10))
        bezier2Path.addCurveToPoint(CGPointMake(28, 13), controlPoint1: CGPointMake(26, 10), controlPoint2: CGPointMake(28, 13))
        bezier2Path.addCurveToPoint(CGPointMake(24.5, 11.5), controlPoint1: CGPointMake(28, 13), controlPoint2: CGPointMake(26, 12))
        bezier2Path.addCurveToPoint(CGPointMake(20, 13), controlPoint1: CGPointMake(23, 11), controlPoint2: CGPointMake(20, 13))
        bezier2Path.closePath()
        tintColor.setFill()
        bezier2Path.fill()
        
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(10, 12, 5, 5))
        tintColor.setFill()
        ovalPath.fill()
        
        
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalInRect: CGRectMake(21, 13, 5, 5))
        tintColor.setFill()
        oval2Path.fill()
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.moveToPoint(CGPointMake(18.5, 20.5))
        bezier3Path.addCurveToPoint(CGPointMake(14.5, 21.5), controlPoint1: CGPointMake(18.5, 20.5), controlPoint2: CGPointMake(14.5, 19.5))
        bezier3Path.addCurveToPoint(CGPointMake(18.5, 23.5), controlPoint1: CGPointMake(14.5, 23.5), controlPoint2: CGPointMake(18.5, 23.5))
        bezier3Path.addCurveToPoint(CGPointMake(14.5, 26.5), controlPoint1: CGPointMake(18.5, 23.5), controlPoint2: CGPointMake(13.5, 24.5))
        bezier3Path.addCurveToPoint(CGPointMake(18.5, 26.5), controlPoint1: CGPointMake(15.5, 28.5), controlPoint2: CGPointMake(18.5, 26.5))
        bezier3Path.lineCapStyle = CGLineCap.Round;
        
        tintColor.setStroke()
        bezier3Path.lineWidth = 1
        bezier3Path.stroke()

    }

}
