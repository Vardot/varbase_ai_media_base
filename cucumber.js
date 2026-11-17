// cucumber-js config for the Varbase AI Media Base functional testing suite.
//   LAUNCH_URL=https://your-site.ddev.site npm test
// The site is Varbase 11 with this recipe applied; see tests/README.md.

const password = process.env.LOGIN_PASS || 'dD.123123ddd';

// varbase-e2e sets the step timeout from this when its steps load.
process.env.VARBASE_E2E_STEP_TIMEOUT = process.env.VARBASE_E2E_STEP_TIMEOUT || '60000';

// CUCUMBER_JSON names one CI job's report, e.g. cucumber_report--varbase--all.
const reportName = process.env.CUCUMBER_JSON || 'cucumber_report';

module.exports = {
  default: {
    // One retry absorbs a step timeout from runner load.
    retry: 1,
    requireModule: ['tsx/cjs'],
    require: ['node_modules/@vardot/varbase-e2e/tests/step-definitions/**/*.js'],
    // FEATURES runs part of the suite, e.g. "tests/features/03-*.feature".
    paths: [process.env.FEATURES || 'tests/features/**/*.feature'],
    tags: process.env.CUCUMBER_TAGS || 'not @wip',
    format: ['pretty', `json:tests/reports/${reportName}.json`],
    worldParameters: {
      launchUrl: process.env.LAUNCH_URL || 'http://localhost',
      users: {
        Webmaster: {
          username: process.env.LOGIN_USER || 'webmaster',
          password,
        },
      },
      minWaitTime: {
        page: 8000,
        before_scenario: 0,
        after_scenario: 0,
        before_step: 0,
        after_step: 0,
      },
      // The recipe needs no named selectors of its own.
      selectors: {
        css: {},
        xpath: {},
        files: [],
        offset: 60,
      },
      screenshot: {
        dir: './tests/screenshots',
        onFailed: true,
        failedPrefix: 'failed_',
      },
      video: {
        mode: 'on-failure',
        dir: './tests/videos',
        size: { width: 1600, height: 1200 },
      },
      javascript: {
        mode: 'warn',
        levels: ['error'],
      },
    },
  },
};
