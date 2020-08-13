//
//  AppFramework.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import DITranquillity

public class AppFramework: DIFramework {
    public static func load(container: DIContainer) {
        container.append(part: TopGamesDIPart.self)
    }
}
