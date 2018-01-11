import Foundation
import UIKit

//extension to download images with async method and put images in imageViews

extension UIImageView {
  
  public func imageFromServerURL(urlString: String) {
    
    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
      
      if error != nil {
        return
      }
      DispatchQueue.main.async(execute: { () -> Void in
        let image = UIImage(data: data!)
        self.image = image
      })
      
    }).resume()
  }
  
}
