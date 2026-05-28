# Insights Index

**Last Updated**: 2024-05-28  
**Total Insights**: 1 (example)  
**Version**: 1.0.0

## Quick Navigation

- [Quick Reference Log](#quick-reference-log) - Fast agent reference (read by lead-architect on startup)
- [Platform Insights](#platform-insights) - Platform-specific discoveries
- [Pattern Insights](#pattern-insights) - Pattern adaptations and improvements  
- [Operational Insights](#operational-insights) - Failures, prerequisites, environment handling

---

## Quick Reference Log

**File**: `/insights/quick-reference.log`

**Purpose**: One-liner insights read by `lead-architect` on every run startup

**Format**: `CATEGORY|SUBCATEGORY|ONE-LINE SOLUTION`

**Current Entries**: 0 (will grow with production runs)

**Example Format**:
```
Platform|REST-API-Rate-Limiting|Check 429 status, use Retry-After header, exponential backoff 60→120→240s
Pattern|Idempotency-Check|Always check current state before create/update operations
Operational|Hung-Installer|Monitor log filesize every 10s, kill if no growth for 60s
```

---

## Platform Insights

### REST API Platforms

#### [EXAMPLE: REST API Rate Limiting Detection](platform-insights/EXAMPLE_rest-api-rate-limiting.md)
**Added**: 2024-05-28 | **Applies To**: REST APIs with 429 responses | **Impact**: 95% → 100% success rate

*NOTE: This is an example file showing the format. Real insights from production runs will appear below.*

---

### CLI-Based Platforms
*Coming from production runs*

### Database Platforms
*Coming from production runs*

### SOAP API Platforms
*Coming from production runs*

---

## Pattern Insights

*No insights captured yet. First runs will populate this section.*

### Idempotency Patterns
*Coming from production runs*

### Error Recovery Patterns
*Coming from production runs*

### Testing Patterns
*Coming from production runs*

---

## Operational Insights

*No insights captured yet. First runs will populate this section.*

### Prerequisite Installation
*Coming from production runs*

### Environment Detection
*Coming from production runs*

### Recovery Strategies
*Coming from production runs*

---

## How This Index Works

This index is **automatically maintained** by the `learning-evolution-specialist` agent.

After each run:
1. Agent captures and sanitizes lessons
2. Writes insight files to appropriate category
3. Updates this index with new entries
4. Commits to git (or leaves for maintainer review)

**Format for entries**:
```markdown
### [Insight Title](category/filename.md)
**Added**: YYYY-MM-DD | **Applies To**: Characteristics | **Impact**: Brief description
```

---

## Statistics

### By Category
- Platform Insights: 0
- Pattern Insights: 0
- Operational Insights: 0

### Top Contributors
*Agent runs that contributed most insights - tracked after first runs*

### Success Rate Improvements
*Before/after metrics from applied insights - tracked after applications*

---

*This index grows with every production run. Check back after your team's first few builds!*
