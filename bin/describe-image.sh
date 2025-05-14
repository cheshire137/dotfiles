#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Describe image
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Image URL" }
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Use GitHub Models to describe an image. Useful for alt text. Use with llm CLI from https://github.com/simonw/llm. Install the GitHub Models extension via `llm install llm-github-models`. Create a GitHub personal access token (PAT) with Models read access via https://github.com/settings/personal-access-tokens/new. Then run `llm keys set github` and paste in your PAT. Works on macOS by copying the model's response to the clipboard. Tries to format the model's response in text for use in Markdown as an image's alt attribute.
# @raycast.author cheshire137
# @raycast.authorURL https://raycast.com/cheshire137

/opt/homebrew/bin/llm -m github/gpt-4o-mini "Describe this image. Avoid using square brackets, parentheses, or double quotes in your response. You can use single quotes." -a $1 | pbcopy
