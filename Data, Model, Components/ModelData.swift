//
//  ModelData.swift
//  QuickCast
//
//  Created by 이재영 on 2023/12/26.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

// 받아온 json 데이터를 앱에 로드하고 파싱할 메서드
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
