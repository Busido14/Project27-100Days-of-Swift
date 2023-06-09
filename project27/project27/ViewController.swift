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
        
        if currentDrawType > 7 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
        case 1:
            drawCircle()
        case 2:
            drawCheckerboard()
        case 3:
            drawRotatedSquares()
        case 4:
            drawLines()
        case 5:
            drawImagesAndText()
        case 6:
            drawEmodji()
        case 7:
            drawTwin()
            
        default:
            break
        }
    }
    
    func drawRectangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageVIew.image = image
        
    }
    
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageVIew.image = image
        
    }
    
    func drawCheckerboard() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

        let image = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.black.cgColor)

            for row in 0 ..< 8 {
                for col in 0 ..< 8 {
                    if (row + col) % 2 == 0 {
                        ctx.cgContext.fill(CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                }
            }
        }
        imageVIew.image = image
    }
    
    func drawRotatedSquares() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

        let img = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)

            let rotations = 16
            let amount = Double.pi / Double(rotations)

            for _ in 0 ..< rotations {
                ctx.cgContext.rotate(by: CGFloat(amount))
                ctx.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
            }

            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }

        imageVIew.image = img
    }
    
    func drawLines() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

        let img = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)

            var first = true
            var length: CGFloat = 256

            for _ in 0 ..< 256 {
                ctx.cgContext.rotate(by: .pi / 2)

                if first {
                    ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                } else {
                    ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }

                length *= 0.99
            }

            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }

        imageVIew.image = img
    }
    
    func drawImagesAndText() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

        let img = renderer.image { ctx in

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle
            ]

            let string = "The best-laid schemes o'\nmice an' men gang aft agley"
            let attributedString = NSAttributedString(string: string, attributes: attrs)

            attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)

            let mouse = UIImage(named: "mouse")
            mouse?.draw(at: CGPoint(x: 300, y: 150))
        }

        imageVIew.image = img
    }
    
    func drawEmodji() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
                
                let img = renderer.image { ctx in
            
                    let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
                    let smile = CGRect(x: 130, y: 350, width: 242, height: 10)
                    let leftEye = CGRect(x: 165, y: 150, width: 50, height: 80)
                    let rightEye = CGRect(x: 277, y: 150, width: 50, height: 80)
                    
                    ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
                    ctx.cgContext.addEllipse(in: rectangle)
                    ctx.cgContext.drawPath(using: .fill)
                    
                    ctx.cgContext.setFillColor(UIColor.black.cgColor)
                    ctx.cgContext.addRect(smile)
                    ctx.cgContext.drawPath(using: .fill)
                    
                    ctx.cgContext.setFillColor(UIColor.black.cgColor)
                    ctx.cgContext.addEllipse(in: leftEye)
                    ctx.cgContext.drawPath(using: .fill)

                    ctx.cgContext.setFillColor(UIColor.black.cgColor)
                    ctx.cgContext.addEllipse(in: rightEye)
                    ctx.cgContext.drawPath(using: .fill)
        }
        
        imageVIew.image = img
    }
    
    func drawTwin() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            
            ctx.cgContext.setStrokeColor(UIColor.white.cgColor)
            ctx.cgContext.setLineWidth(3)
            
            let upperY = CGFloat(200)
            let lowerY = CGFloat(350)
            let startX = CGFloat(50)
            
            ctx.cgContext.move(to: CGPoint(x: startX, y: upperY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 130, y: upperY))
            ctx.cgContext.move(to: CGPoint(x: startX + 65, y: upperY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 65, y: lowerY))
            
            ctx.cgContext.move(to: CGPoint(x: startX + 140, y: upperY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 165, y: lowerY))
            ctx.cgContext.move(to: CGPoint(x: startX + 165, y: lowerY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 180, y: lowerY - 75))
            ctx.cgContext.move(to: CGPoint(x: startX + 180, y: lowerY - 75))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 205, y: lowerY))
            ctx.cgContext.move(to: CGPoint(x: startX + 205, y: lowerY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 225, y: upperY))
            
            ctx.cgContext.move(to: CGPoint(x: startX + 235, y: upperY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 235, y: lowerY))
            
            ctx.cgContext.move(to: CGPoint(x: startX + 245, y: lowerY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 270, y: upperY))
            ctx.cgContext.move(to: CGPoint(x: startX + 270, y: upperY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 300, y: lowerY))
            ctx.cgContext.move(to: CGPoint(x: startX + 300, y: lowerY))
            ctx.cgContext.addLine(to: CGPoint(x: startX + 325, y: upperY))
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageVIew.image = img
    }
}

