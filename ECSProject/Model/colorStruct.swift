// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ColorStruct: Codable {
    let mode, count: String
    let colors: [Seed]
    let seed: Seed
    let image: ImageStruct
    let links: WelcomeLinks
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case mode, count, colors, seed, image
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - Seed
struct Seed: Codable {
    let hex: Hex
    let rgb: RGB
    let hsl: Hsl
    let hsv: Hsv
    let name: Name
    let cmyk: Cmyk
    let xyz: Xyz
    let image: ImageStruct
    let contrast: Contrast
    let links: SeedLinks
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case hex, rgb, hsl, hsv, name, cmyk
        case xyz = "XYZ"
        case image, contrast
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - Cmyk
struct Cmyk: Codable {
    let fraction: CmykFraction
    let value: String
    let c, m, y, k: Int
}

// MARK: - CmykFraction
struct CmykFraction: Codable {
    let c, m, y, k: Double
}

// MARK: - Contrast
struct Contrast: Codable {
    let value: String
}

// MARK: - Embedded
struct Embedded: Codable {
}

// MARK: - Hex
struct Hex: Codable {
    let value, clean: String
}

// MARK: - Hsl
struct Hsl: Codable {
    let fraction: HslFraction
    let h, s, l: Int
    let value: String
}

// MARK: - HslFraction
struct HslFraction: Codable {
    let h, s, l: Double
}

// MARK: - Hsv
struct Hsv: Codable {
    let fraction: HsvFraction
    let value: String
    let h, s, v: Int
}

// MARK: - HsvFraction
struct HsvFraction: Codable {
    let h, s, v: Double
}

// MARK: - Image
struct ImageStruct: Codable {
    let bare, named: String
}

// MARK: - SeedLinks
struct SeedLinks: Codable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
}

// MARK: - Name
struct Name: Codable {
    let value, closestNamedHex: String
    let exactMatchName: Bool
    let distance: Int

    enum CodingKeys: String, CodingKey {
        case value
        case closestNamedHex = "closest_named_hex"
        case exactMatchName = "exact_match_name"
        case distance
    }
}

// MARK: - RGB
struct RGB: Codable {
    let fraction: RGBFraction
    let r, g, b: Int
    let value: String
}

// MARK: - RGBFraction
struct RGBFraction: Codable {
    let r, g, b: Double
}

// MARK: - Xyz
struct Xyz: Codable {
    let fraction: XYZFraction
    let value: String
    let x, y, z: Int

    enum CodingKeys: String, CodingKey {
        case fraction, value
        case x = "X"
        case y = "Y"
        case z = "Z"
    }
}

// MARK: - XYZFraction
struct XYZFraction: Codable {
    let x, y, z: Double

    enum CodingKeys: String, CodingKey {
        case x = "X"
        case y = "Y"
        case z = "Z"
    }
}

// MARK: - WelcomeLinks
struct WelcomeLinks: Codable {
    let linksSelf: String
    let schemes: Schemes

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case schemes
    }
}

// MARK: - Schemes
struct Schemes: Codable {
    let monochrome, monochromeDark, monochromeLight, analogic: String
    let complement, analogicComplement, triad, quad: String

    enum CodingKeys: String, CodingKey {
        case monochrome
        case monochromeDark = "monochrome-dark"
        case monochromeLight = "monochrome-light"
        case analogic, complement
        case analogicComplement = "analogic-complement"
        case triad, quad
    }
}
