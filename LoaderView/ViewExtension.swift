//
//  ViewExtension.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 11/22/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit



  


//34/76/132

extension UIView{
    
    func addConstraintWithFormat(formate: String, views: UIView...){
        
        var viewDiectionary = [String: UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewDiectionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDiectionary))
        
    }
    
    func shakeWarning(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "position.x")
            anim.values = [ 0.0, 20.0, -20.0, 10.0, 0.0];
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3;
            anim.isAdditive = true;
            self.layer.add(anim, forKey: "shake")
        }
        
    }
    
    func makeShadowView(){
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 2
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.layer.backgroundColor = UIColor.white.cgColor  //UIColor.init(red: 172/255, green: 24/255, blue: 19/255, alpha: 1).cgColor
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 0
    }
    
}


extension UIColor{
    
    class func fromRGBA(r: Float, g: Float, b: Float,a: Float) -> UIColor{
        return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(a))
    }
    
    class func AppColor() -> UIColor {
        return UIColor(red: 172/255, green: 24/255, blue: 19/255, alpha: 1)
    }
    
}
