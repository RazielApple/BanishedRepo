//
//  colorStruct.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 18/01/23.
//

import Foundation

struct ColorStruct: Codable {
    let rgb: RGB

}
//MARK: - RGB
    struct RGB: Codable {
        let fraction: RGBFraction
        let r, g, b: Int
        let value: String
    }
// MARK: - RGBFraction
struct RGBFraction: Codable {
    let r: Int
    let g, b: Double
}
