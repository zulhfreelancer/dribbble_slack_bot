#!/bin/bash

# Directory path of this bash script.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
PARENT=`dirname $DIR`
GRANDPARENT=`dirname $PARENT`

# Copy all from root folder into /scripts/dev/ folder except the /script/ itself.
echo "============================================================================"
echo "Step 1/4 - Copying files into './scripts/dev/' folder..."
echo "============================================================================"
rsync -a --exclude='scripts' $GRANDPARENT/ $DIR # don't remove that trailing slash
printf "// Done\n\n"

echo "============================================================================"
echo "Step 2/4 - Packaging artifacts..."
echo "============================================================================"
sam package \
  --template-file $DIR/template.yaml \
  --output-template-file $DIR/packaged-template.yaml \
  --s3-bucket dribbble-slack-bot-dev
printf "// Done\n\n"

echo "============================================================================"
echo "Step 3/4 - Deploying artifacts..."
echo "============================================================================"
sam deploy \
  --template-file $DIR/packaged-template.yaml \
  --stack-name dribbbleSlackBotFunction \
  --capabilities CAPABILITY_IAM
printf "// Done\n\n"

# Remove all copied files and folders.
# Only leave the original files of this /scripts/dev/ folder.
echo "============================================================================"
echo "Step 4/4 - Clean up..."
echo "============================================================================"
find $DIR -type f -not \( -name "*.sh" -o -name "*.yaml" \) -delete
rm -f $DIR/packaged-template.yaml
rm -rf $DIR/.bundle $DIR/vendor
printf "// Done\n\n"
