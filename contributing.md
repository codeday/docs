---
title: Contributing to Docs
nav_order: 99
---

# Contributing to Docs

This guide explains how this docs site is structured and how to add, edit, or remove pages.

## Tech Stack

- **Jekyll** (static site generator)
- **just-the-docs** theme (handles navigation, search, callouts)
- **GitHub Pages** for hosting

## Running Locally

```bash
# Requires Ruby 3.x (managed via rbenv)
bundle install
bundle exec jekyll serve
```

The site will be available at `http://localhost:4000/`.

## Codebase Layout

```
docs/
├── index.md                        # Homepage
├── _config.yml                     # Site-wide settings (theme, search, callouts)
├── _sass/                          # Custom stylesheets
├── assets/                         # Global assets (logo, favicon)
├── contributing.md                 # This page
│
├── mentor-training/                # Top-level section
│   ├── index.md                    #   Section landing page
│   ├── glossary.md                 #   Child page
│   └── dashboard.md                #   Child page
│
├── events/                         # Top-level section
│   ├── index.md                    #   Section landing page
│   ├── codeday-events.md           #   Child page
│   ├── volunteer-central.md        #   Child page
│   ├── operations/                 #   Sub-section
│   │   ├── index.md                #     Sub-section landing page
│   │   └── *.md                    #     Child pages
│   ├── workshops/                  #   Sub-section
│   │   ├── index.md
│   │   └── *.md
│   └── posters-and-pdfs/
│       └── index.md
│
├── events/organizer-guide/         # Top-level section (separate from Events)
│   ├── index.md                    #   Landing page
│   ├── overview/                   #   Sub-section
│   │   ├── index.md
│   │   └── *.md
│   ├── planning/
│   │   ├── index.md
│   │   └── *.md
│   ├── day-of/
│   │   ├── index.md
│   │   └── *.md
│   └── wrap-up/
│       ├── index.md
│       └── *.md
│
└── labs/                           # Top-level section
    └── ...
```

## Navigation Hierarchy

just-the-docs supports **3 levels** of navigation:

| Level | Front matter | Example |
|-------|-------------|---------|
| **Top-level** | `nav_order: N` | Events, Mentor Training |
| **Child** | `parent: [Top-level title]` | Operations (under Events) |
| **Grandchild** | `parent: [Child title]`, `grand_parent: [Top-level title]` | Creating a New Event (under Operations) |

Sections that contain child pages need `has_children: true` in their front matter.

## Front Matter Templates

### Top-level section landing page

```yaml
---
title: My Section
has_children: true
nav_order: 5
---
```

### Child page (level 2)

```yaml
---
title: My Page
parent: My Section
nav_order: 1
---
```

### Sub-section with its own children (level 2, with children at level 3)

```yaml
---
title: My Sub-section
parent: My Section
has_children: true
nav_order: 2
---
```

### Grandchild page (level 3)

```yaml
---
title: My Deep Page
parent: My Sub-section
grand_parent: My Section
nav_order: 1
---
```

## Adding a New Page

1. **Pick where it belongs** in the hierarchy (see layout above).
2. **Create a `.md` file** with a kebab-case filename (e.g., `my-new-page.md`).
3. **Add front matter** using the templates above. Set `parent:` to match the *exact* `title:` of the parent page.
4. **Set `nav_order:`** to control ordering among siblings. Lower numbers appear first.
5. **Write content** using standard Markdown.

### Adding a new section

To add a new section with child pages:

1. Create a directory: `my-section/`
2. Create `my-section/index.md` with `has_children: true`
3. Add child pages in the same directory with `parent: My Section`

## Callouts

The site has several callout styles configured in `_config.yml`:

```markdown
{: .note }
> This is a note.

{: .important }
> This is important.

{: .warning }
> This is a warning.

{: .highlight }
> This is highlighted.

{: .new }
> This marks something new.
```

You can also add custom titles:

```markdown
{: .note-title }
> **Custom Title**
>
> Callout body text here.
```

## Images

Place images in a subdirectory next to the page that uses them, or in a shared `images/` folder within the section. Reference them with relative paths:

```markdown
![Description](images/my-image.png)
```

## Removing a Page

1. Delete the `.md` file.
2. Remove any references/links to it from other pages.
3. If it was a section with `has_children: true`, also remove or reassign its child pages.

## File Naming Conventions

- Use **kebab-case** for filenames: `my-page-name.md`
- Section landing pages are always `index.md` inside their directory
- Keep filenames descriptive and concise

## Tips

- `nav_order` only affects ordering among siblings at the same level — you can reuse numbers across different sections.
- Pages without front matter won't appear in the navigation.
- The `title:` field in front matter is what appears in the sidebar nav. The `# heading` in the body is what appears on the page itself — they don't have to match but usually should.
- Use `has_toc: false` in front matter to hide the auto-generated table of contents on a page.
- Run `bundle exec jekyll build` to check for build errors before pushing.
