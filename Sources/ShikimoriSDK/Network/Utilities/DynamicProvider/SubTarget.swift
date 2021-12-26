//
//  SubTarget.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation
import Moya

protocol SubTarget {

    var path: String { get }

    var method: Moya.Method { get }

    var task: Task { get }
}
