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
    
    //MARK: Properties
    
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
    
    //MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews() //Получение данных
        configureConstraints() //констрейны
        imageLoad(urlString: (news?.imgUrl)!) // Параллельно загрузить изображение
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var lastHeight = 0
        let descSize = self.descriptionText.sizeThatFits(self.descriptionText.bounds.size)
        let imgSize = self.imageView.sizeThatFits(self.imageView.bounds.size)
        let titleSize = self.titleLabel.sizeThatFits(self.titleLabel.bounds.size)
        lastHeight = Int(descSize.height + titleSize.height + imgSize.height + 50)
        scrollView.contentSize = CGSize(width: self.screen.width , height: CGFloat(lastHeight))
    }
    
    func imageLoad(urlString: String){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed fetching image:", error ?? "error")
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
    }
    
    //MARK: Configure Views
    
    func configureViews() {
        view.addSubview(scrollView)
        [titleLabel, dateLabel, descriptionText, imageView].forEach{
            scrollView.addSubview($0)
        }
        titleLabel.text = self.news?.title
        dateLabel.text = News.rightDate(date: (self.news?.pubDate)!)
        descriptionText.text = self.news?.description
    }
    
    //MARK: Configure Constraints
    
    func configureConstraints() {
        constrain(scrollView,view){
            $0.edges == $1.edges
        }
        
        constrain(scrollView, imageView, titleLabel, dateLabel, descriptionText) {
            $1.top == $0.top
            $1.left == $0.left
            $1.width == $0.width
            
            $2.top == $1.bottom + 10
            $2.width == $0.width - 20
            $2.left == $0.left + 20
            
            $3.top == $2.bottom + 5
            $3.right == $2.right - 20
            
            $4.top == $3.bottom + 5
            $4.width == $0.width - 40
            $4.left == $0.left + 20
        }
    }
}
