//
//  LTJelloSwitch.swift
//  LTJelloSwitch
//
//  Created by Lex Tang on 4/13/15.
//  Copyright (c) 2015 Lex Tang. All rights reserved.
//

import UIKit

public protocol LTJelloSwitchDelegate
{
    func jelloSwitchDidChange(jelloSwitch: LTJelloSwitch)
}

let kPullingThreshold: CGFloat = 40

@IBDesignable public class LTJelloSwitch: UIControl, UIScrollViewDelegate
{

    @IBInspectable public var on: Bool = false {
        didSet {
            self.jelloView.jelloColor = on ? self.onColor : self.offColor
            self.onView.hidden = !on
            self.offView.hidden = on
            
            self.delegate?.jelloSwitchDidChange(self)
        }
    }
    
    @IBInspectable public var onColor: UIColor = UIColor.blueColor()
    @IBInspectable public var offColor: UIColor = UIColor.lightGrayColor()

    public var delegate: LTJelloSwitchDelegate?
    
    private var dragOffsetX: CGFloat = 0 {
        didSet {
            jelloView.dragOffsetX = dragOffsetX
            var jelloFrame = self.jelloView.frame
            if dragOffsetX > 0 {
                jelloFrame.origin.x = max(-76, -160 * sin(dragOffsetX / 100.0))
            } else {
                jelloFrame.origin.x = min(30, 60 * sin(dragOffsetX / 100.0))
            }
            jelloView.frame = jelloFrame
            
            if dragOffsetX > kPullingThreshold {
                showTriggerView(on)
            } else {
                self.triggerOffView.hidden = true
                self.triggerOnView.hidden = true
                self.triggerOffView.alpha = 0
                self.triggerOnView.alpha = 0
            }
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let s = UIScrollView(frame: self.bounds)
        s.contentSize = CGSizeMake(1, 0)
        s.backgroundColor = UIColor.clearColor()
        s.showsHorizontalScrollIndicator = false
        s.showsVerticalScrollIndicator = false
        s.bounces = true
        s.alwaysBounceHorizontal = true
        s.alwaysBounceVertical = false
        s.directionalLockEnabled = true
        self.addSubview(s)
        
        for view in self.subviews {
            if !view.isKindOfClass(UIScrollView.self) || view as! UIScrollView != s {
                view.removeFromSuperview()
                s.addSubview(view as! UIView)
            }
        }
        
        self.insertSubview(self.jelloView, belowSubview: s)
        
        return s
    }()
    
    private lazy var jelloView: LTJelloView = {
        let j = LTJelloView(frame: CGRectMake(0, 0, self.bounds.size.width + 300, self.bounds.size.height))
        return j
    }()
    
    // MARK: - Views
    
    public lazy var onView: LTOnView = {
        let v = LTOnView()
        v.frame = CGRectMake(276, 2, 40, 40)
        self.jelloView.addSubview(v)
        return v
    }()
    
    public lazy var offView: LTOffView = {
        let v = LTOffView()
        v.frame = CGRectMake(276, 2, 40, 40)
        self.jelloView.addSubview(v)
        return v
    }()
    
    public lazy var pullingView: LTPullingView = {
        let v = LTPullingView()
        v.frame = CGRectMake(276, 2, 40, 40)
        self.jelloView.addSubview(v)
        return v
    }()
    
    public lazy var triggerOnView: LTTriggerOnView = {
        let v = LTTriggerOnView()
        v.frame = CGRectMake(306, 0, 40, 40)
        self.jelloView.addSubview(v)
        return v
    }()
    
    public lazy var triggerOffView: LTTriggerOffView = {
        let v = LTTriggerOffView()
        v.frame = CGRectMake(306, 0, 40, 40)
        self.jelloView.addSubview(v)
        return v
    }()
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        object_setClass(self, LTJelloSwitch.self)
        setup()
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
    }
    
    // MARK: - KVO for contentOffset
    
    public override func willMoveToSuperview(newSuperview: UIView?) {
        if newSuperview != nil {
            scrollView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: nil)
            
            scrollView.delegate = self
        }
    }
    
    deinit {
        scrollView.delegate = nil
        scrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    public override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "contentOffset" {
            if let newValue: AnyObject = change[NSKeyValueChangeNewKey] {
                let newOffset = newValue.CGPointValue()
                dragOffsetX = newOffset.x
            }
        }
    }
    
    // MARK: - Trigger view
    
    public func showTriggerView(show: Bool) {
        if !show {
            triggerOffView.layer.removeAllAnimations()
            
            if triggerOnView.alpha == 1 {
                return
            }
            
            if CGAffineTransformIsIdentity(triggerOnView.transform) {
                triggerOnView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            }
            triggerOnView.hidden = false
            triggerOnView.alpha = 0
            
            if !pullingView.hidden {
                UIView.animateWithDuration(0.16, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    self.triggerOnView.alpha = 1
                    self.triggerOnView.transform = CGAffineTransformIdentity
                }, completion: nil)
            }
        } else {
            triggerOnView.layer.removeAllAnimations()
            
            if triggerOffView.alpha == 1 {
               return
            }
            
            if CGAffineTransformIsIdentity(triggerOffView.transform) {
                triggerOffView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            }
            triggerOffView.hidden = false
            triggerOffView.alpha = 0
            
            if !pullingView.hidden {
                UIView.animateWithDuration(0.16, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    self.triggerOffView.alpha = 1
                    self.triggerOffView.transform = CGAffineTransformIdentity
                }, completion: nil)
            }
        }
    }
    
    // MARK: - ScrollView delegate
    
    public func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        jelloView.dragging = false
        jelloView.startBouncing()
        
        if scrollView.contentOffset.x > kPullingThreshold {
            on = !on
            
            sendActionsForControlEvents(UIControlEvents.ValueChanged)
        }
        
        if on {
            onView.hidden = false
        } else {
            offView.hidden = false
        }
        
        pullingView.hidden = true
    }
    
    public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        pullingView.hidden = false
        onView.hidden = true
        offView.hidden = true
        jelloView.dragging = true
        
        sendActionsForControlEvents(UIControlEvents.TouchDragEnter)
    }
    
    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        sendActionsForControlEvents(UIControlEvents.TouchDragExit)
    }
}
