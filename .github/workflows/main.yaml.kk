name: MAIN Pipeline

run-name: "${{ github.event.pull_request.title ||
  github.event.head_commit.message ||
  format('MAIN {0} Workflow in {1} {2} by {3}', github.event.repository.name, github.ref_type, github.ref_name, github.actor) }}"

on:
  pull_request:
    branches:
      - "*"
    # paths-ignore:
    #   - ".github/**"
    #   - "CHANGELOG.md"

  push:
    branches:
      - "main"
    paths-ignore:
      - ".github/**"
      - "CHANGELOG.md"

  workflow_dispatch:


jobs:

  npm_test:
    # use docker run inside the tests
    name: NPM run test
    runs-on: ubuntu-latest
    services:
      mysql:
        image: mirror.gcr.io/mysql:8.0.20
        options: >-
          --health-cmd="mysqladmin ping"
          --health-interval=10s
          --health-timeout=5s
          --health-retries=3
        ports:
          - 3306:3306
        env:
          MYSQL_ROOT_PASSWORD: test-db-password
          MYSQL_DATABASE: test-db-name
          MYSQL_USER: test-db-user
          MYSQL_PASSWORD: test-db-password
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v2
        with:
          node-version: '16'
      - name: Run test
        run: |
          npm ci
          npm run test
    env:
      TEST_DB_NETWORK: host
 
