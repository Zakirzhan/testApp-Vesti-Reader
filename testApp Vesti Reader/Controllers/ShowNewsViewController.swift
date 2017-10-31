//
//  ShowNewsViewController.swift
//  testApp Vesti Reader
//
//  Created by Zakirzhan Aisabaev on 31.10.17.
//  Copyright © 2017 Zakirzhan Aisabaev. All rights reserved.
//

import UIKit
import Cartography

class ShowNewsViewController: UIViewController {
    
    var news: News?
    let screen = UIScreen.main.bounds
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: self.screen.width , height: 2*screen.height)
        scrollView.backgroundColor = .white
        return scrollView
    }()

    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Macros.Fonts.bold, size: 24)
        label.numberOfLines = 3
        label.textColor = Macros.GlobalColors.fontColor
        return label
    }()
    
    public lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Macros.Fonts.regular, size: 16)
        label.textColor = Macros.GlobalColors.fontColor
        return label
    }()
    
    public lazy var descriptionText: UITextView = {
        let text = UITextView()
        text.font = UIFont(name: Macros.Fonts.regular, size: 20)
        text.textColor = .black
        text.isScrollEnabled = false
        return text
    }()
    
    public lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        titleLabel.text = news?.title
        dateLabel.text = News.rightDate(date: (news?.pubDate)!)
        descriptionText.text = news?.description
        
        
        guard let url = URL(string: (news!.imgUrl)) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed fetching image:", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
            }.resume()
        
        configureConstraints()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var lastHeight = 0
        let descSize = self.descriptionText.sizeThatFits(self.descriptionText.bounds.size)
        let imgSize = self.imageView.sizeThatFits(self.imageView.bounds.size)
        let titleSize = self.titleLabel.sizeThatFits(self.titleLabel.bounds.size)
        lastHeight = Int(descSize.height + titleSize.height + imgSize.height + 30)
        scrollView.contentSize = CGSize(width: self.screen.width , height: CGFloat(lastHeight))
    }
    
    func configure() {
        view.addSubview(scrollView)
        self.scrollView.addSubview(titleLabel)
         self.scrollView.addSubview(dateLabel)
        self.scrollView.addSubview(descriptionText)
        self.scrollView.addSubview(imageView)
     }
    func configureConstraints() {
        constrain(scrollView,view){s, v in
            s.edges == v.edges
        }

        
        constrain(scrollView, imageView, titleLabel, dateLabel, descriptionText) { v, img, title, date, description in
          img.top == v.top
          img.left == v.left
          img.width == v.width
          title.top == img.bottom + 10
          title.width == v.width - 20
          title.left == v.left + 20
            date.top == title.bottom + 5
            date.right == title.right - 20
            description.top == date.bottom + 5
            description.width == v.width - 40
            description.left == v.left + 20
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    
 
}
