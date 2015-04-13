//
//  LTPullingView.swift
//  LTJelloSwitch
//
//  Created by Lex Tang on 4/13/15.
//  Copyright (c) 2015 Lex Tang. All rights reserved.
//

import UIKit

public class LTPullingView: UIView
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
        //// Color Declarations
        let tintColor = UIColor.whiteColor()
        
        //// Bezier Drawing
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(6, 14))
        bezierPath.addCurveToPoint(CGPointMake(3, 21), controlPoint1: CGPointMake(6, 14), controlPoint2: CGPointMake(3, 17))
        bezierPath.addCurveToPoint(CGPointMake(6, 28), controlPoint1: CGPointMake(3, 25), controlPoint2: CGPointMake(6, 28))
        bezierPath.addCurveToPoint(CGPointMake(4, 21), controlPoint1: CGPointMake(6, 28), controlPoint2: CGPointMake(4, 26))
        bezierPath.addCurveToPoint(CGPointMake(6, 14), controlPoint1: CGPointMake(4, 16), controlPoint2: CGPointMake(6, 14))
        bezierPath.closePath()
        bezierPath.lineCapStyle = kCGLineCapRound;
        
        tintColor.setFill()
        bezierPath.fill()
        
        
        //// Bezier 2 Drawing
        var bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(12, 11))
        bezier2Path.addCurveToPoint(CGPointMake(16, 14), controlPoint1: CGPointMake(12, 11), controlPoint2: CGPointMake(14, 14))
        bezier2Path.addCurveToPoint(CGPointMake(22, 11), controlPoint1: CGPointMake(18, 14), controlPoint2: CGPointMake(22, 11))
        bezier2Path.addCurveToPoint(CGPointMake(16, 13), controlPoint1: CGPointMake(22, 11), controlPoint2: CGPointMake(18, 13))
        bezier2Path.addCurveToPoint(CGPointMake(12, 11), controlPoint1: CGPointMake(14, 13), controlPoint2: CGPointMake(12, 11))
        bezier2Path.closePath()
        bezier2Path.lineCapStyle = kCGLineCapRound;
        
        tintColor.setFill()
        bezier2Path.fill()
        
        
        //// Bezier 3 Drawing
        var bezier3Path = UIBezierPath()
        bezier3Path.moveToPoint(CGPointMake(23, 12))
        bezier3Path.addCurveToPoint(CGPointMake(27, 15), controlPoint1: CGPointMake(23, 12), controlPoint2: CGPointMake(25, 15))
        bezier3Path.addCurveToPoint(CGPointMake(33, 12), controlPoint1: CGPointMake(29, 15), controlPoint2: CGPointMake(33, 12))
        bezier3Path.addCurveToPoint(CGPointMake(27, 14), controlPoint1: CGPointMake(33, 12), controlPoint2: CGPointMake(29, 14))
        bezier3Path.addCurveToPoint(CGPointMake(23, 12), controlPoint1: CGPointMake(25, 14), controlPoint2: CGPointMake(23, 12))
        bezier3Path.closePath()
        bezier3Path.lineCapStyle = kCGLineCapRound;
        
        tintColor.setFill()
        bezier3Path.fill()
        
        
        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(14, 15, 2, 2))
        tintColor.setFill()
        ovalPath.fill()
        
        
        //// Oval 2 Drawing
        var oval2Path = UIBezierPath(ovalInRect: CGRectMake(25, 16, 2, 2))
        tintColor.setFill()
        oval2Path.fill()
        
        
        //// Bezier 4 Drawing
        var bezier4Path = UIBezierPath()
        bezier4Path.moveToPoint(CGPointMake(18.23, 24.42))
        bezier4Path.addCurveToPoint(CGPointMake(17.73, 24.88), controlPoint1: CGPointMake(18.05, 24.54), controlPoint2: CGPointMake(17.88, 24.7))
        bezier4Path.addCurveToPoint(CGPointMake(17.73, 29.12), controlPoint1: CGPointMake(16.76, 26.05), controlPoint2: CGPointMake(16.76, 27.95))
        bezier4Path.addCurveToPoint(CGPointMake(21.27, 29.12), controlPoint1: CGPointMake(18.71, 30.29), controlPoint2: CGPointMake(20.29, 30.29))
        bezier4Path.addCurveToPoint(CGPointMake(21.27, 24.88), controlPoint1: CGPointMake(22.24, 27.95), controlPoint2: CGPointMake(22.24, 26.05))
        bezier4Path.addCurveToPoint(CGPointMake(18.23, 24.42), controlPoint1: CGPointMake(20.44, 23.89), controlPoint2: CGPointMake(19.19, 23.74))
        bezier4Path.closePath()
        bezier4Path.moveToPoint(CGPointMake(21.97, 23.46))
        bezier4Path.addCurveToPoint(CGPointMake(21.97, 30.54), controlPoint1: CGPointMake(23.34, 25.42), controlPoint2: CGPointMake(23.34, 28.58))
        bezier4Path.addCurveToPoint(CGPointMake(17.03, 30.54), controlPoint1: CGPointMake(20.61, 32.49), controlPoint2: CGPointMake(18.39, 32.49))
        bezier4Path.addCurveToPoint(CGPointMake(17.03, 23.46), controlPoint1: CGPointMake(15.66, 28.58), controlPoint2: CGPointMake(15.66, 25.42))
        bezier4Path.addCurveToPoint(CGPointMake(17.14, 23.31), controlPoint1: CGPointMake(17.06, 23.41), controlPoint2: CGPointMake(17.1, 23.36))
        bezier4Path.addCurveToPoint(CGPointMake(21.97, 23.46), controlPoint1: CGPointMake(18.51, 21.51), controlPoint2: CGPointMake(20.64, 21.56))
        bezier4Path.closePath()
        tintColor.setFill()
        bezier4Path.fill()

    }

}
