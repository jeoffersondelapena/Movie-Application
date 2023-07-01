//
//  TextDebounceManager.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation
import Combine

class TextDebounceManager: ObservableObject {
    @Published var searchText = ""
    @Published var debouncedText = ""
    private var previouslyDebouncedText = ""

    private var subscriptions = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { [weak self] debouncedText in
                guard let self = self else { return }
                if debouncedText != previouslyDebouncedText {
                    self.debouncedText = debouncedText
                    self.previouslyDebouncedText = debouncedText
                }
            }
            .store(in: &subscriptions)
    }
}
