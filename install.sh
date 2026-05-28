#!/bin/bash
# Quick installation script for Hyaish Agents Claude Code plugin

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_AGENTS_DIR="$HOME/.claude/agents"
PLUGIN_LINK="$CLAUDE_AGENTS_DIR/hyaish-agents-plugin"

echo "🚀 Installing Hyaish Agents Plugin"
echo "=================================="
echo ""
echo "📁 Repository: $REPO_DIR"
echo "📁 Claude agents directory: $CLAUDE_AGENTS_DIR"
echo ""

# Check if Claude agents directory exists
if [ ! -d "$CLAUDE_AGENTS_DIR" ]; then
  echo "❌ Claude agents directory not found: $CLAUDE_AGENTS_DIR"
  echo ""
  echo "Are you sure Claude Code is installed?"
  exit 1
fi

# Check if symlink already exists
if [ -L "$PLUGIN_LINK" ]; then
  CURRENT_TARGET=$(readlink "$PLUGIN_LINK")
  echo "⚠️  Symlink already exists:"
  echo "   $PLUGIN_LINK -> $CURRENT_TARGET"
  echo ""
  read -p "Remove and recreate? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm "$PLUGIN_LINK"
    echo "   Removed existing symlink"
  else
    echo "   Skipping symlink creation"
    echo ""
    echo "To manually update:"
    echo "  rm $PLUGIN_LINK"
    echo "  ln -s $REPO_DIR/claude $PLUGIN_LINK"
    exit 0
  fi
elif [ -e "$PLUGIN_LINK" ]; then
  echo "❌ Path exists but is not a symlink: $PLUGIN_LINK"
  echo ""
  echo "Please remove or rename it manually, then run this script again"
  exit 1
fi

# Create symlink
ln -s "$REPO_DIR/claude" "$PLUGIN_LINK"
echo "✅ Created symlink: $PLUGIN_LINK -> $REPO_DIR/claude"
echo ""

# Verify installation
echo "🔍 Verifying installation..."
echo ""

if [ -f "$REPO_DIR/claude/verify.sh" ]; then
  cd "$REPO_DIR/claude"
  bash verify.sh
else
  echo "⚠️  Verification script not found"
  echo ""
  echo "Manual verification:"
  echo "  cd $REPO_DIR/claude"
  echo "  ./verify.sh"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Next Steps"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Test the plugin:"
echo "   /ansible-collection-swarm --help"
echo ""
echo "2. Build your first collection:"
echo "   /ansible-collection-swarm EPIC-XXX"
echo ""
echo "3. Read documentation:"
echo "   cat $REPO_DIR/README.md"
echo "   cat $REPO_DIR/claude/ansible-collection-swarm/QUICKSTART.md"
echo ""
