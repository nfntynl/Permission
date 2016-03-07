//
//  Utilities.swift
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

internal let Application = UIApplication.sharedApplication()
internal let UserDefaults = NSUserDefaults.standardUserDefaults()
internal let NotificationCenter = NSNotificationCenter.defaultCenter()

internal func delay(delay: Double, queue: dispatch_queue_t = dispatch_get_main_queue(), callback: () -> Void) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(time, queue, callback)
}

extension UIControlState: Hashable {
    public var hashValue: Int { return Int(rawValue) }
}

internal extension String {
    static let title = "title"
    static let message = "message"
    static let cancel = "cancel"
    static let settings = "setttings"
    
    static let nsLocationWhenInUseUsageDescription = "NSLocationWhenInUseUsageDescription"
    static let nsLocationAlwaysUsageDescription = "NSLocationAlwaysUsageDescription"
    
    static let requestedNotifications = "sorry_requestedNotifications"
    static let requestedLocationAlways = "sorry_requestedLocationAlways"
}