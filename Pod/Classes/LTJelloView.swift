//
//  LTJelloView.swift
//  Pods
//
//  Created by Lex Tang on 4/13/15.
//
//

import UIKit

public class LTJelloView: UIView {
    
    private let kBouncingSteps = 58
    
    private var pullingOffsetX: CGFloat = 0
    private var bouncing = false
    private var bouncingTimer: NSTimer?
    private var bouncingValues: [CGFloat]?
    private var currentStep = 0
    private var beginOffsetX: CGFloat = 0
    
    public var dragging = false {
        didSet {
            self.bouncingTimer?.invalidate()
            self.bouncingTimer = nil
        }
    }
    
    public var dragOffsetX: CGFloat = 0 {
        didSet {
            if let _ = self.superview as UIView? {
                if self.dragging {
                    self.pullingOffsetX = -200 * sin(dragOffsetX / 320)
                }
                self.setNeedsDisplay()
            }
        }
    }
    
    public var jelloColor: UIColor = UIColor.redColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
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
        clipsToBounds = false
    }
    
    // MARK: - Drawing
    
    public override func drawRect(rect: CGRect) {
        let jelloOffsetX = pullingOffsetX + 2
        
        let faceOffsetPoint = CGPointMake(jelloOffsetX, 28)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 265, 0)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(200, 0.5))
        bezierPath.addLineToPoint(CGPointMake(12.5, 0.5))
        bezierPath.addCurveToPoint(CGPointMake(10.5, 12.5), controlPoint1: CGPointMake(12.5, 0.5), controlPoint2: CGPointMake(12.5, 6.5))
        bezierPath.addCurveToPoint(faceOffsetPoint, controlPoint1: CGPointMake(8.5, 18.5), controlPoint2: CGPointMake(faceOffsetPoint.x, faceOffsetPoint.y - 6))
        bezierPath.addCurveToPoint(CGPointMake(6.5, 39.5), controlPoint1: CGPointMake(faceOffsetPoint.x, faceOffsetPoint.y + 6), controlPoint2: CGPointMake(6.5, 39.5))
        bezierPath.addLineToPoint(CGPointMake(200, 39.5))
        bezierPath.addLineToPoint(CGPointMake(200, 0.5))
        bezierPath.closePath()
        jelloColor.setFill()
        bezierPath.fill()
        
        CGContextRestoreGState(context)
    }
    
    public func startBouncing() {
        if bouncing {
            return
        }
        
        beginOffsetX = pullingOffsetX
        
        if bouncingValues == nil {
            bouncingValues = [CGFloat]()
            var value: Double = 0
            var i = 0
            while i < kBouncingSteps {
                value = pow(2.71, -0.055 * Double(i)) * cos(0.48 * Double(i))
                bouncingValues!.append(CGFloat(value))
                i++
            }
        }
        
        NSThread.detachNewThreadSelector(Selector("lt_timerRunloop"), toTarget: self, withObject: nil)
    }
    
    public func lt_timerRunloop() {
        bouncingTimer = NSTimer.scheduledTimerWithTimeInterval(1.0 / 60.0, target: self, selector: Selector("lt_bouncingTick"), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(bouncingTimer!, forMode: NSDefaultRunLoopMode)
        NSRunLoop.currentRunLoop().run()
    }
    
    public func lt_bouncingTick() {
        currentStep++
        
        if currentStep < kBouncingSteps {
            if let steps = bouncingValues {
                pullingOffsetX = beginOffsetX * steps[currentStep]
            }
            self.setNeedsDisplay()
        } else {
            currentStep = 0
            bouncingTimer?.invalidate()
            bouncingTimer = nil
        }
    }

}
