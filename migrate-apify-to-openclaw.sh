#!/bin/bash
# Migration script: Apify Agent Skills -> OpenClaw format
# This script converts Apify skills to OpenClaw-compatible format

set -e

APIFY_SOURCE="apify-skills-source/skills"
OPENCLAW_OUTPUT="skills/apify"
AUTHOR="apify"

echo "🔄 Migrating Apify skills to OpenClaw format..."
echo "Source: $APIFY_SOURCE"
echo "Output: $OPENCLAW_OUTPUT"
echo ""

# Create output directory
mkdir -p "$OPENCLAW_OUTPUT"

# Get list of skills
skills=$(ls "$APIFY_SOURCE")

for skill in $skills; do
    echo "📦 Processing: $skill"
    
    skill_src="$APIFY_SOURCE/$skill"
    skill_dest="$OPENCLAW_OUTPUT/$skill"
    
    # Create skill directory
    mkdir -p "$skill_dest"
    
    # Copy all files from the skill
    cp -r "$skill_src"/* "$skill_dest/"
    
    echo "   ✅ Copied to $skill_dest"
done

echo ""
echo "✅ Migration complete!"
echo ""
echo "Skills migrated to: $OPENCLAW_OUTPUT/"
echo ""
echo "Next steps:"
echo "1. Review and update the SKILL.md files with OpenClaw metadata"
echo "2. Test skills locally"
echo "3. Publish to ClawdHub: npx clawhub@latest publish skills/apify/<skill-name>"
