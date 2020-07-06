# AOSP build

Done on MacOS. Two try:
- 2019-02: Description on this readme
- 2020-07: CF `aosp_setup.sh` and this readme

## First try to compile - 2019-02

### Notes

- Build done on Mac OS Mojave
- I was compiling that on an external SSD 500Go mac case sensitive partition.
- After cloning and building, the directory size: 160 Go.
- After the cloning step, when trying to `make`, I got this error `Could not find a supported mac sdk: [“10.10” “10.11” “10.12” “10.13”]` resolved [here](https://stackoverflow.com/questions/50760701/could-not-find-a-supported-mac-sdk-10-10-10-11-10-12-10-13?noredirect=1&lq=1) thanks to this [repo](https://github.com/phracker/MacOSX-SDKs). Complete your missing versions on your local directory `/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs`

### Clone

Check https://source.android.com/setup/build/requirements

* `mkdir ./bin`
* `curl https://storage.googleapis.com/git-repo-downloads/repo > ./bin/repo`
* `chmod a+x ./bin/repo`
* `cd ./bin`

Check the version [here](https://source.android.com/setup/start/build-numbers.html#source-code-tags-and-builds)
* `repo init -u https://android.googlesource.com/platform/manifest -b android-9.0.0_r30`
* `repo sync`

Takes more than 10 hours on my computer

### Build

Check https://source.android.com/setup/build/building

* `make clobber`
* `source build/envsetup.sh`
* `lunch aosp_arm-eng`
* `make -j16`

Takes more than 3 hours on my computer

### Create zip file

Check https://stackoverflow.com/questions/36949605/creating-flashable-zip-from-android-source-code

> If you would create a full update zip package (system, boot, and recovery partitions), you can use for a hypothetical tardis device:

**first, build the target-files .zip**

* `. build/envsetup.sh && lunch aosp_arm-eng`
* `mkdir dist_output`
* `make dist DIST_DIR=dist_output`
* `ls -l dist_output/*target_files*`

-rw-r----- 1 user eng  69965275 Sep 29 15:51 ...-target_files.zip


> The target-files .zip contains everything needed to construct OTA packages. Now you can construct it with:

* `./build/tools/releasetools/ota_from_target_files ./dist_output/aosp_arm-target_files-eng.jonathan.zip ota_update.zip`
unzipping target target-files...
done.
* `ls -l ota_update.zip`
-rw-r----- 1 user eng 62236561 Sep 29 15:58 ota_update.zip

# 