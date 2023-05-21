//
//  ViewController.swift
//  project27
//
//  Created by Артем Чжен on 21/05/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageVIew: UIImageView!
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        drawRectangle()
    }

    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 5 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
            
        default:
            break
        }
    }
    
    func drawRectangle() {
        
    }
}

