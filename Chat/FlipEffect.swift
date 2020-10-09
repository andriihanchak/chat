//
//  FlipEffect.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import SwiftUI

struct FlipEffect: GeometryEffect {
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let t = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: size.height)
        return ProjectionTransform(t)
    }
}
