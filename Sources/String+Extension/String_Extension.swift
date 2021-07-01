//
//  String_Extension.swift
//  Extensions
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//  Created by Tudor Ana on 07/01/21.
//  Copyright © 2021 Tudor Octavian Ana (TANA). All rights reserved.
//

import Foundation

// MARK: - String

extension String {

    var md5: String { HMAC.hash(inp: self, algo: HMACAlgo.MD5) }
    var sha1: String { HMAC.hash(inp: self, algo: HMACAlgo.SHA1) }
    var sha224: String { HMAC.hash(inp: self, algo: HMACAlgo.SHA224) }
    var sha256: String { HMAC.hash(inp: self, algo: HMACAlgo.SHA256) }
    var sha384: String { HMAC.hash(inp: self, algo: HMACAlgo.SHA384) }
    var sha512: String { HMAC.hash(inp: self, algo: HMACAlgo.SHA512) }
    
    var sanitized: String {
        let chars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_")
        return String(self.filter { chars.contains($0) })
    }
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment.isEmpty ? self : comment)
    }
    
    func dictionary() throws -> [String: Any] {
        guard let data = self.data(using: .utf8) else { return [:] }
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else{
            return [:]
        }
        return dictionary
    }
}
