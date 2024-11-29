//
//  Bundle+Extension.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 27.11.2024.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't find file: \(file) in the project")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load file \(file) in the project")
        }

        let decoder = JSONDecoder()

        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Couldn't decode file \(file) in the project")
        }

        return loadedData
    }
}
