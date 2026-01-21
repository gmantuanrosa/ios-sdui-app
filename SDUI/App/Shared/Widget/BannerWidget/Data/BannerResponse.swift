//
//  BannerResponse.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

struct BannerResponse: Codable, Sendable {
    let title: String
    let message: String
    let variant: BannerVariant
}
