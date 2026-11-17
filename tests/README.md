# Varbase AI Media Base - functional test suite

## Functional acceptance tests (varbase-e2e: Playwright + Cucumber)

A browser BDD acceptance suite under `tests/features/`, driven by
[`@vardot/varbase-e2e`](https://www.npmjs.com/package/@vardot/varbase-e2e)
(Playwright + Cucumber) and its Drupal steps. The recipe needs no step
definitions or named selectors of its own. The suite runs against a Varbase 11
site with the recipe applied, logged in as the webmaster.

| Feature | What it holds the recipe to |
|---|---|
| `01-01-01-install` | AI, SVG Image and AI Media are installed; there are no AI media types; generated images are saved as Image and SVGs as SVG Image; Generate with AI sits inside the Image and SVG Image tabs |
| `02-01-01-insert-media` | Insert Media in Full HTML allows Image and SVG Image |
| `03-01-01-permissions` | Content editor, Content admin and Site admin may generate media with AI and create Image and SVG Image media; Site admin may change the AI Media settings, not the AI providers |

No scenario calls an AI provider, so the suite spends no credit.

### Running locally

```bash
# No scripts: varbase-e2e's postinstall would scaffold over our files.
npm install --ignore-scripts
npx playwright install --only-shell chromium
# DDEV serves https with its own certificate authority.
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
LAUNCH_URL=https://your-site.ddev.site npm test
# Another administrator account than webmaster / dD.123123ddd:
LAUNCH_URL=https://your-site.ddev.site LOGIN_USER=admin LOGIN_PASS=secret npm test
# One part of the suite:
FEATURES="tests/features/03-*.feature" npm test
# Every step resolves to one definition, no browser:
npm test -- --dry-run
```

`VARBASE_E2E_STEP_TIMEOUT` sets the step timeout (60 seconds here);
varbase-e2e writes an HTML report from the json one when the run ends
(`VARBASE_E2E_REPORT_DISABLE=1` turns it off).

Reports, screenshots and videos are written under `tests/reports`,
`tests/screenshots` and `tests/videos` (git-ignored).

### CI

- `validate`: `🧩 varbase-e2e dry run` resolves every step and fails on an
  undefined or ambiguous one (cucumber-js itself exits 0 on a dry run).
- `pre-test`: `🏗️ Varbase site` builds a fresh Varbase 11 site with the
  recipe from the checkout, applies the recipe twice, dumps the database and
  caches the built site.
- `test`: `🧪 functional (Varbase)` restores the dump, serves the site with
  Apache and writes `tests/reports/cucumber_report--varbase--all.json`
  (`CUCUMBER_JSON`) and its own HTML and PDF report.
- `report`: `📊 Create reports` merges every test job's JSON with
  `jq -s 'add'` and writes one HTML and PDF report with varbase-e2e's
  `generate-reports`.
- A failed scenario is retried once (`retry: 1` in `cucumber.js`).
