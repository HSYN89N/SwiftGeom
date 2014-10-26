//
//  Vector3.swift
//  Arpeggios
//
//  Created by Marcin Pędzimąż on 22.10.2014.
//  Copyright (c) 2014 Marcin Pedzimaz. All rights reserved.
//

import UIKit

class Vector3 {
    
    internal var x : Float32 = 0
    internal var y : Float32 = 0
    internal var z : Float32 = 0
    
    init() {
        
        x = 0
        y = 0
        z = 0
    }
    
    init(value: Float32) {
        
        x = value
        y = value
        z = value
    }
    
    init(x:Float32, y:Float32, z:Float32) {
     
        self.x = x
        self.y = y
        self.z = z
    }
    
    init(other: Vector3) {
    
        x = other.x
        y = other.y
        z = other.z
    }
}

extension Vector3 : Equatable {
    
    func isFinite() -> Bool {
        
        return x.isFinite && y.isFinite && z.isFinite
    }
    
    func distance(other: Vector3) -> Float32 {
        
        let result = self - other;
        return sqrt( result.dot(result) )
    }
    
    func distanceSquared(other: Vector3) -> Float32 {
        
        let result = self - other;
        return result.dot(result)
    }

    func normalize() {
        
        let m = magnitude()
        
        if m > 0 {
            
            let il = 1.0 / m
            
            x *= il
            y *= il
            z *= il
        }
    }
    
    func setMagnitude(lenght: Float32) {
    
        let m = magnitude()
        
        if m > 0 {
            
            let newLength = lenght / m
            
            x *= newLength
            y *= newLength
            z *= newLength
        }
    }
    
    func magnitude() -> Float32 {
        
        return sqrtf( x*x + y*y + z*z)
    }
    
    func magnitudeSquared() -> Float32 {
        
        return x*x + y*y + z*z
    }
    
    func dot(v: Vector3 ) -> Float32 {
        
        return x * v.x + y * v.y + z * v.z
    }
    
    func lerp(a: Vector3, b: Vector3, coef: Float32) {
        
        let result = a + ( b - a) * coef
        
        x = result.x
        y = result.y
        z = result.z
    }
    
    func cross(left: Vector3, right: Vector3) {
    
        var a = (left.y * right.z) - (left.z * right.y);
        var b = (left.z * right.x) - (left.x * right.z);
        var c = (left.x * right.y) - (left.y * right.x);
        
        x = a;
        y = b;
        z = c;
    }
    
    func cross(other: Vector3) -> Vector3 {
    
        var temp = Vector3()
        temp.cross(self,right: other)
    
        return temp
    }
    
    func zero() {
    
        x = 0
        y = 0
        z = 0
    }
    
    func set(other: Vector3) {

        x = other.x
        y = other.y
        z = other.z
    }
    
    func setNegative(other: Vector3) {
    
        x = -other.x
        y = -other.y
        z = -other.z
    }
    
    func setNegative() {
        
        x = -x
        y = -y
        z = -z
    }
    
    func min(other: Vector3) {
    
        x = fminf(x, other.x)
        y = fminf(y, other.y)
        z = fminf(z, other.z)
    }

    func max(other: Vector3) {
        
        x = fmaxf(x, other.x)
        y = fmaxf(y, other.y)
        z = fmaxf(z, other.z)
    }

}

func ==(lhs: Vector3, rhs: Vector3) -> Bool {
    
    return (lhs.x == rhs.x) && (lhs.y == rhs.y) && (lhs.z == rhs.z)
}

func * (left: Vector3, right : Float32) -> Vector3 {
    
    return Vector3(x:left.x * right, y:left.y * right, z: left.z * right)
}

func * (left: Vector3, right : Vector3) -> Vector3 {
    
    return Vector3(x:left.x * right.x, y:left.y * right.y, z: left.z * right.z)
}

func / (left: Vector3, right : Float32) -> Vector3 {
    
    return Vector3(x:left.x / right, y:left.y / right, z:left.z / right)
}

func / (left: Vector3, right : Vector3) -> Vector3 {
    
    return Vector3(x:left.x / right.x, y:left.y / right.y, z:left.z / right.z)
}

func + (left: Vector3, right: Vector3) -> Vector3 {
    
    return Vector3(x:left.x + right.x, y:left.y + right.y, z:left.z + right.z)
}

func - (left: Vector3, right: Vector3) -> Vector3 {
    
    return Vector3(x:left.x - right.x, y:left.y - right.y, z:left.z - right.z)
}

func + (left: Vector3, right: Float32) -> Vector3 {
    
    return Vector3(x:left.x + right, y:left.y + right, z:left.z + right)
}

func - (left: Vector3, right: Float32) -> Vector3 {
    
    return Vector3(x:left.x - right, y:left.y - right, z:left.z - right)
}

func += (inout left: Vector3, right: Vector3) {
    
    left = left + right
}

func -= (inout left: Vector3, right: Vector3) {
    
    left = left - right
}

func *= (inout left: Vector3, right: Vector3) {
    
    left = left * right
}

func /= (inout left: Vector3, right: Vector3) {
    
    left = left / right
}