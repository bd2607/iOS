//
//  FormFactorConfigurator.swift
//  DuckDuckGo
//
//  Created by Chris Brind on 22/07/2020.
//  Copyright © 2020 DuckDuckGo. All rights reserved.
//

import Foundation
import Core

class FormFactorConfigurator {
    
    struct Constants {
        
        static let minPadWidth: CGFloat = 678
        
    }
    
    static let shared = FormFactorConfigurator()
    
    let variantManager: VariantManager
    
    var currentWidth: CGFloat = 0
    
    var isPadFormFactor: Bool {
        return variantManager.isSupported(feature: .iPadImprovements) && currentWidth >= Constants.minPadWidth
    }
        
    /// Only use constructor when testing
    init(variantManager: VariantManager = DefaultVariantManager()) {
        self.variantManager = variantManager
    }
    
    func willResize(toWidth width: CGFloat) -> Bool {
        print("***", #function, width)
        if width != currentWidth {
            currentWidth = width
            return true
        }
        
        return false
    }

}
