//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Adithya Ramanathan on 3/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()               // creates a new instance
        imageView.contentMode = .scaleAspectFill    // ensures image fill image frame without stretching
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()               // creates a new instance
        button.backgroundColor = .darkGray
        button.setTitle("New Random Photo", for: .normal)       // for normal state show this title
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [.systemRed, .systemOrange, .systemGreen, .systemTeal, .systemIndigo, .systemBlue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue          // sets background color of app to blue
        view.addSubview(imageView)                  // adds imageView to the view
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)   // creates a rectange in imageview
        imageView.center = view.center              // centers imageView
        
        view.addSubview(button)     // adds button to view
        
        getRandomPhoto()        //calls the randomizer photo function
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)    // attatches button func to button itself
    }
    
    // objc to attatch this function to a button
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {     // so that it doesnt over lap home button at bottom
        super.viewDidLayoutSubviews()
        
        // sets the size of the rectuangular housing button
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 50)
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"    // url gives a new image each time
        let url = URL(string: urlString)!   // creates a url from the string (! says that we know string exists (will be valid))
        guard let data = try? Data(contentsOf: url) else {      // gets contents of url via data (try becuase it may not be possible)
            return
        }
        imageView.image = UIImage(data: data)     // create an image from the data
    }
    
    
}

