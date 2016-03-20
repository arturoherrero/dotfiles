# cd to into the current Finder location
cdf() {
  local target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# Open the current location/repository with SourceTree
alias sourcetree="open -a SourceTree ."
