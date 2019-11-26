//
//  CurveViewController.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 11/26/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit



//place the following on Extensions 

extension UIColor{
    
    class func rgba(r: Float, g: Float, b: Float,a: Float) -> UIColor{
        return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(a))
    }
    
 
    
}



extension UIView {
    
    func makeCurve(curveAmount: CGFloat){
        
        self.backgroundColor = UIColor.clear
        let offset: CGFloat = self.frame.width / curveAmount
        let bounds: CGRect = self.bounds

        let viewRect: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: viewRect)

        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size = self.frame.size
        
        // Gradient Color
        let topColor =  UIColor.rgba(r: 32, g: 74, b: 129, a: 1).cgColor
        let bottomColor = UIColor.rgba(r: 44, g: 93, b: 156, a: 1).cgColor
        
        gradient.colors = [topColor,bottomColor]
        self.layer.addSublayer(gradient)
        self.layer.mask = maskLayer
    }
    
}



class CurveViewController : UIViewController{
    
    var v : UIView = {
          
           let v = UIView()
           return v;
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        
        v = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        self.view.addSubview(v)
        v.makeCurve(curveAmount: 4.0)
        
    }
    
    
    
}
