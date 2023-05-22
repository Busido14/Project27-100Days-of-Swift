//
//  DetailViewController.swift
//  New Project1
//
//  Created by Артем Чжен on 08/12/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        title = selectedImage - создает заголовок в виде nssl038
        title = "This image is \(selectedPictureNumber) out of \(totalPictures)"
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareLink))
        
        //        assert(selectedImage != nil)
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        let renderer = UIGraphicsImageRenderer(size: imageView.frame.size)
               
               let image = renderer.image { ctx in
                   
                   let stormImage = UIImage(named: selectedImage!)
                   stormImage?.draw(at: CGPoint(x: 0, y: 0))
                   
                   let paragraphStyle = NSMutableParagraphStyle()
                   paragraphStyle.alignment = .center

                   let attrs: [NSAttributedString.Key: Any] = [
                       .font : UIFont.systemFont(ofSize: 40),
                       .paragraphStyle: paragraphStyle
                   ]

                   let string = "From Storm Viewer"
                   let attributedString = NSAttributedString(string: string, attributes: attrs)

                   attributedString.draw(with: CGRect(x: 20, y: 260, width: imageView.frame.size.width, height: 40), options: .usesLineFragmentOrigin, context: nil)
               }
               
               imageView.image = image
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        
    }
    @objc func shareLink() {
        let link = "https://github.com/Busido14/project1"
    
        let vc = UIActivityViewController(activityItems: [link], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
//    func renderImage() -> UIImage {
//        if let imageToLoad = selectedImage {
//            if let size = imageView.image?.size {
//
//
//                let renderer = UIGraphicsImageRenderer(size: size)
//
//                let image = renderer.image { ctx in
//
//                    let photo = UIImage(named: imageToLoad)
//                    photo?.draw(at: CGPoint(x: 0, y: 0))
//
//                    let paragraphStyle = NSMutableParagraphStyle()
//                    paragraphStyle.alignment = .center
//
//                    let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 10), .paragraphStyle: paragraphStyle]
//
//                    let string = "From Storm Viewer"
//                    let attributedString = NSAttributedString(string: string, attributes: attrs)
//
//                    attributedString.draw(with: CGRect(x: size.width / 6, y: size.height / 2, width: size.width, height: size.height), options: .usesLineFragmentOrigin, context: nil)
//                }
//                return image
//            }
//        }
//
//        fatalError("Image could not render correctly")
//    }
}
