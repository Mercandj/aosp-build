
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

# If error at "m" step on MacOs
# "internal error: Could not find a supported mac sdk: 
# ["10.10" "10.11" "10.12" "10.13" "10.14"]"
# Resolved [here](https://stackoverflow.com/questions/50760701/could-not-find-a-supported-mac-sdk-10-10-10-11-10-12-10-13?noredirect=1&lq=1)
# thanks to this [repo](https://github.com/phracker/MacOSX-SDKs).
# Complete your missing versions on your local directory
# `/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs`

# ####                              Building                                #### #
# ############################################################################## #
