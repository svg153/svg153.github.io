# Professional profile synchronization plan

## Source of truth

- `profile.json` in this public repository is the **proposed canonical source for public, current-state positioning**: display name, current professional headline, short biographies, current employer, public affiliations and month-level work history. It does not currently synchronize other sites.
- `svg153/cv/data/sources/mac.json` remains the private source for detailed CV history and RenderCV generation.
- `svg153/mac/CV/MAC.json` is a legacy/private CV variant. Before automating synchronization, decide whether to generate this variant from `svg153/cv` or deprecate it.
- Historical event/talk materials, recordings, old job applications and dated social posts are **not** downstream targets. Keep the employer/title that was accurate when those artifacts were created.

## Consumers (future)

| Consumer | Public fields | Integration approach |
| --- | --- | --- |
| `svg153/svg153.github.io` | current headline, tagline, about, metadata | local build-time profile transformation |
| `svg153/web` | current job and summary, SEO metadata | fetch `profile.json` during build, do not rewrite old timeline entries |
| `svg153/blog` | current about, metadata and newsletter bio | Astro build-time import/fetch |
| `svg153/svg153` | GitHub profile README intro | generated or CI-checked Markdown fragment |
| `svg153/cv` / `svg153/mac` | employment history and truthful role details | CV remains private; validate shared public fields against public profile |
| LinkedIn, Sessionize, GitHub Stars, X, DEV | headline and adapted short bios | manual publication with copy-ready output and platform-specific limits |

## Incremental roll-out

1. Audit fields, their owners, and content limits; review the proposed `profile.json` schema.
2. Add a deterministic lint/export command that validates dates, lengths and inconsistent current-employer strings. Render Markdown and JSON snippets for each consumer, with a dry-run diff.
3. Add build-time consumption to public sites. Prefer existing GitHub Actions and Astro tooling, without duplicating secrets or credentials in public repositories.
4. Add a manual approval workflow to propose PRs on consumer repositories. Do not auto-merge employment changes or overwrite manually maintained talk history.
5. Reconcile the two MAC sources, retain the most complete historical content, and validate that RenderCV and Manfred continue to accept their schema.

## Guardrails

- No claim that `profile.json` is automatically distributed today.
- Do not expose private CV fields, email, personal phone numbers, client identities, or confidential work in public builds.
- Never change archived speaker bio snapshots, historical materials or applications merely to modernize a headline.
- Current employment history must include an accurate end date for Lunik; verify the exact day before merging the CV PRs.
- Keep the employer-facing headline `Developer Platforms & AI SDLC Architect @ Accenture` separate from the corporate title `Custom Software Engineering Manager`.
