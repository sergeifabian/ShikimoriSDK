//
//  DynamicTarget.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation
import Moya

struct DynamicTarget: TargetType {

    let baseURL: URL

    let headers: [String: String]?

    let subTarget: SubTarget

    var path: String { subTarget.path }

    var method: Moya.Method { subTarget.method }

    var task: Task { subTarget.task }
}
