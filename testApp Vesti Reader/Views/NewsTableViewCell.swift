
//
//  NewsTableViewCell.swift
//  testApp Vesti Reader
//
//  Created by Zakirzhan Aisabaev on 31.10.17.
//  Copyright © 2017 Zakirzhan Aisabaev. All rights reserved.
//
import UIKit
import Cartography

class NewsTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Macros.Fonts.regular, size: 24)
        label.numberOfLines = 3
        label.textColor = Macros.GlobalColors.fontColor
        return label
    }()
    
    public lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Macros.Fonts.regular, size: 16)
        label.textColor = .black
        return label
    }()
    
    //MARK: View LifeCycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier) 
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure Views
    
    func configureViews() {
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
    }
    
    //MARK: Configure Constraints
    
    func configureConstraints() {
        constrain(self, titleLabel, dateLabel){
        
            $1.top == $0.top + 10
            $1.left == $0.left + 16
            
            $1.width == $0.width - 32
            $2.left == $0.left + 16
            
            $2.top == $1.bottom + 8
            $2.bottom == $0.bottom - 10
        }
    }
    
    func configure(with post: News) {
        titleLabel.text = post.title
        dateLabel.text = News.rightDate(date: post.pubDate)
    }
}
