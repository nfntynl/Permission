//
//  PermissionSet.swift
//
// Copyright (c) 2015 Damien (http://delba.io)
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

public class PermissionSet {
    /// The permissions in the set.
    public let permissions: Set<Permission>
    
    /// The delegate of the permission set.
    public var delegate: PermissionSetDelegate?
    
    /// The permission set status
    public var status: PermissionStatus {
        let statuses = permissions.map({ $0.status })
        
        for status in statuses where status == .Denied {
            return .Denied
        }
        
        for status in statuses where status == .Disabled {
            return .Disabled
        }
        
        for status in statuses where status == .NotDetermined {
            return .NotDetermined
        }
        
        return .Authorized
    }
    
    /**
     Creates and returns a new permission set containing the specified buttons.
     
     - parameter buttons: The buttons contained by the set.
     
     - returns: A newly created set.
     */
    public convenience init(_ buttons: PermissionButton...) {
        self.init(buttons: buttons)
    }
    
    /**
     Creates and returns a new permission set containing the specified buttons.
     
     - parameter buttons: The buttons contained by the set.
     
     - returns: A newly created set.
     */
    public convenience init(_ buttons: [PermissionButton]) {
        self.init(buttons: buttons)
    }
    
    private init(buttons: [PermissionButton]) {
        self.permissions = Set(buttons.map({ $0.permission }))
        
        for permission in permissions {
            permission.sets.append(self)
        }
    }
    
    internal func didRequestPermission(permission: Permission) {
        delegate?.permissionSet(self, didRequestPermission: permission)
    }
}

public protocol PermissionSetDelegate {
    /**
     Tells the delegate that the specified permission has been requested.
     
     - parameter permissionSet: The permission set containing the requested permission.
     - parameter permission:    The requested permission.
     */
    func permissionSet(permissionSet: PermissionSet, didRequestPermission permission: Permission)
}

public extension PermissionSetDelegate {
    /**
     Tells the delegate that the specified permission has been requested.
     
     - parameter permissionSet: The permission set containing the requested permission.
     - parameter permission:    The requested permission.
     */
    func permissionSet(permissionSet: PermissionSet, didRequestPermission permission: Permission) {}
}