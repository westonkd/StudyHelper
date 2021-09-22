//
//  Timer.swift
//  Study Helper
//
//  Created by Weston Dransfield on 9/22/21.
//

import Foundation

class CourseTimer: ObservableObject {
    @Published var activeCourseId = ""
    @Published var secondsElapsed = 0
    
    private var startDate: Date?
    private var timer: Timer?
    private var frequency: TimeInterval { 1.0 / 60.0 }
    
    // Start the timer for the given course
    func start(cousreId: String) {
        startDate = Date()
        Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            if let self = self, let startDate = self.startDate {
                let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
                self.update(secondsElapsed: Int(secondsElapsed))
            }
        }
    }
    
    // Stope the timer, but retain state
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    // Stop the timer and reset state
    func reset() {
        stop()
        activeCourseId = ""
        secondsElapsed = 0
        startDate = nil
        timer = nil
    }
    
    private func update(secondsElapsed: Int) {
        self.secondsElapsed = secondsElapsed
    }
}
