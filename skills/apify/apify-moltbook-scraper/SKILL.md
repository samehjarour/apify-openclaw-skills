---
name: apify-moltbook-scraper
description: Scrape Moltbook - the social network for AI agents. Extract posts, AI agent profiles, submolts (communities), and platform statistics. Monitor AI agent activity, track trending discussions, and analyze the emerging agent ecosystem.
metadata: {"openclaw":{"emoji":"🦞","homepage":"https://apify.com/sameh.jarour/moltbook-scraper","requires":{"env":["APIFY_TOKEN"],"bins":["node"]},"primaryEnv":"APIFY_TOKEN","install":[]}}
---

# Moltbook Scraper

Scrape data from [moltbook.com](https://www.moltbook.com) - the "front page of the agent internet" where AI agents post, discuss, and upvote content.

## Prerequisites

- `.env` file with `APIFY_TOKEN`
- Node.js 20.6+ (for native `--env-file` support)

## What is Moltbook?

Moltbook is a social network for AI agents. Think of it as Reddit for AI - agents create posts, join communities (submolts), earn karma, and interact with each other. It's a unique window into how AI agents communicate and what they discuss.

## Available Data Types

| Type | Description |
|------|-------------|
| **Posts** | Agent discussions with titles, content, votes, and comments |
| **Agents** | AI agent profiles with karma, followers, descriptions |
| **Submolts** | Communities (like subreddits) with member counts |
| **Stats** | Platform totals (agents, posts, comments, submolts) |
| **Search** | Semantic search results (requires API key) |

## Workflow

Copy this checklist and track progress:

```
Task Progress:
- [ ] Step 1: Understand user goal and select scrape mode
- [ ] Step 2: Configure input parameters
- [ ] Step 3: Run the scraper
- [ ] Step 4: Summarize results and offer follow-ups
```

### Step 1: Understand User Goal

Determine what the user wants:

| User Goal | Scrape Mode | Key Parameters |
|-----------|-------------|----------------|
| Get latest posts | `posts` | `postSortBy: "new"` |
| Find top/trending posts | `posts` | `postSortBy: "top"` or `"hot"` |
| Get posts from a community | `posts` | `submoltFilter: "community-name"` |
| List AI agents by karma | `agents` | `agentSortBy: "karma"` |
| Get specific agent profiles | `agents` | `agentNames: ["Agent1", "Agent2"]` |
| List communities | `submolts` | - |
| Get platform stats | `stats` | - |
| Search discussions | `search` | `searchQuery: "your query"` |
| Get everything | `all` | - |

### Step 2: Configure Input

Build the input JSON based on user needs:

```json
{
  "scrapeMode": "posts",
  "maxItems": 100,
  "postSortBy": "new",
  "submoltFilter": "",
  "agentSortBy": "karma",
  "agentNames": [],
  "includeComments": false,
  "searchQuery": "",
  "forcePlaywright": false
}
```

#### Input Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `scrapeMode` | string | `all`, `posts`, `agents`, `submolts`, `stats`, `search` | `all` |
| `maxItems` | integer | Max items per category (1-10000) | `100` |
| `postSortBy` | string | `new`, `top`, `hot`, `rising`, `discussed` | `new` |
| `submoltFilter` | string | Filter posts by community name | - |
| `agentSortBy` | string | `recent`, `followers`, `karma` | `karma` |
| `agentNames` | array | Specific agent names to scrape | - |
| `includeComments` | boolean | Include post comments | `false` |
| `searchQuery` | string | Semantic search query | - |
| `forcePlaywright` | boolean | Force browser scraping | `false` |

### Step 3: Run the Scraper

**Quick answer (display in chat):**
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input 'JSON_INPUT'
```

**Export to CSV:**
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input 'JSON_INPUT' \
  --output YYYY-MM-DD_moltbook_posts.csv \
  --format csv
```

**Export to JSON:**
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input 'JSON_INPUT' \
  --output YYYY-MM-DD_moltbook_data.json \
  --format json
```

### Step 4: Summarize Results

After completion, report:
- Number of items scraped (posts, agents, submolts)
- Key insights from the data
- Platform stats if available

**Suggested follow-ups:**

| If User Got | Suggest Next |
|-------------|--------------|
| Posts | Analyze sentiment, find trending topics |
| Agents | Compare karma/followers, identify influencers |
| Submolts | Explore specific communities for posts |
| Search results | Deep-dive into specific discussions |

## Example Use Cases

### 1. Monitor AI Agent Activity
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input '{"scrapeMode": "posts", "maxItems": 50, "postSortBy": "new"}'
```

### 2. Find Top AI Agents by Karma
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input '{"scrapeMode": "agents", "maxItems": 20, "agentSortBy": "karma"}' \
  --output top_agents.csv --format csv
```

### 3. Explore a Specific Community
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input '{"scrapeMode": "posts", "submoltFilter": "general", "maxItems": 30}'
```

### 4. Get Platform Statistics
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input '{"scrapeMode": "stats"}'
```

### 5. List All Communities
```bash
node --env-file=.env ${CLAUDE_PLUGIN_ROOT}/reference/scripts/run_actor.js \
  --actor "sameh.jarour/moltbook-scraper" \
  --input '{"scrapeMode": "submolts", "maxItems": 100"}' \
  --output communities.json --format json
```

## Output Fields

### Posts
| Field | Description |
|-------|-------------|
| `type` | Always "post" |
| `id` | Post unique ID |
| `title` | Post title |
| `content` | Post body text |
| `author.name` | Agent who posted |
| `submolt.name` | Community name |
| `upvotes` | Number of upvotes |
| `commentCount` | Number of comments |
| `createdAt` | When posted |
| `postUrl` | Link to post |

### Agents
| Field | Description |
|-------|-------------|
| `type` | Always "agent" |
| `name` | Agent name |
| `description` | Agent bio |
| `karma` | Karma score |
| `followerCount` | Number of followers |
| `isClaimed` | Whether claimed by human |
| `profileUrl` | Link to profile |

### Submolts
| Field | Description |
|-------|-------------|
| `type` | Always "submolt" |
| `name` | Community slug |
| `displayName` | Display name |
| `description` | Community description |
| `memberCount` | Number of members |
| `submoltUrl` | Link to community |

### Stats
| Field | Description |
|-------|-------------|
| `type` | Always "stats" |
| `totalAgents` | Platform-wide agent count |
| `totalSubmolts` | Platform-wide community count |
| `totalPosts` | Platform-wide post count |
| `totalComments` | Platform-wide comment count |
| `scrapedAt` | Timestamp |

## Error Handling

| Error | Solution |
|-------|----------|
| `APIFY_TOKEN not found` | Create `.env` with `APIFY_TOKEN=your_token` |
| `Run FAILED` | Check Apify console for details |
| `0 results` | Try different scrapeMode or increase maxItems |
| `Timeout` | Reduce maxItems or increase --timeout |

## Links

- [Moltbook](https://www.moltbook.com) - The social network for AI agents
- [Actor on Apify Store](https://apify.com/sameh.jarour/moltbook-scraper)
- [GitHub Repository](https://github.com/samehjarour/moltbook-scraper)
