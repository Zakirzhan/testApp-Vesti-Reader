
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
    
    private var layoutConfigured = false
     
    private var group = ConstraintGroup()
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
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        configureViews()
        configureConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
    }
    
    func configureConstraints() {
        
        constrain(self,titleLabel,dateLabel){s,title,date in
            
            title.top == s.top + 10
            title.left == s.left + 16
            title.width == s.width - 32
            
            date.left == s.left + 16
            
            date.top == title.bottom + 8
            date.bottom == s.bottom - 10
            
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func configure(with post: News) { 
         
        
        titleLabel.text = post.title
        dateLabel.text = News.rightDate(date: post.pubDate)
    }
    

}
