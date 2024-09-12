local config = {
  cmd = { 'jdtls' },
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
}
require('jdtls').start_or_attach(config)
