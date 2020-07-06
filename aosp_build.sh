
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
lunch # 3

echo "[Mercandalli][Build] m"
m

# ####                              Building                                #### #
# ############################################################################## #
