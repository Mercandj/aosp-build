
# ############################################################################## #
# ####                                AOSP                                  #### #
# ####                          Build by Mercandj                           #### #
# ####                  https://source.android.com/setup                    #### #
# ############################################################################## #

# Done on an external SSD 500Go Mac case sensitive partition.

# ############################################################################## #
# ####                             Downloading                              #### #
# ####           https://source.android.com/setup/build/downloading         #### #

echo "[Mercandalli][Download] Create ./bin folder"
mkdir ./bin

echo "[Mercandalli][Download] Download repo tools and chmod on it"
curl https://storage.googleapis.com/git-repo-downloads/repo > ./bin/repo
chmod a+x ./bin/repo

echo "[Mercandalli][Download] Initialize repo on android-10.0.0_r39"
./bin/repo init -u https://android.googlesource.com/platform/manifest -b android-10.0.0_r39

echo "[Mercandalli][Download] Synchronize repo"
./bin/repo sync

# Download proprietary binaries
# https://source.android.com/setup/build/downloading#obtaining-proprietary-binaries
# https://developers.google.com/android/drivers
# https://developers.google.com/android/drivers#sargoqq3a.200705.002
echo "[Mercandalli][Download] Proprietary binaries: Google Vendor image"
curl -L https://dl.google.com/dl/android/aosp/google_devices-crosshatch-pd1a.180720.030-d85db144.tgz --output ./google_vendor_binaries.tgz
tar -xvf google_vendor_binaries.tgz
./extract-google_devices-crosshatch.sh # I ACCEPT
# rm ./extract-google_devices-crosshatch.sh

echo "[Mercandalli][Download] Proprietary binaries: Qualcomm GPS, Audio, Camera, Gestures, Graphics, DRM, Video, Sensors"
curl -L https://dl.google.com/dl/android/aosp/qcom-crosshatch-pd1a.180720.030-bf86f269.tgz --output ./qualcomm_binaries.tgz
tar -xvf qualcomm_binaries.tgz
./extract-qcom-crosshatch.sh # I ACCEPT
# rm ./extract-qcom-crosshatch.sh

# ####                             Downloading                              #### #
# ############################################################################## #

# ############################################################################## #
# ####                              Building                                #### #
# ####            https://source.android.com/setup/build/building           #### #

echo "[Mercandalli][Build] envsetup.sh"
source build/envsetup.sh

echo "[Mercandalli][Build] lunch"
lunch aosp_sargo-userdebug # Pixel 3a

echo "[Mercandalli][Build] m"
m

# 1/ If error at "m" step on MacOs
# "internal error: Could not find a supported mac sdk: 
# ["10.10" "10.11" "10.12" "10.13" "10.14"]"
# Resolved [here](https://stackoverflow.com/questions/50760701/could-not-find-a-supported-mac-sdk-10-10-10-11-10-12-10-13?noredirect=1&lq=1)
# thanks to this [repo](https://github.com/phracker/MacOSX-SDKs).
# Complete your missing versions on your local directory
# `/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs`

# 2/ If error at "m" step on MacOs
# "FAILED: out/target/product/sargo/obj/ETC/treble_sepolicy_tests_26.0_intermediates/treble_sepolicy_tests_26.0"
# then try "make SELINUX_IGNORE_NEVERALLOWS=true" as explained here
# https://stackoverflow.com/a/59100048/12057504

# ####                              Building                                #### #
# ############################################################################## #
