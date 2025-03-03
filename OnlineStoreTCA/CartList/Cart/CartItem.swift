//
//  CartItem.swift
//  OnlineStoreTCA
//
//  Created by Pedro Rojas on 18/08/22.
//

import Foundation
import ComposableArchitecture

struct CartItem: Equatable, Identifiable {
    let id: UUID
    let product: Product
    let quantity: Int
}

extension CartItem {
    static var sample: [CartItem] {
        [
            .init(
                id: UUID(),
                product: Product.sample[0],
                quantity: 3
            ),
            .init(
                id: UUID(),
                product: Product.sample[1],
                quantity: 1
            ),
            .init(
                id: UUID(),
                product: Product.sample[2],
                quantity: 1
            ),
        ]
    }
}

extension CartItem: Encodable {
    private enum CartItemsKey: String, CodingKey {
        case productId
        case quantity
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CartItemsKey.self)
        try container.encode(product.id, forKey: .productId)
        try container.encode(quantity, forKey: .quantity)
    }
}
