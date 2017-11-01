//
//  News.swift
//  testApp Vesti Reader
//
//  Created by Zakirzhan Aisabaev on 31.10.17.
//  Copyright © 2017 Zakirzhan Aisabaev. All rights reserved.
//

import Alamofire
import SWXMLHash

struct News {
    let title: String
    let pubDate: String
    let imgUrl: String
    let sourceUrl: String
    let description: String
    
    // MARK: Конвертация стрингов на читабельную дату
    
    static func rightDate(date: String) -> String {
        let dateString = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy, HH:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "ru_RU") as Locale!
        let newdate = dateFormatter.string(from: date!)
        return newdate
    }
    
    // MARK: Функция парсинга rss
    
    static func parse(callback: @escaping ([News]?, Error?) -> Void ){
        let url =  "https://www.vesti.ru/vesti.rss"
        Alamofire.request(url, method:.get, parameters:nil).response { response in
            guard let data = response.data else { return }
            do {
                let xml = SWXMLHash.parse(data)
                let feed: [News] = try xml["rss"]["channel"]["item"].value()
                callback(feed, nil)
            } catch let error {
                callback(nil, error)
            }
        }
    }
}

extension News: XMLIndexerDeserializable {
    static func deserialize(_ node: XMLIndexer) throws -> News {
        var imgURL = "https://topspb.tv/768x432/uploaded/programs_covers/news1_7hk2cPI.jpg"
        if((node["enclosure"][0].element?.attribute(by: "url")?.text) != nil) {
            imgURL = (node["enclosure"][0].element?.attribute(by: "url")?.text)! //"Enclosure" по умолчанию 0 - фото, 1 - видео.
        }
         return try News(
            title: node["title"].value(),
            pubDate: node["pubDate"].value(),
            imgUrl: imgURL,
            sourceUrl: node["link"].value(),
            description: node["yandex:full-text"].value() )
    }
}
