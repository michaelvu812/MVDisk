MVDisk
======

A delightful MVDisk class to detect total available/free disk space/used disk space on the device for iOS written in Swift.

## Methods

```objective-c
MVDisk.formatter(diskSpace)
MVDisk.freeDiskSpace()
MVDisk.totalDiskSpace()
MVDisk.usedDiskSpace()
MVDisk.applicationSpace()
MVDisk.freeDiskSpaceFormatter()
MVDisk.totalDiskSpaceFormatter()
MVDisk.usedDiskSpaceFormatter()
MVDisk.applicationSpaceFormatter()
```

## Example

```objective-c
NSLog("Formatter %@", MVDisk.formatter(130))
NSLog("Free Disk Space %llu", MVDisk.freeDiskSpace())
NSLog("Total Disk Space %llu", MVDisk.totalDiskSpace())
NSLog("Used Disk Space %llu", MVDisk.usedDiskSpace())
NSLog("App Space %llu", MVDisk.applicationSpace())
NSLog("Free Disk Space Format %@", MVDisk.freeDiskSpaceFormatter())
NSLog("Total Disk Space Format %@", MVDisk.totalDiskSpaceFormatter())
NSLog("Used Disk Space Format %@", MVDisk.usedDiskSpaceFormatter())
NSLog("App Space Format %@", MVDisk.applicationSpaceFormatter())
```

## Installation

Add MVDisk.swif file to your project and use it

## Author

Michael Vu

- https://github.com/Namvt
- namvt@rubify.com

## License

MVDisk is available under the MIT license. See the LICENSE file for more info.