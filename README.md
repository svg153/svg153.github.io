# svg153.github.io

Personal website of [Sergio Valverde](https://svg153.github.io), focused on
Platform Engineering, DevOps, GitHub, automation and technology communities.

The site is a dependency-free static website made with HTML, CSS and local
assets. It contains a short profile, technical interests, links to the blog,
YouTube channel and conference talks, as well as social links.

## Local development

The repository can be previewed with any static HTTP server. With Docker:

```bash
make up
```

Then open [http://localhost:8080](http://localhost:8080). Stop the container
with:

```bash
make down
```

You can also use Python when Docker is not available:

```bash
python3 -m http.server 8080
```

## Deployment

Every push to `main` is published automatically to GitHub Pages by
[`deploy.yml`](.github/workflows/deploy.yml). The workflow can also be started
manually from the Actions tab.

The repository must use **GitHub Actions** as the Pages build and deployment
source in the repository's Pages settings. The workflow only publishes the
contents of this repository; it does not build or copy another project.

## Repository structure

| Path | Purpose |
| --- | --- |
| `index.html` | Main page |
| `style.css` | Main stylesheet |
| `css/` | Legacy and supporting styles kept by the site |
| `images/` | Avatar and image assets |
| `icons/` | Local SVG icons |
| `.github/workflows/` | Checks and Pages deployment |
| `docker-compose.yaml` | Local Nginx preview |

## Checks

Pull requests and pushes to `main` run the configured pre-commit checks. To run
them locally, install [pre-commit](https://pre-commit.com/) and execute:

```bash
pre-commit run --all-files
```

## License

See [LICENSE.md](LICENSE.md).
