local rootdir = vim.fs.dirname(vim.fs.find({'mvnw'}, { upward = true })[1])

if rootdir ~= nil and rootdir ~= '' then
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('ThymeleafCompile', { clear = true }),
    pattern = '*.html,*.css,*.md',
    callback = function()
      local Job = require('plenary.job')
      Job:new({
        command = './mvnw',
        args = { 'compile' },
        cwd = rootdir
      }):start()
    end
})
end
