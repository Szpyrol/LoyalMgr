//
//  FlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

struct FlowConfigure {
    let window : UIWindow?
    let navigationController : UINavigationController?
    let parent : FlowCoordinator?
}

protocol FlowCoordinator {
    var configure:FlowConfigure! {get}
    init(configure : FlowConfigure)
    func start()
}
