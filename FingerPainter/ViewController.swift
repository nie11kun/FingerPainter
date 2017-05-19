//
//  ViewController.swift
//  FingerPainter
//
//  Created by Marco Nie on 18/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvas: UIImageView!
    
    @IBAction func clearCanvas(_ sender: UIBarButtonItem) {
        canvas.image = nil
    }

    var start: CGPoint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            start = touch.location(in: canvas)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let end = touch.location(in: canvas)
            if let start = self.start {
                drawFromPoint(start: start, toPoint: end)
            }
            self.start = end
        }
    }
    
    func drawFromPoint(start: CGPoint, toPoint end: CGPoint) {
        UIGraphicsBeginImageContext(canvas.frame.size)
        let context = UIGraphicsGetCurrentContext()
        canvas.image?.draw(in: CGRect(x: 0, y: 0,
                                      width: canvas.frame.size.width, height: canvas.frame.size.height))
        context?.setStrokeColor(UIColor.magenta.cgColor)
        context?.setLineWidth(5)
        context?.beginPath()
        context?.move(to: start)
        context?.addLine(to: end)
        context?.strokePath()
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        canvas.image = newImage
    }
    
}

