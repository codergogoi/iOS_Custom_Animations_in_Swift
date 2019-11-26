//
//  ComponentLoading.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 11/22/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//
 
 
import UIKit

class ComponentLoading : UIView {
        
    //Change Animation End Opacity
    var easeOutEndOpacity: Float = 0.2
    
    //Change Animation Start Opacity
    var easeOutStartOpacity: Float = 1.0
    
    //Set Radius As per UI
    var edgeRadius: CGFloat = 5

    
    var view1: UIView = {
        let view = UIView()
        
        return view;
    }()
   
    var view2: UIView = {
       let view = UIView()
       return view;
    }()
    
    var view3: UIView = {
          let view = UIView()
          return view;
    }()
    
    var view4: UIView = {
          let view = UIView()
          return view;
    }()
    
    var view5: UIView = {
          let view = UIView()
          return view;
    }()
    
    var view6: UIView = {
         let view = UIView()
         return view;
    }()
    
    var timer : Timer!
     
 
     override init(frame: CGRect) {
        super.init(frame: frame)
         
        
        let views = [view1, view2,  view3, view4, view5, view6];
       
       for v in views{
            self.addSubview(v)
            v.layer.cornerRadius = self.edgeRadius
            v.layer.opacity = self.easeOutStartOpacity
        
            v.layer.backgroundColor = UIColor.AppColor().cgColor // Change Color of the Loader Bars
        
            self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: v)
       }
       
       self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-[v1(v0)]-10-[v2(v1)]-10-[v3(v2)]-10-[v4(v3)]-10-[v5(v4)]-10-|", views: view1, view2, view3, view4, view5, view6)
       
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(loadingAnimation), userInfo: nil, repeats: true)

    }
    
    
    
    func StopAnimation(){
        
        let views = [view1, view2,  view3, view4, view5, view6];

        for v in views{
            v.removeFromSuperview()
        }
        
        self.timer.invalidate()
        self.removeFromSuperview()
        
    }
    
    // Check released form memory or not?
//    deinit {
//        print("Deinit called!")
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ComponentLoading {
    
    @objc func loadingAnimation(){
        
        let delay = Float.random(min: 0, max: 0.6)

        
        UIView.animateKeyframes(withDuration: 0.1, delay:TimeInterval(delay), options: [ .autoreverse ], animations: {
            
            self.view1.transform = CGAffineTransform(scaleX: 1, y: 2.0)
            self.view1.layer.opacity = self.easeOutStartOpacity
            
        }) { (isDone) in
            self.view1.transform = CGAffineTransform(scaleX: 1, y: 1.0)
            self.view1.layer.opacity = self.easeOutEndOpacity

        }
        
        UIView.animateKeyframes(withDuration: 0.2, delay: TimeInterval(delay), options: [.autoreverse ], animations: {

            self.view2.transform = CGAffineTransform(scaleX: 1, y: 2.0)
            self.view2.layer.opacity = self.easeOutStartOpacity


        }) { (isDone) in
            self.view2.transform = CGAffineTransform(scaleX: 1, y: 1.0)
            self.view2.layer.opacity = self.easeOutEndOpacity


        }
        
        UIView.animateKeyframes(withDuration: 0.3, delay: TimeInterval(delay), options: [.autoreverse ], animations: {

            self.view3.transform = CGAffineTransform(scaleX: 1, y: 2.0)
            self.view3.layer.opacity = self.easeOutStartOpacity


        }) { (isDone) in
             self.view3.transform = CGAffineTransform(scaleX: 1, y: 1.0)
            self.view3.layer.opacity = self.easeOutEndOpacity

        }

        UIView.animateKeyframes(withDuration: 0.4, delay: TimeInterval(delay), options: [ .autoreverse ], animations: {

            self.view4.transform = CGAffineTransform(scaleX: 1, y: 2.0)
            self.view4.layer.opacity = self.easeOutStartOpacity


        }) { (isDone) in
             self.view4.transform = CGAffineTransform(scaleX: 1, y: 1.0)
            self.view4.layer.opacity = self.easeOutEndOpacity

        }

        UIView.animateKeyframes(withDuration: 0.5, delay: TimeInterval(delay), options: [ .autoreverse ], animations: {

            self.view5.transform = CGAffineTransform(scaleX: 1, y: 2.0)
            self.view5.layer.opacity = self.easeOutStartOpacity


        }) { (isDone) in
             self.view5.transform = CGAffineTransform(scaleX: 1, y: 1.0)
            self.view5.layer.opacity = self.easeOutEndOpacity

        }

        UIView.animateKeyframes(withDuration: 0.6, delay: TimeInterval(delay), options: [ .autoreverse ], animations: {

           self.view6.transform = CGAffineTransform(scaleX: 1, y: 2.0)
            self.view6.layer.opacity = self.easeOutStartOpacity


       }) { (isDone) in
            self.view6.transform = CGAffineTransform(scaleX: 1, y: 1.0)
            self.view6.layer.opacity = self.easeOutEndOpacity

       }

        
      
    }
    
}
// MARK: Float Extension

public extension Float {

    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    static var random: Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }

    /// Random float between 0 and n-1.
    ///
    /// - Parameter n:  Interval max
    /// - Returns:      Returns a random float point number between 0 and n max
    static func random(min: Float, max: Float) -> Float {
        return Float.random * (max - min) + min
    }
}


