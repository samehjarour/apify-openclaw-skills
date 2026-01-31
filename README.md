# Apify Skills for OpenClaw

This repository contains Apify agent skills converted to OpenClaw format for use with ClawdHub.

## Skills Included

| Skill | Description | Emoji |
|-------|-------------|-------|
| `apify-moltbook-scraper` | Scrape Moltbook - the social network for AI agents | 🦞 |
| `apify-ultimate-scraper` | Universal AI-powered web scraper for any platform | 🕷️ |
| `apify-lead-generation` | B2B/B2C lead generation from multiple platforms | 📊 |
| `apify-audience-analysis` | Audience demographics and behavior analysis | 👥 |
| `apify-actor-development` | Develop and deploy Apify Actors | 🛠️ |
| `apify-actorization` | Convert existing projects into Apify Actors | 📦 |
| `apify-brand-reputation-monitoring` | Track reviews, ratings, and brand mentions | ⭐ |
| `apify-competitor-intelligence` | Analyze competitor strategies | 🔍 |
| `apify-content-analytics` | Track engagement metrics and content performance | 📈 |
| `apify-influencer-discovery` | Find and evaluate influencers | 🌟 |
| `apify-market-research` | Analyze market conditions and opportunities | 📊 |
| `apify-trend-analysis` | Discover and track emerging trends | 📉 |

## Prerequisites

All skills require:
- **APIFY_TOKEN** - Get your token from [Apify Console](https://console.apify.com/account/integrations)
- **Node.js 20.6+** - For native `--env-file` support
- **mcpc CLI** - Install with `npm install -g @apify/mcpc`

## Installation

### Option 1: Install from ClawdHub (after publishing)

```bash
npx clawhub@latest install apify/apify-ultimate-scraper
```

### Option 2: Local Installation

Copy the `skills/apify` folder to your OpenClaw skills directory:

```bash
# For workspace-specific skills
cp -r skills/apify ~/.openclaw/skills/

# Or for project-specific skills
cp -r skills/apify ./skills/
```

### Option 3: Direct GitHub Reference

Add to your `~/.openclaw/openclaw.json`:

```json
{
  "skills": {
    "load": {
      "extraDirs": ["path/to/this/repo/skills/apify"]
    }
  }
}
```

## Publishing to ClawdHub

To publish these skills to ClawdHub:

1. **Sign in to ClawdHub**
   ```bash
   npx clawhub@latest login
   ```

2. **Publish each skill**
   ```bash
   cd skills/apify
   npx clawhub@latest publish apify-ultimate-scraper
   npx clawhub@latest publish apify-lead-generation
   npx clawhub@latest publish apify-audience-analysis
   # ... repeat for each skill
   ```

3. **Or publish all at once**
   ```bash
   for skill in skills/apify/*/; do
     npx clawhub@latest publish "$skill"
   done
   ```

## Contributing to OpenClaw Skills Repository

To submit these skills to the official OpenClaw skills repository:

1. **Fork the repository**
   ```bash
   gh repo fork openclaw/skills
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/skills.git openclaw-skills
   cd openclaw-skills
   ```

3. **Copy the skills**
   ```bash
   cp -r ../Hubspot-Test/skills/apify skills/apify
   ```

4. **Create a pull request**
   ```bash
   git add skills/apify
   git commit -m "Add Apify agent skills for web scraping and data extraction"
   git push origin main
   gh pr create --title "Add Apify skills" --body "Adds 11 Apify skills for web scraping, lead generation, and data extraction"
   ```

## Configuration

Add your Apify token to your environment:

```bash
# Add to .env file
APIFY_TOKEN=your_token_here

# Or add to ~/.openclaw/openclaw.json
{
  "skills": {
    "entries": {
      "apify-ultimate-scraper": {
        "enabled": true,
        "apiKey": "your_apify_token"
      }
    }
  }
}
```

## Links

- [Apify Documentation](https://docs.apify.com)
- [Apify Console](https://console.apify.com)
- [OpenClaw Documentation](https://docs.openclaw.ai)
- [ClawdHub](https://clawdhub.com)
- [Original Apify Skills Repository](https://github.com/apify/agent-skills)

## License

These skills are adapted from the [Apify Agent Skills](https://github.com/apify/agent-skills) repository.
