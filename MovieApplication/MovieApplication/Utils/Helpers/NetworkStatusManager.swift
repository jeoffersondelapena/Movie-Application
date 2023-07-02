//
//  NetworkStatusManager.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation
import Network

enum NetworkStatus: String {
    case connected
    case disconnected
}

class NetworkStatusManager: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")

    @Published var status: NetworkStatus = .connected

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.status = .connected

                } else {
                    self.status = .disconnected
                }
            }
        }
        monitor.start(queue: queue)
    }
}
