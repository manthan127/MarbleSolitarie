//
//  PageType.swift
//  MarbleSolitarie
//
//  Created by PC on 10/11/21.
//

import SwiftUI

enum PageType: String, CaseIterable {
    
    case standerd
    case twoSquare
    case german
    case simplest
    case french
    case rotetedSquare
    case dimond
    case asymmetrical
    case anotherDimond
    case shuriken
    case odd
    case hammer
    
    case triangle
    case difTriangle
    case hexagonal
    case rhombas
    case propeller
    case extendedTriangle
    case hourGlass
    case star
    case trapze
    case arrow
    case parallelogram
    case flower
    
    var size: (y: Int, x: Int) {
        switch self {
        case .standerd: return (7, 7)
        case .twoSquare: return (5, 5)
        case .german: return (9, 9)
        case .simplest: return (6, 6)
        case .french: return (7, 7)
        case .rotetedSquare: return (9, 9)
        case .dimond: return (7, 9)
        case .asymmetrical: return (8, 8)
        case .anotherDimond: return (9, 7)
        case .shuriken: return (9, 9)
        case .odd: return (7, 5)
        case .hammer: return (6, 9)
            
        case .triangle: return (1, 6)
        case .difTriangle: return (3, 8)
        case .hexagonal: return (5, 13)
        case .rhombas: return (1, 7)
        case .propeller: return (4, 10)
        case .extendedTriangle: return (2, 7)
        case .hourGlass: return (4, 8)
        case .star: return (5, 13)
        case .trapze: return (4, 7)
        case .arrow: return (4, 10)
        case .parallelogram: return (7, 10)
        case .flower: return (5, 13)
        }
    }
    
    var maxWidth: CGFloat {
        switch self {
        case .triangle: return 6
        case .difTriangle: return 8
        case .hexagonal: return 9
        case .rhombas: return 4
        case .propeller: return 7
        case .extendedTriangle: return 6
        case .hourGlass: return 4
        case .star: return 7
        case .trapze: return 7
        case .arrow: return 8
        case .parallelogram: return 10
        case .flower: return 8
            
        default: return 0
        }
    }
    
    var flat: [Int] {
        switch self {
        case .standerd: return [0,1,5,6,7,8,12,13,35,36,40,41,42,43,47,48]
        case .twoSquare: return [0,1,5,6,18,19,23,24]
//        case .german: return [0,1,2] + (6...11) + (15...20) + [24,25,26,54,55,56] + (60...65) + (69...74) + [78,79,80]
        case .simplest: return[]
        case .french: return [0,1,5,6,7,13,35,41,42,43,47,48]
        case .rotetedSquare: return [0,1,2,3,5,6,7,8,9,10,11,15,16,17,18,19,25,26,27,35,45,53,54,55,61,62,63,64,65,69,70,71,72,73,74,75,77,78,79,80]
        case .dimond: return [0,8,27,35,36,37] + (43...47) + (51...57) + [59,60,61,62]
//        case .asymmetrical: return [0,1] + (5...9) + (13...17) + [21,22,23,48,49] + (53...57) + [61,62,63]
        case .anotherDimond: return [0,1,2] + (4...8) + [12,13,14,20,42,48,49,50] + (54...58) + [60,61,62]
//        case .shuriken: return [0,1,2,3] + (5...11) + (15...20) + [24,25,26,27,35,45,53,54,55,56] + (60...65) + (69...75) + [77,78,79,80]
        case .odd: return [0,4,5,9,25,29,30,34]
        case .hammer: return [0,1,2,6,7,8,36,37,38] + (42...47) + [51,52,53]
            
        case .triangle: return []
        case .difTriangle: return [0,2,8,11,16,20,32,38]
        case .hexagonal: return [-65,-74,-78,-79,-87,-88,-91,-92,-93,-100,-101,-102,-104,-105,-106,-107,-113,-114,-115,-116]
        case .rhombas: return [-28,-32,-35,-36,-39,-40,-42,-43,-44,-46,-47,-48]
        case .propeller: return [10,14,20,21,24,25,-40,-47,-50,-51,54,-57,-58,-60,-61,-62,64,65,-67,-68,-69]
        case .extendedTriangle: return [7,9,14,17,21,25,-35,37,38,39,-41]
        case .hourGlass: return [-8,-12,-16,-17,-20,-21,-24,-25,-29,-30,-32,-33,-38,-39]
        case .star: return [0,-1,-3,4,-13,-14,-17,-18,-39,-46,-52,-53,-59,-60,-65,-66,-73,-74,-78,-79,-87,-88,-91,-92,-93,-94,-95] + (-102...(-98)) + (-109...(-104)) + (-116...(-111))
        case .trapze: return []
        case .arrow: return [14,24,25,34,35,36,-40,45,46,-47,-50,-51,56,-57,-58,-60,-61,-62,-67,-68,-69]
        case .parallelogram: return [17,27,28,37,38,39]
        case .flower: return [0,2,3,4,13,26,32,46,52,60,-65,66,-74,-78,-79,-80,-86,-87,-88,-91,-92,-93,99,-100,-101,-102,104,105] + (-110...(-106)) + (-116...(-112))
        default: return []
        }
    }
    
    var emptyPoint: (Int, Int) {
        switch self {
        case .standerd: return (3, 3)
        case .twoSquare: return (2, 2)
        case .german: return (4, 4)
        case .simplest: return (1, 1)
        case .french: return (1, 3)
        case .rotetedSquare: return (4, 4)
        case .dimond: return (2, 5)
        case .asymmetrical: return (4, 3)
        case .anotherDimond: return (4, 3)
        case .shuriken: return (4, 4)
        case .odd: return (3, 2)
        case .hammer: return (3, 4)
            
        case .triangle: return (0, 0)
        case .difTriangle: return (5, 7)
        case .hexagonal: return (4, 4)
        case .rhombas: return (1, 0)
        case .propeller: return (3, 3)
        case .extendedTriangle: return (2, 1)
        case .hourGlass: return (2, 2)
        case .star: return(4, 4)
        case .trapze: return (1, 0)
        case .arrow: return (2, 3)
        case .parallelogram: return (0, 0)
        case .flower: return (4, 4)
        }
    }
}

