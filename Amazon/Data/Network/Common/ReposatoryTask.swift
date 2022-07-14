//
//  ReposatoryTask.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//


class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
