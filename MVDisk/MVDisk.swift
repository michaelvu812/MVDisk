//
//  MVDisk.swift
//  MVDisk
//
//  Created by Michael on 17/6/14.
//  Copyright (c) 2014 Michael Vu. All rights reserved.
//

import Foundation

let Bytes = 1024
let MegaBytes = Bytes * 1024
let GigaBytes = MegaBytes * 1024

class MVDisk:NSObject {
    class func formatter(diskSpace:CLongLong) -> String {
        var formatter = String()
        var bytes:Double = 1.0*Double(diskSpace)
        var kilobytes:Double = bytes/Double(Bytes)
        var megabytes:Double = bytes/Double(MegaBytes)
        var gigabytes:Double = bytes/Double(GigaBytes)
        if gigabytes >= 1.0 {
            formatter = String(format: "%.2f GB", arguments: [gigabytes])
        } else if megabytes >= 1.0 {
            formatter = String(format: "%.2f MB", arguments: [megabytes])
        } else if kilobytes >= 1.0 {
            formatter = String(format: "%.2f KB", arguments: [kilobytes])
        } else if bytes >= 1.0 {
            formatter = String(format: "%.2f bytes", arguments: [bytes])
        } else {
            formatter = String(format: "Zero byte")
        }
        return formatter
    }
    class func freeDiskSpace() -> CLongLong {
        var freeDisk = NSFileManager.defaultManager().attributesOfFileSystemForPath(NSHomeDirectory(), error: nil).objectForKey(NSFileSystemFreeSize).longLongValue
        return freeDisk
    }
    class func applicationSpace() -> CLongLong {
        let fileManager = NSFileManager.defaultManager()
        let folderPath = NSBundle.mainBundle().bundlePath
        let filesArray = fileManager.subpathsOfDirectoryAtPath(folderPath, error: nil)
        var fileSize:CLongLong = 0
        for file:AnyObject in filesArray {
            let fileName = file as String
            let fileDictionary = fileManager.fileAttributesAtPath(folderPath.stringByAppendingPathComponent(fileName), traverseLink: true)
            fileSize += CLongLong(fileDictionary.fileSize())
        }
        return fileSize
    }
    class func totalDiskSpace() -> CLongLong {
        var totalDisk = NSFileManager.defaultManager().attributesOfFileSystemForPath(NSHomeDirectory(), error: nil).objectForKey(NSFileSystemSize).longLongValue
        return totalDisk
    }
    class func usedDiskSpace() -> CLongLong {
        var usedSpace = self.totalDiskSpace() - self.freeDiskSpace()
        return usedSpace
    }
    class func freeDiskSpaceFormatter() -> String {
        return self.formatter(self.freeDiskSpace())
    }
    class func applicationSpaceFormatter() -> String {
        return self.formatter(self.applicationSpace())
    }
    class func totalDiskSpaceFormatter() -> String {
        return self.formatter(self.totalDiskSpace())
    }
    class func usedDiskSpaceFormatter() -> String {
        return self.formatter(self.usedDiskSpace())
    }
}