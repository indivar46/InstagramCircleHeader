//
//  GradientExtension.swift
//  InstaHeader
//
//  Created by Indivar on 30/05/21.
//  Copyright © 2021 Indivar. All rights reserved.
//

import UIKit
extension CAGradientLayer
{
    
    func setGradient(imgVw: UIImageView)
    {
        
            self.frame =  CGRect(origin: CGPoint.zero, size: imgVw.frame.size)
            
                       self.colors = [UIColor(red:202.0/255, green:11.0/255, blue: 109.0/255, alpha:0.71).cgColor,UIColor(red:246.0/255, green:139.0/255, blue:60.0/255, alpha:1.0).cgColor,UIColor.red.cgColor,UIColor(red:227.0/255, green:67.0/255, blue:63.0/255, alpha:1.0).cgColor,UIColor.red.cgColor,UIColor(red:245.0/255, green:137.0/255, blue:58.0/255, alpha:1.0).cgColor]

            imgVw.layer.cornerRadius = imgVw.frame.size.width / 2
            imgVw.clipsToBounds = true
            let shape = CAShapeLayer()
            shape.lineWidth = 5
        shape.path = UIBezierPath(arcCenter: CGPoint(x: 40, y: 40), radius: CGFloat(40), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            self.mask = shape

            imgVw.layer.addSublayer(self)


    }
}
