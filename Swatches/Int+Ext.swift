//
//  String+Ext.swift
//  Swatches
//
//  Created by Brigitta Audrey on 26/07/22.
//

import Foundation

extension Int {
    
    func decToHexString() -> String {
//        let result = decToHexStringFormat()
        let result = createString(radix: 16)
        return result
    }
    
    fileprivate  func createString(radix: Int) -> String {
            return String(self, radix: radix, uppercase: true)
        }
    
    fileprivate func createString(minLength: Int = 0, system: String) -> String {
        //0 - fill empty space by 0
        //minLength - min count of chars
        //system - system number
        return String(format:"%0\(minLength)\(system)", self)
    }
    
}
