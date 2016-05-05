//
//  JLActiveSearchBar.swift
//  JLActiveSearchBar
//
//  Created by 刘业臻 on 16/5/3.
//  Copyright © 2016年 luiyezheng. All rights reserved.
//

import UIKit

@IBDesignable
public class AnimatedSearchBar: UISearchBar, UIGestureRecognizerDelegate {
    
    private lazy var tapRecognizer: UITapGestureRecognizer! = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(AnimatedSearchBar.drawoutline))
        tapRecognizer.delegate = self
        return tapRecognizer
        
    }()
    
    private var searchIconImageView: UIImageView!
    
    public var searchField: UITextField!
    
    private var pathLayer: CAShapeLayer!
    
    private var searchImageOne: UIImage? = UIImage(named: "search")
    private var searchImageTwo: UIImage? = UIImage(named: "search1")
    
    @IBInspectable public var duration: CGFloat = 0.45
    @IBInspectable public var outlineColor: UIColor? = UIColor.blackColor()
    
    init() {
        super.init(frame: CGRectZero)
    }
    
    init(frame: CGRect, duration: CGFloat, outlineColor: UIColor) {
        super.init(frame: frame)
        
        self.duration = duration
        self.outlineColor = outlineColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override public func drawRect(rect: CGRect) {
        if let index = indexOfSearchFieldInSubviews() {
            searchBarStyle = .Minimal
            translucent = true
            backgroundColor = UIColor.clearColor()
            tintColor = UIColor.darkGrayColor()
            
    //MARK: -
    //MARK: setup searchFied
            searchField = (subviews[0] ).subviews[index] as! UITextField
            searchField.frame = CGRectMake(5.0, 5.0, frame.size.width, frame.size.height)
            searchField.backgroundColor = UIColor.clearColor()
            searchField.placeholder = "Search..."
            searchField.hidden = true
            
        }
        
    //MARK: -
    //MARK: setup searchIconImageView

        searchIconImageView = UIImageView(frame: CGRectMake(self.bounds.maxX - 40, self.bounds.minY , 18, 18))
        searchIconImageView.center.y = bounds.maxY / 2
        searchIconImageView.image = searchImageOne
        searchIconImageView.addGestureRecognizer(tapRecognizer)
        searchIconImageView.userInteractionEnabled = true
        searchIconImageView.contentMode = .ScaleToFill
        addSubview(searchIconImageView)
        
        super.drawRect(rect)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0] 
        
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i].isKindOfClass(UITextField) {
                index = i
                break
            }
        }
        return index
    }
    
    func drawoutline() {
        
    //MARK: -
    //MARK: draw outline
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(bounds.maxX, bounds.minY))
        path.addLineToPoint(CGPointMake(bounds.minX + 5, bounds.minY))
        path.addLineToPoint(CGPointMake(bounds.minX + 5, bounds.maxY))
        path.addLineToPoint(CGPointMake(bounds.maxX, bounds.maxY))
        path.closePath()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: path.bounds, cornerRadius: 20.0).CGPath
        shapeLayer.strokeColor = outlineColor!.CGColor
        shapeLayer.fillColor = nil
        shapeLayer.lineWidth = 1.0
        shapeLayer.lineJoin = kCALineJoinBevel
        self.pathLayer = shapeLayer
        layer.addSublayer(self.pathLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = NSTimeInterval(duration)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        self.pathLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
        
    //MARK: -
    //MARK: setup searchBar state and animate

        searchField.hidden = false
        becomeFirstResponder()
        self.searchIconImageView.hidden = true
        self.setImage(searchImageTwo, forSearchBarIcon: .Search, state: .Normal)
        
        let currentAdjustment = self.positionAdjustmentForSearchBarIcon(.Search)
        UIView.animateWithDuration(NSTimeInterval(duration), animations: {() -> Void in
            self.setPositionAdjustment(UIOffsetMake(-self.bounds.width, currentAdjustment.vertical), forSearchBarIcon: .Search)
            }, completion: {(finished: Bool) -> Void in
            self.setPositionAdjustment(currentAdjustment, forSearchBarIcon: .Search)
            
        })
        
        UIView.animateWithDuration(NSTimeInterval(duration)) {
            self.layoutIfNeeded()
        }
        
    }
    
    //reset the searchBar state
    public func reSet() {
        self.pathLayer.removeFromSuperlayer()
        self.setImage(nil, forSearchBarIcon: .Search, state: .Normal)
        self.searchIconImageView.hidden = false
        searchField.hidden = true
        resignFirstResponder()
    }
    //MARK: -
    //MARK: prepareForInterfaceBuilder

    override public func prepareForInterfaceBuilder() {
        let bundle = NSBundle(forClass: AnimatedSearchBar.self)
        self.searchImageOne = UIImage(named: "search", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
        self.searchImageTwo = UIImage(named: "search1", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(bounds.maxX, bounds.minY))
        path.addLineToPoint(CGPointMake(bounds.minX + 5, bounds.minY))
        path.addLineToPoint(CGPointMake(bounds.minX + 5, bounds.maxY))
        path.addLineToPoint(CGPointMake(bounds.maxX, bounds.maxY))
        path.closePath()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: path.bounds, cornerRadius: 20.0).CGPath
        shapeLayer.strokeColor = outlineColor!.CGColor
        shapeLayer.fillColor = nil
        shapeLayer.lineWidth = 1.0
        shapeLayer.lineJoin = kCALineJoinBevel
        self.pathLayer = shapeLayer
        layer.addSublayer(self.pathLayer)

        
    }
    
}
