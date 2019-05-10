# script taken from http://support.revealapp.com/kb/getting-started/load-the-reveal-server-via-an-xcode-breakpoint
# modifed so configuration just has to contain "Debug" not be equal to it

if [[ ! "${CONFIGURATION}" =~ "Debug" ]]; then
   echo "Reveal Server not loaded: Current build configuration is not 'Debug'."
   exit 0
fi

REVEAL_APP_PATH=$(mdfind kMDItemCFBundleIdentifier="com.ittybittyapps.Reveal2" | head -n 1)
BUILD_SCRIPT_PATH="${REVEAL_APP_PATH}/Contents/SharedSupport/Scripts/reveal_server_build_phase.sh"
if [ "${REVEAL_APP_PATH}" -a -e "${BUILD_SCRIPT_PATH}" ]; then

  if [ "${PLATFORM_NAME}" == "appletvos" ]; then
     REVEAL_LIB_DIR="tvOS-Libraries"
  else
     REVEAL_LIB_DIR="iOS-Libraries"
  fi

  REVEAL_SCRIPTS_DIR="${BUILD_SCRIPT_PATH%/*}"
  REVEAL_SERVER_FILENAME="RevealServer.framework"
  REVEAL_SERVER_PATH="${REVEAL_SCRIPTS_DIR}/../${REVEAL_LIB_DIR}/${REVEAL_SERVER_FILENAME}"

  if [ -e "${REVEAL_SERVER_PATH}" ]; then
     cp -Rf "$REVEAL_SERVER_PATH" "${CODESIGNING_FOLDER_PATH}/"
     if [ -n "${EXPANDED_CODE_SIGN_IDENTITY}" ]; then
       codesign -fs "${EXPANDED_CODE_SIGN_IDENTITY}" "${CODESIGNING_FOLDER_PATH}/${REVEAL_SERVER_FILENAME}"
     fi
     echo "${REVEAL_SERVER_FILENAME} is included in this build, and has been copied to $CODESIGNING_FOLDER_PATH"

     LLDB_INIT_FILE=~/.lldbinit
     LLDB_INIT_MAGIC_STRING="### Reveal LLDB commands support"

     if [ ! -e "${LLDB_INIT_FILE}" ] || ! grep -q "${LLDB_INIT_MAGIC_STRING}" "${LLDB_INIT_FILE}"; then
         echo "Note: it looks like Reveal Server debugger commands are not installed. Please refer to 'Loading the Reveal Server via an Xcode Breakpoint' section of the Integration Guide for information about loading Reveal Server included in this build."
     fi
  else
   echo "Reveal Server not loaded: RevealServer.framework could not be found."
  fi

else
   echo "Reveal Server not loaded: Cannot find a compatible Reveal app."
fi
