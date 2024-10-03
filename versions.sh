# Versions to build this Docker image for
meteor_versions=( \
	'3.0-beta.0' \
  '3.0-beta.6' \
  '3.0-rc.2' \
  '3.0-rc.4'
)

# If METEOR_VERSION is defined
if [ -n "$METEOR_VERSION" ]; then
  # Only build the specified version
  meteor_versions=("$METEOR_VERSION")
fi
